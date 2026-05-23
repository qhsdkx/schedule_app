import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_project/screens/create_grade_screen.dart';
import 'package:flutter_test_project/widgets/typography.dart';
import '../blocs/settings_bloc/settings_bloc.dart';
import '../generated/l10n.dart';
import '../gradeproviders/grade_provider.dart';
import '../widgets/grade_tile.dart';
import '../services/app_alerts.dart';
import 'schedule_screen.dart';

class GradesScreen extends ConsumerWidget {
  const GradesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gradeState = ref.watch(gradesProvider);
    final grades = gradeState.grades;

    double averageGrade = 0.0;
    if (grades.isNotEmpty) {
      final sum = grades.fold<int>(0, (prev, g) => prev + g.grade);
      averageGrade = sum / grades.length;
    }

    return WillPopScope(
      onWillPop: () async {
        pushToMainScreen(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).grades, style: Style.h6),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => pushToMainScreen(context),
          ),
        ),
        body: Column(
          children: [
            if (grades.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(S.of(context).averageGrade, style: Style.bodyRegular),
                    const SizedBox(height: 8),
                    Text(
                      averageGrade.toStringAsFixed(2),
                      style: Style.h3.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ),
              ),
            Expanded(
              child: grades.isEmpty
                  ? Center(
                      child: Text(S.of(context).noGradesYet,
                          style:
                              Style.bodyRegular.copyWith(color: Colors.grey)),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: grades.length,
                      separatorBuilder: (_, __) =>
                          const Divider(height: 1, thickness: 0.5),
                      itemBuilder: (context, index) {
                        final grade = grades[index];
                        return InkWell(
                          onLongPress: () {
                            AppAlerts.showAlertDeleteDisciplineDialog(
                              context: context,
                              ref: ref,
                              grade: grade,
                            );
                          },
                          child: GradeTile(grade: grade),
                        );
                      },
                    ),
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 24, right: 12),
          child: FloatingActionButton(
            heroTag: 'grades-fab',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CreateGradeScreen()),
              );
            },
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            elevation: 6,
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  void pushToMainScreen(BuildContext context) {
    final bloc = context.read<SettingsBloc>();
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (_) => ScheduleScreen({'group': bloc.settings.group})),
    );
  }
}
