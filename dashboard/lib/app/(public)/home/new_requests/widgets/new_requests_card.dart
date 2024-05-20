import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class NewRequestsCard extends StatefulWidget {
  final String title;
  final String name;
  final String city;
  final String phone;
  final String date;
  final RequestStatusEnum status;
  final String requestedIncome;
  final VoidCallback? onTap;
  final bool isSelected;

  const NewRequestsCard({
    super.key,
    required this.title,
    required this.name,
    required this.city,
    required this.phone,
    required this.date,
    required this.status,
    required this.requestedIncome,
    this.onTap,
    required this.isSelected,
  });

  @override
  State<NewRequestsCard> createState() => _NewRequestsCardState();
}

class _NewRequestsCardState extends State<NewRequestsCard> {
  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final texts = Theme.of(context).textTheme;

    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: widget.isSelected ? colors.routine : colors.white,
              width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: texts.titleLarge,
                ),
                StatusRequestTag(
                  status: widget.status,
                ),
              ],
            ),
            Text(
              widget.name,
              style: texts.bodyMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cidade:',
                  style: texts.bodySmall,
                ),
                Text(widget.city,
                    textAlign: TextAlign.right, style: texts.bodySmall)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Telefone:',
                  style: texts.bodySmall,
                ),
                Text(
                  widget.phone,
                  textAlign: TextAlign.right,
                  style: texts.bodySmall,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(UIcons.regularStraight.clock, size: 16),
                    const SizedBox(width: 8),
                    Text(
                      widget.date,
                      style: texts.bodySmall,
                    ),
                  ],
                ),
                Text(
                  'R\$ ${widget.requestedIncome}',
                  style: texts.displayMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
