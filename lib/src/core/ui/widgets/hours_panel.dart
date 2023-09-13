import 'package:barbershop/src/core/constants/constants.dart';
import 'package:flutter/material.dart';

class HoursPanel extends StatefulWidget {
  const HoursPanel({
    super.key,
    this.enabledTimes,
    required this.startTime,
    required this.endTime,
    required this.onTimePressed,
  }) : singleSelection = false;

  const HoursPanel.singleSelection({
    super.key,
    this.enabledTimes,
    required this.startTime,
    required this.endTime,
    required this.onTimePressed,
  }) : singleSelection = true;

  final List<int>? enabledTimes;
  final int startTime, endTime;
  final ValueChanged<int> onTimePressed;
  final bool singleSelection;

  @override
  State<HoursPanel> createState() => _HoursPanelState();
}

class _HoursPanelState extends State<HoursPanel> {
  int? lastSelection;

  @override
  Widget build(BuildContext context) {
    final HoursPanel(:singleSelection) = widget;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Selecione os horários de atendimento',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 16,
          children: [
            for (int i = widget.startTime; i <= widget.endTime; i++)
              TimeButton(
                enabledTimes: widget.enabledTimes,
                label: '${i.toString().padLeft(2, '0')}:00',
                value: i,
                timeSelected: lastSelection,
                singleSelection: singleSelection,
                onPressed: (timeSelected) {
                  setState(() {
                    if (singleSelection) {
                      if (lastSelection == timeSelected) {
                        lastSelection = null;
                      } else {
                        lastSelection = timeSelected;
                      }
                    }
                  });
                  widget.onTimePressed(timeSelected);
                },
              ),
          ],
        ),
      ],
    );
  }
}

class TimeButton extends StatefulWidget {
  const TimeButton({
    super.key,
    this.enabledTimes,
    required this.label,
    required this.value,
    required this.onPressed,
    required this.singleSelection,
    required this.timeSelected,
  });

  final List<int>? enabledTimes;
  final String label;
  final int value;
  final ValueChanged<int> onPressed;
  final bool singleSelection;
  final int? timeSelected;

  @override
  State<TimeButton> createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  var selected = false;

  @override
  Widget build(BuildContext context) {
    final TimeButton(
      :singleSelection,
      :timeSelected,
      :value,
      :label,
      :enabledTimes,
      :onPressed,
    ) = widget;

    if (singleSelection && timeSelected != null) {
      selected = timeSelected == value;
    }

    final textColor = selected ? Colors.white : AppColors.grey;
    var buttonColor = selected ? AppColors.brown : Colors.white;
    final buttonBorderColor = selected ? AppColors.brown : AppColors.grey;

    final disableTime = enabledTimes != null && !enabledTimes.contains(value);

    if (disableTime) {
      buttonColor = Colors.grey[400]!;
    }

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: disableTime
          ? null
          : () {
              setState(() {
                selected = !selected;
                onPressed(value);
              });
            },
      child: Container(
        width: 64,
        height: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: buttonColor,
          border: Border.all(color: buttonBorderColor),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
