import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_test_project/models/grade.dart';
import 'package:flutter_test_project/widgets/typography.dart';

class GradeTile extends StatelessWidget {
  const GradeTile({
    super.key,
    required this.grade,
  });

  final GradeEntry grade;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: Row(
        children: [
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(grade.discipline, style: Style.bodyBold),
                const Gap(4),
                Text(grade.semester.isNotEmpty ? grade.semester : '',
                    style: Style.captionL),
              ],
            ),
          ),
          const Gap(8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: cs.primary.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              grade.grade.toString(),
              style: Style.titleM.copyWith(color: cs.primary),
            ),
          ),
          const Gap(16),
        ],
      ),
    );
  }
}
