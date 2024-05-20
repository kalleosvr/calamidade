import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class StatusRequestTag extends StatefulWidget {
  const StatusRequestTag({super.key, required this.status});

  final RequestStatusEnum status;

  @override
  State<StatusRequestTag> createState() => _StatusRequestTagState();
}

class _StatusRequestTagState extends State<StatusRequestTag> {
  late CoopartilharColors colors;
  late TextTheme textThemes;
  late Color color;
  late Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    colors = CoopartilharColors.of(context);
    textThemes = Theme.of(context).textTheme;
    switch (widget.status) {
      case RequestStatusEnum.analisys:
        color = colors.urgentLight;
        foregroundColor = colors.urgent;
      case RequestStatusEnum.accepted:
        color = colors.routineLight;
        foregroundColor = colors.routine;
      case RequestStatusEnum.rejected:
        color = colors.criticalLight;
        foregroundColor = colors.critical;
      case RequestStatusEnum.concluded:
        color = colors.routineLight;
        foregroundColor = colors.routine;
      case RequestStatusEnum.notDefined:
        color = colors.black;
        foregroundColor = colors.white;
      default:
        color = colors.black;
        foregroundColor = colors.white;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(color: foregroundColor),
        color: color,
      ),
      child: Text(
        widget.status.label,
        style: textThemes.labelMedium?.copyWith(color: foregroundColor),
      ),
    );
  }
}
