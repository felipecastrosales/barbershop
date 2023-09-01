import 'package:barbershop/src/core/constants.dart';
import 'package:flutter/material.dart';

class WeekdaysPanel extends StatelessWidget {
  const WeekdaysPanel({
    super.key,
    required this.onDayPressed,
    this.enabledDays,
  });

  final ValueChanged<String> onDayPressed;
  final List<String>? enabledDays;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Selecione os dias da semana',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonDay(
                  label: 'Seg',
                  enabledDays: enabledDays,
                  onDayPressed: onDayPressed,
                ),
                ButtonDay(
                  label: 'Ter',
                  enabledDays: enabledDays,
                  onDayPressed: onDayPressed,
                ),
                ButtonDay(
                  label: 'Qua',
                  enabledDays: enabledDays,
                  onDayPressed: onDayPressed,
                ),
                ButtonDay(
                  label: 'Qui',
                  enabledDays: enabledDays,
                  onDayPressed: onDayPressed,
                ),
                ButtonDay(
                  label: 'Sex',
                  enabledDays: enabledDays,
                  onDayPressed: onDayPressed,
                ),
                ButtonDay(
                  label: 'Sab',
                  enabledDays: enabledDays,
                  onDayPressed: onDayPressed,
                ),
                ButtonDay(
                  label: 'Dom',
                  enabledDays: enabledDays,
                  onDayPressed: onDayPressed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonDay extends StatefulWidget {
  const ButtonDay({
    super.key,
    required this.label,
    required this.onDayPressed,
    this.enabledDays,
  });

  final String label;
  final ValueChanged<String> onDayPressed;
  final List<String>? enabledDays;

  @override
  State<ButtonDay> createState() => ButtonDayState();
}

class ButtonDayState extends State<ButtonDay> {
  var selected = false;

  @override
  Widget build(BuildContext context) {
    final textColor = selected ? Colors.white : ColorConstants.grey;
    var buttonColor = selected ? ColorConstants.brown : Colors.white;
    final buttonBorderColor =
        selected ? ColorConstants.brown : ColorConstants.grey;

    final ButtonDay(:enabledDays, :label) = widget;

    final disableDay = enabledDays != null && !enabledDays.contains(label);

    if (disableDay) {
      buttonColor = Colors.grey[400]!;
    }

    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: disableDay
            ? null
            : () {
                widget.onDayPressed(label);
                setState(() {
                  selected = !selected;
                });
              },
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Container(
          width: 40,
          height: 56,
          decoration: BoxDecoration(
            color: buttonColor,
            border: Border.fromBorderSide(BorderSide(color: buttonBorderColor)),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
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
      ),
    );
  }
}
