import 'package:expense_tracker/shared/color/custom_color_scheme.dart';
import 'package:expense_tracker/views/record_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionListItem extends StatelessWidget {
  final String category;
  final String description;
  final String amount;
  final int itemId;
  final bool deleteButtonVisible;
  final String createdAt;
  final String status;

   final VoidCallback onTap;

  const TransactionListItem(
      {super.key,
      required this.category,
      required this.description,
      required this.amount,
      required this.deleteButtonVisible,
      required this.itemId,
      required this.createdAt,
      required this.status, required this.onTap});

  String formatDate(String date) {
    DateTime parsedDate = DateTime.parse(date);

    String formattedDate = DateFormat.yMMMMd('en_US').format(parsedDate);

    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(8.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(category),
              Text(
                description,
                style: const TextStyle(fontSize: 16 * .75),
              ),
              Text(
                formatDate(createdAt),
                style: const TextStyle(fontSize: 16 * .75),
              )
            ],
          ),
          Column(
            children: [
              Text(
                amount,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: CustomColorScheme.myError,
                ),
              ),
              Text(
                status,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: status == "approved"
                      ? Colors.green
                      : status == "pending"
                          ? Colors.white
                          : CustomColorScheme.myError,
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
