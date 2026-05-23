import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_project/screens/create_scientific_work_screen.dart';
import 'package:flutter_test_project/widgets/typography.dart';
import '../blocs/settings_bloc/settings_bloc.dart';
import '../generated/l10n.dart';
import '../scientificworkproviders/scientific_work_provider.dart';
import '../widgets/work_tile.dart';
import '../services/app_alerts.dart';
import 'schedule_screen.dart';

class ScientificWorksScreen extends ConsumerStatefulWidget {
  const ScientificWorksScreen({super.key});

  @override
  ConsumerState<ScientificWorksScreen> createState() =>
      _ScientificWorksScreenState();
}

class _ScientificWorksScreenState extends ConsumerState<ScientificWorksScreen> {
  @override
  Widget build(BuildContext context) {
    final workState = ref.watch(scientificWorksProvider);
    final works = workState.works;

    return WillPopScope(
      onWillPop: () async {
        pushToMainScreen(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).scientificWorks, style: Style.h6),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => pushToMainScreen(context),
          ),
        ),
        body: works.isEmpty
            ? Center(
                child: Text(S.of(context).noWorksYet,
                    style: Style.bodyRegular.copyWith(color: Colors.grey)),
              )
            : ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: works.length,
                separatorBuilder: (_, __) =>
                    const Divider(height: 1, thickness: 0.5),
                itemBuilder: (context, index) {
                  final work = works[index];
                  return InkWell(
                    onLongPress: () {
                      AppAlerts.showAlertDeleteWorkDialog(
                        context: context,
                        ref: ref,
                        work: work,
                      );
                    },
                    child: WorkTile(work: work),
                  );
                },
              ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 24, right: 12),
          child: FloatingActionButton(
            heroTag: 'scientific-works-fab',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CreateScientificWorkScreen()),
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
