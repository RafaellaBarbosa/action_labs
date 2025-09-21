import 'package:action_labs/data/model/exchange_history_model.dart';
import 'package:action_labs/utils/colors.dart';
import 'package:action_labs/utils/text_styles.dart';
import 'package:flutter/material.dart';

class ExchangeHistoryCard extends StatelessWidget {
  final ExchangeHistory history;

  const ExchangeHistoryCard({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    final diff = history.closeDiff ?? 0;
    final isPositive = diff >= 0;

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.0)),
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${history.date.day.toString().padLeft(2, '0')}/"
              "${history.date.month.toString().padLeft(2, '0')}/"
              "${history.date.year}",
              style: TextStyles.smallSemibold(),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text("OPEN:", style: TextStyles.table(color: AppColors.dark02)),
                SizedBox(width: 14),
                Text(
                  "R\$ ${history.open.toStringAsFixed(4)}",
                  style: TextStyles.mediumSemibold(color: AppColors.dark02),
                ),
                Spacer(),
                Text(
                  "HIGHT:",
                  style: TextStyles.table(color: AppColors.dark02),
                ),
                SizedBox(width: 14),

                Text(
                  "R\$ ${history.high.toStringAsFixed(4)}",
                  style: TextStyles.mediumSemibold(color: AppColors.dark02),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "CLOSE:",
                  style: TextStyles.table(color: AppColors.dark02),
                ),
                SizedBox(width: 14),
                Text(
                  "R\$ ${history.close.toStringAsFixed(4)}",
                  style: TextStyles.mediumSemibold(color: AppColors.dark02),
                ),
                Spacer(),

                Text("LOW:", style: TextStyles.table(color: AppColors.dark02)),
                SizedBox(width: 14),
                Text(
                  "R\$ ${history.low.toStringAsFixed(4)}",
                  style: TextStyles.mediumSemibold(color: AppColors.dark02),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "CLOSE DIFF (%):",
                  style: TextStyles.table(color: AppColors.dark01),
                ),
                SizedBox(width: 14),
                Text(
                  "${diff.toStringAsFixed(2)}%",
                  style: TextStyles.mediumSemibold(
                    color: isPositive
                        ? AppColors.alertGreen
                        : AppColors.alertRed,
                  ),
                ),
                Icon(
                  isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                  color: isPositive ? AppColors.alertGreen : AppColors.alertRed,
                  size: 24,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
