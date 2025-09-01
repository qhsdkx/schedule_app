import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_test_project/generated/l10n.dart';
import 'package:flutter_test_project/widgets/typography.dart';
// поправь импорт под свой путь:
import 'package:flutter_test_project/services/storage.dart';

import '../blocs/schedule_bloc/schedule_bloc.dart';

class CalendarWidget extends StatefulWidget {
  final Map<String, String> request;
  const CalendarWidget(this.request, {Key? key}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  static final _kFirstDay = DateTime.utc(2020, 8, 9);
  static final _kLastDay = DateTime.utc(2035, 1, 1);

  CalendarFormat _format = CalendarFormat.week;
  late DateTime _selectedDay;
  late DateTime _focusedDay;

  // чтобы не дергать сторедж на каждый билд
  late final Future<String?> _languageFuture;

  DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);
  DateTime _clamp(DateTime d) {
    final x = _dateOnly(d);
    if (x.isBefore(_kFirstDay)) return _kFirstDay;
    if (x.isAfter(_kLastDay)) return _kLastDay;
    return x;
  }

  @override
  void initState() {
    super.initState();
    final today = _dateOnly(DateTime.now());
    _selectedDay = today;
    _focusedDay = today;
    _languageFuture = Storage().loadLanguage(); // например 'ru' / 'en'

    final bloc = context.read<ScheduleBloc>();
    bloc.add(ChangeDateOfClasses(today));
    bloc.add(LoadSchedule(today));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _languageFuture,
      builder: (context, snap) {
        final languageCode = (snap.data != null && snap.data!.isNotEmpty)
            ? snap.data!
            : Localizations.localeOf(context).languageCode;

        // локально подменяем локаль только под этот поддерево
        return Localizations.override(
          context: context,
          locale: Locale(languageCode),
          child: Builder(
            builder: (ctx) {
              final cs = Theme.of(ctx).colorScheme;

              return BlocListener<ScheduleBloc, ScheduleState>(
                listener: (context, state) {
                  if (state is ScheduleLoaded) {
                    final d = _clamp(state.date);
                    setState(() {
                      _selectedDay = d;
                      _focusedDay = d;
                    });
                  }
                },
                child: TableCalendar(
                  locale: languageCode, // TableCalendar берёт этот код
                  firstDay: _kFirstDay,
                  lastDay: _kLastDay,
                  focusedDay: _focusedDay,
                  calendarFormat: _format,
                  availableCalendarFormats: {
                    CalendarFormat.week: S.of(ctx).week,
                    CalendarFormat.twoWeeks: S.of(ctx).twoWeeks,
                  },
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  weekendDays: const [DateTime.sunday],

                  // подсвечиваем только выбранный день
                  selectedDayPredicate: (d) => isSameDay(d, _selectedDay),
                  headerStyle: HeaderStyle(
                    titleTextStyle: Style.bodyL.copyWith(fontSize: 16),
                    formatButtonTextStyle: Style.bodyRegular,
                  ),
                  calendarStyle: CalendarStyle(
                    isTodayHighlighted: false, // “сегодня” не выделяем
                    defaultTextStyle: Style.bodyRegular,
                    defaultDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                    ),
                    weekendDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    selectedDecoration: BoxDecoration(
                      color: cs.primary,
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                    ),
                    selectedTextStyle:
                        Style.bodyRegular.copyWith(color: cs.onPrimary),
                  ),

                  onFormatChanged: (fmt) => setState(() => _format = fmt),

                  onDaySelected: (selected, focused) {
                    final d = _clamp(selected);
                    setState(() {
                      _selectedDay = d;
                      _focusedDay = d; // фокус всегда туда, куда кликнули
                    });
                    final bloc = context.read<ScheduleBloc>();
                    bloc.add(ChangeDateOfClasses(d));
                    bloc.add(LoadSchedule(d));
                  },

                  onPageChanged: (fd) =>
                      setState(() => _focusedDay = _clamp(fd)),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
