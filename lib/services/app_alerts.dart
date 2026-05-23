import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_project/widgets/typography.dart';

import '../generated/l10n.dart';
import '../hometaskproviders/hometask_provider.dart';
import '../models/homework.dart';
import '../models/scientific_work.dart';
import '../models/grade.dart';
import '../scientificworkproviders/scientific_work_provider.dart';
import '../gradeproviders/grade_provider.dart';

@immutable
class AppAlerts {
  const AppAlerts._();

  static displaySnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static Future<void> showAlertDeleteDialog({
    required BuildContext context,
    required WidgetRef ref,
    required Homework task,
  }) async {
    Widget cancelButton = TextButton(
      child: Text(S.of(context).no, style: Style.buttonS),
      onPressed: () => Navigator.pop(context),
    );
    Widget deleteButton = TextButton(
      onPressed: () async {
        await ref.read(tasksProvider.notifier).deleteTask(task).then(
          (value) {
            displaySnackbar(context, S.of(context).taskDeleted);
            Navigator.pop(context);
          },
        );
      },
      child: Text(S.of(context).yes, style: Style.buttonS),
    );

    AlertDialog alert = AlertDialog(
      title: Text(S.of(context).taskDeleteAlert,
          style: Style.bodyL.copyWith(fontSize: 18)),
      actions: [deleteButton, cancelButton],
    );

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static Future<void> showAlertDeleteWorkDialog({
    required BuildContext context,
    required WidgetRef ref,
    required ScientificWork work,
  }) async {
    Widget cancelButton = TextButton(
      child: Text(S.of(context).no, style: Style.buttonS),
      onPressed: () => Navigator.pop(context),
    );
    Widget deleteButton = TextButton(
      onPressed: () async {
        await ref.read(scientificWorksProvider.notifier).deleteWork(work).then(
          (value) {
            displaySnackbar(context, S.of(context).workDeleted);
            Navigator.pop(context);
          },
        );
      },
      child: Text(S.of(context).yes, style: Style.buttonS),
    );

    AlertDialog alert = AlertDialog(
      title: Text(S.of(context).deleteWork,
          style: Style.bodyL.copyWith(fontSize: 18)),
      actions: [deleteButton, cancelButton],
    );

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static Future<void> showAlertDeleteDisciplineDialog({
    required BuildContext context,
    required WidgetRef ref,
    required GradeEntry grade,
  }) async {
    Widget cancelButton = TextButton(
      child: Text(S.of(context).no, style: Style.buttonS),
      onPressed: () => Navigator.pop(context),
    );
    Widget deleteButton = TextButton(
      onPressed: () async {
        await ref.read(gradesProvider.notifier).deleteGrade(grade).then(
          (value) {
            displaySnackbar(context, S.of(context).disciplineDeleted);
            Navigator.pop(context);
          },
        );
      },
      child: Text(S.of(context).yes, style: Style.buttonS),
    );

    AlertDialog alert = AlertDialog(
      title: Text(S.of(context).deleteDiscipline,
          style: Style.bodyL.copyWith(fontSize: 18)),
      actions: [deleteButton, cancelButton],
    );

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
