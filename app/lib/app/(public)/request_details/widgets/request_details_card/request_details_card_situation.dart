import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class RequestDetailsCardSituation extends StatelessWidget {
  const RequestDetailsCardSituation({
    super.key,
    required this.description,
    required this.statusDetails,
  });

  final RequestStatusEnum statusDetails;
  final String description;

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final textThems = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                'Situação',
                style: textThems.displayMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colors.textColor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            StatusRequestTag(
              status: statusDetails,
            )
          ],
        ),
        const SizedBox(height: 8.0),
        Text(
          description,
          style: textThems.bodySmall?.copyWith(
            fontSize: 14.0,
            color: colors.textColor,
          ),
        ),
      ],
    );
  }
}
