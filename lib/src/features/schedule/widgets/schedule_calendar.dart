import 'package:barbershop/src/core/constants.dart';
import 'package:barbershop/src/core/ui/helpers/messages.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleCalendar extends StatefulWidget {
  const ScheduleCalendar({
    super.key,
    required this.cancelPressed,
    required this.onOkPressed,
    required this.workDays,
  });

  final VoidCallback cancelPressed;
  final ValueChanged<DateTime> onOkPressed;
  final List<String> workDays;

  @override
  State<ScheduleCalendar> createState() => _ScheduleCalendarState();
}

class _ScheduleCalendarState extends State<ScheduleCalendar> {
  DateTime? selectedDay;
  late final List<int> weekDaysEnable;

  int convertWeekDay(String weekday) => switch (weekday.toLowerCase()) {
        'seg' => DateTime.monday,
        'ter' => DateTime.tuesday,
        'qua' => DateTime.wednesday,
        'qui' => DateTime.thursday,
        'sex' => DateTime.friday,
        'sab' => DateTime.saturday,
        'dom' => DateTime.sunday,
        _ => 0,
      };

  @override
  void initState() {
    super.initState();
    weekDaysEnable = widget.workDays.map(convertWeekDay).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xffe6e2e9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          TableCalendar(
            availableGestures: AvailableGestures.none,
            headerStyle: const HeaderStyle(titleCentered: true),
            focusedDay: DateTime.now(),
            firstDay: DateTime.utc(1970, 1, 1),
            lastDay: DateTime.now().add(const Duration(days: 365 * 10)),
            calendarFormat: CalendarFormat.month,
            locale: 'pt_BR',
            availableCalendarFormats: const {CalendarFormat.month: 'Month'},
            enabledDayPredicate: (day) {
              return weekDaysEnable.contains(day.weekday);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                this.selectedDay = selectedDay;
              });
            },
            selectedDayPredicate: (day) {
              return isSameDay(selectedDay, day);
            },
            calendarStyle: CalendarStyle(
              selectedDecoration: const BoxDecoration(
                color: ColorConstants.brown,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: ColorConstants.brown.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: widget.cancelPressed,
                child: const Text(
                  'Cancelar',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ColorConstants.brown,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  if (selectedDay == null) {
                    context.showError('Por favor selecione um dia');
                    return;
                  }
                  widget.onOkPressed(selectedDay!);
                },
                child: const Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ColorConstants.brown,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
