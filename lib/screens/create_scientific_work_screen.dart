import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_project/widgets/typography.dart';
import 'package:intl/intl.dart';
import '../generated/l10n.dart';
import '../scientificworkproviders/scientific_work_provider.dart';
import '../models/scientific_work.dart';
import '../services/app_alerts.dart';
import '../widgets/common_text_field.dart';

class CreateScientificWorkScreen extends ConsumerStatefulWidget {
  const CreateScientificWorkScreen({super.key});

  @override
  ConsumerState<CreateScientificWorkScreen> createState() =>
      _CreateScientificWorkScreenState();
}

class _CreateScientificWorkScreenState
    extends ConsumerState<CreateScientificWorkScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _selectedType = 'Article';
  DateTime _selectedDate = DateTime.now();

  final List<String> _workTypes = [
    'Article',
    'Conference',
    'Monograph',
    'Other'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).addWork, style: Style.h6),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonTextField(
                hintText: S.of(context).workTitle,
                title: S.of(context).workTitle,
                controller: _titleController,
              ),
              const SizedBox(height: 20),
              Text(S.of(context).workType, style: Style.bodyL),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedType,
                items: _workTypes.map((type) {
                  final displayType = type == 'Article'
                      ? S.of(context).article
                      : type == 'Conference'
                          ? S.of(context).conference
                          : type == 'Monograph'
                              ? S.of(context).monograph
                              : S.of(context).other;
                  return DropdownMenuItem(
                      value: type, child: Text(displayType));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedType = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    setState(() {
                      _selectedDate = picked;
                    });
                  }
                },
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: S.of(context).workDate,
                    border: const OutlineInputBorder(),
                  ),
                  child: Text(DateFormat.yMMMd().format(_selectedDate)),
                ),
              ),
              const SizedBox(height: 20),
              CommonTextField(
                hintText: S.of(context).workDescription,
                title: S.of(context).workDescription,
                maxLines: 5,
                controller: _descriptionController,
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
        onPressed: _createWork,
        child: Text(S.of(context).confirmButton,
            style: Style.captionL.copyWith(fontSize: 14)),
      ),
    );
  }

  void _createWork() async {
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();

    if (title.isEmpty) {
      AppAlerts.displaySnackbar(context, S.of(context).emptyWorkTitle);
      return;
    }

    final displayType = _selectedType == 'Article'
        ? S.of(context).article
        : _selectedType == 'Conference'
            ? S.of(context).conference
            : _selectedType == 'Monograph'
                ? S.of(context).monograph
                : S.of(context).other;

    final work = ScientificWork(
      title: title,
      type: displayType,
      date: DateFormat.yMMMd().format(_selectedDate),
      description: description,
    );

    await ref.read(scientificWorksProvider.notifier).createWork(work).then((_) {
      AppAlerts.displaySnackbar(context, S.of(context).createdWork);
      Navigator.of(context).pop();
    });
  }
}
