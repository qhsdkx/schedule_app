import 'dart:async';
import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/services/parser/parser.dart';
import 'package:flutter_test_project/services/storage.dart';
import 'package:flutter_test_project/integrations/telegram.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  late DateTime currentDay = _dateOnly(DateTime.now());
  PlatformFile? globalFile;

  bool get _useTg => kIsWeb && TelegramWebApp.isAvailable;

  ScheduleBloc() : super(ScheduleInitial()) {
    on<ScheduleEvent>((event, emit) {});
    on<PickFile>(_pickFile);
    on<ChangeDateOfClasses>(_onChangeDate);
    on<SaveSchedule>(_saveScheduleToCache);
    on<LoadSchedule>(_loadSchedule);
  }

  DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

  FutureOr<void> _onChangeDate(
      ChangeDateOfClasses event, Emitter<ScheduleState> emit) {
    emit(ScheduleReeloadDate());
    currentDay = event.selectedDay;
    if (currentDay.weekday != DateTime.sunday) {
      emit(ChangedDate());
    } else {
      emit(const ScheduleDayIsEmpty('There aren\'t classes. Chill out, bro'));
    }
  }

  FutureOr<void> _pickFile(PickFile event, Emitter<ScheduleState> emit) async {
    emit(ScheduleInitial());

    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: const ['xlsx'],
      withData: true,
      allowMultiple: false,
    );

    if (result == null || result.files.isEmpty) {
      emit(const ScheduleError('Something went wrong'));
      print(result);
      return;
    }

    final file = result.files.single;
    if (kIsWeb && file.bytes == null) {
      emit(const ScheduleError('File read error'));
      return;
    }

    globalFile = file;
    emit(PickedFile(file));
  }

  FutureOr<void> _saveScheduleToCache(
      SaveSchedule event, Emitter<ScheduleState> emit) async {
    emit(SavingSchedule());

    try {
      if (globalFile == null) {
        emit(const ScheduleError('Select a file first'));
        return;
      }

      final parser = ExcelParsing(int.parse(event.numOfGroups));
      final days = await parser.parse(globalFile!) as List<Day>;
      if (!_useTg) {
        for (final day in days) {
          final classesForGroup =
              day.classes[int.parse(event.group)] ?? <String>[];
          final jsonString = jsonEncode(classesForGroup);
          await Storage().saveSchedule(day.date, jsonString);
        }
      } else {
        Storage().localStorageSaveSchedule(days, int.parse(event.group));
      }

      final time = parser.parseTimeOfClasses();
      if (!_useTg) {
        await Storage().saveTime(time);
      } else {
        Storage().localStorageSaveTime(time);
      }

      final classesData = parser.parseDataClasses();
      if (!_useTg) {
        await Storage().saveClassesData(classesData);
      } else {
        Storage().localStorageSaveDataClasses(classesData);
      }
      emit(SavedSchedule());
    } catch (e) {
      emit(ScheduleError('Import error: $e'));
    }
  }

  FutureOr<void> _loadSchedule(
      LoadSchedule event, Emitter<ScheduleState> emit) async {
    emit(ScheduleLoading());
    try {
      List<String> classes = [];
      String scheduleJson = '';
      if (!_useTg) {
        scheduleJson = await Storage().readSchedule(_dateToString(event.date));
      } else {
        classes = Storage().localStorageReadSchedule(_dateToString(event.date));
      }
      if (scheduleJson.isNotEmpty) {
        try {
          classes = jsonDecode(scheduleJson) as List<String>;
        } catch (_) {}
      }
      List<String> time = [];
      if (!_useTg) {
        time = await Storage().readTime();
      } else {
        time = Storage().localStorageReadTime();
      }

      if (classes.isEmpty) {
        emit(const ScheduleDayIsEmpty(''));
        return;
      }

      emit(ScheduleLoaded(classes, event.date, time));
    } catch (_) {}
    emit(ScheduleLoaded(List.empty(), event.date, List.empty()));
  }

  String _dateToString(DateTime date) {
    final y = date.year.toString().padLeft(4, '0');
    final m = date.month.toString().padLeft(2, '0');
    final d = date.day.toString().padLeft(2, '0');
    return '$y-$m-$d';
  }
}
