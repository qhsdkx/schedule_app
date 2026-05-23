import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_project/widgets/typography.dart';
import '../generated/l10n.dart';
import '../gradeproviders/grade_provider.dart';
import '../models/grade.dart';
import '../services/app_alerts.dart';
import '../widgets/common_text_field.dart';

class CreateGradeScreen extends ConsumerStatefulWidget {
  const CreateGradeScreen({super.key});

  @override
  ConsumerState<CreateGradeScreen> createState() => _CreateGradeScreenState();
}

class _CreateGradeScreenState extends ConsumerState<CreateGradeScreen> {
  final TextEditingController _disciplineController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _semesterController = TextEditingController();
  final TextEditingController _coursesNumberController =
      TextEditingController();
  final TextEditingController _additionalNoteController =
      TextEditingController();
  final TextEditingController _gradeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).addDiscipline, style: Style.h6),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonTextField(
                hintText: S.of(context).discipline,
                title: S.of(context).discipline,
                controller: _disciplineController,
              ),
              const SizedBox(height: 20),
              CommonTextField(
                hintText: S.of(context).gradeScale,
                title: S.of(context).gradeScale,
                controller: _gradeController,
              ),
              const SizedBox(height: 20),
              CommonTextField(
                hintText: S.of(context).note,
                title: S.of(context).note,
                maxLines: 3,
                controller: _noteController,
              ),
              const SizedBox(height: 20),
              CommonTextField(
                hintText: S.of(context).semester,
                title: S.of(context).semester,
                controller: _semesterController,
              ),
              const SizedBox(height: 20),
              CommonTextField(
                hintText: S.of(context).coursesNumber,
                title: S.of(context).coursesNumber,
                controller: _coursesNumberController,
              ),
              const SizedBox(height: 20),
              CommonTextField(
                hintText: S.of(context).additionalNote,
                title: S.of(context).additionalNote,
                maxLines: 3,
                controller: _additionalNoteController,
              ),
              const SizedBox(height: 30),
              _buildConfirmButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConfirmButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: FilledButton(
        onPressed: _createGrade,
        child: Text(S.of(context).confirmButton,
            style: Style.captionL.copyWith(fontSize: 14)),
      ),
    );
  }

  void _createGrade() async {
    final discipline = _disciplineController.text.trim();
    final gradeText = _gradeController.text.trim();
    final note = _noteController.text.trim();
    final semester = _semesterController.text.trim();
    final coursesNumber = _coursesNumberController.text.trim();
    final additionalNote = _additionalNoteController.text.trim();

    if (discipline.isEmpty) {
      AppAlerts.displaySnackbar(context, S.of(context).emptyDisciplineName);
      return;
    }

    if (gradeText.isEmpty) {
      AppAlerts.displaySnackbar(context, S.of(context).emptyGrade);
      return;
    }

    final gradeValue = int.tryParse(gradeText);
    if (gradeValue == null || gradeValue < 1 || gradeValue > 10) {
      AppAlerts.displaySnackbar(context, S.of(context).invalidGrade);
      return;
    }

    final gradeEntry = GradeEntry(
      discipline: discipline,
      grade: gradeValue,
      note: note,
      semester: semester,
      coursesNumber: coursesNumber,
      additionalNote: additionalNote,
    );

    await ref.read(gradesProvider.notifier).createGrade(gradeEntry).then((_) {
      AppAlerts.displaySnackbar(context, S.of(context).createdDiscipline);
      Navigator.of(context).pop();
    });
  }
}
