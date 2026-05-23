import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_test_project/models/scientific_work.dart';
import 'package:flutter_test_project/widgets/typography.dart';

class WorkTile extends StatelessWidget {
  const WorkTile({
    super.key,
    required this.work,
  });

  final ScientificWork work;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: Row(
        children: [
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(work.title, style: Style.bodyBold),
                const Gap(4),
                Text(work.type,
                    style: Style.captionL.copyWith(color: Colors.grey)),
                const Gap(2),
                Text(work.date, style: Style.captionL),
              ],
            ),
          ),
          const Gap(8),
          Icon(Icons.article_outlined, size: 20, color: Colors.grey),
          const Gap(16),
        ],
      ),
    );
  }
}
