import 'package:barbershop/src/core/constants.dart';
import 'package:flutter/material.dart';

class WeekdaysPanel extends StatelessWidget {
  const WeekdaysPanel({
    super.key,
    required this.onDayPressed,
  });

  final ValueChanged<String> onDayPressed;

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
                ButtonDay(label: 'Seg', onDayPressed: onDayPressed),
                ButtonDay(label: 'Ter', onDayPressed: onDayPressed),
                ButtonDay(label: 'Qua', onDayPressed: onDayPressed),
                ButtonDay(label: 'Qui', onDayPressed: onDayPressed),
                ButtonDay(label: 'Sex', onDayPressed: onDayPressed),
                ButtonDay(label: 'Sab', onDayPressed: onDayPressed),
                ButtonDay(label: 'Dom', onDayPressed: onDayPressed),
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
  });

  final String label;
  final ValueChanged<String> onDayPressed;

  @override
  State<ButtonDay> createState() => ButtonDayState();
}

class ButtonDayState extends State<ButtonDay> {
  var selected = false;

  @override
  Widget build(BuildContext context) {
    final textColor = selected ? Colors.white : ColorConstants.grey;
    final buttonColor = selected ? ColorConstants.brown : Colors.white;
    final buttonBorderColor =
        selected ? ColorConstants.brown : ColorConstants.grey;

    void onDayPressed() {
      widget.onDayPressed(widget.label);
      setState(() => selected = !selected);
    }

    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onDayPressed,
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
              widget.label,
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
