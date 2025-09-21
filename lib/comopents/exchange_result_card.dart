import 'package:action_labs/comopents/exchange_history_card.dart';
import 'package:action_labs/data/model/exchange_history_model.dart';
import 'package:action_labs/utils/colors.dart';
import 'package:action_labs/utils/text_styles.dart';
import 'package:flutter/material.dart';

class ExchangeResultCard extends StatefulWidget {
  final String pair;
  final String updatedAt;
  final double rate;
  final List<ExchangeHistory> history;
  const ExchangeResultCard({
    super.key,
    required this.pair,
    required this.updatedAt,
    required this.rate,
    required this.history,
  });

  @override
  State<ExchangeResultCard> createState() => _ExchangeResultCardState();
}

class _ExchangeResultCardState extends State<ExchangeResultCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Exchange rate now",
                    style: TextStyles.largeSemibold(color: AppColors.dark01),
                  ),
                  Text(
                    widget.updatedAt,
                    style: TextStyles.smallRegular(color: AppColors.dark02),
                  ),
                ],
              ),
              Text(
                widget.pair,
                style: TextStyles.headline1(color: AppColors.branded),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            color: Colors.blue.shade50,
            alignment: Alignment.center,
            child: Text(
              "R\$ ${widget.rate.toStringAsFixed(2)}",
              style: TextStyles.dashboard(color: AppColors.branded),
            ),
          ),
          const SizedBox(height: 32),
          ExpansionTile(
            dense: true,
            backgroundColor: AppColors.grey03,
            title: Text(
              "LAST 30 DAYS",
              style: TextStyles.mediumSemibold(color: AppColors.dark01),
            ),
            trailing: Icon(
              isExpanded ? Icons.minimize_outlined : Icons.add,
              size: 24,
            ),
            onExpansionChanged: (value) {
              setState(() {
                isExpanded = value;
              });
            },
            iconColor: AppColors.branded,
            collapsedIconColor: AppColors.branded,
            children: widget.history.isEmpty
                ? [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        "No history available",
                        style: TextStyle(color: AppColors.dark01),
                      ),
                    ),
                  ]
                : widget.history
                      .map((h) => ExchangeHistoryCard(history: h))
                      .toList(),
          ),
          Divider(thickness: 2, color: AppColors.branded),
        ],
      ),
    );
  }
}
