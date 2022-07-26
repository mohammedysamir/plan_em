import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget DateTimeSelector(
        {required String label,
        hint,
        required int width,
        required bool isDatePicker,
        required BuildContext context,
        required TextEditingController controller}) =>
    Container(
      color: Theme.of(context).backgroundColor,
      width: width.toDouble(),
      padding: const EdgeInsets.all(16),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: TextFormField(
                controller: controller,
                //manipulate icons
                decoration: InputDecoration(
                    labelText: hint,
                    fillColor: Colors.black12,
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).accentColor)),
                    suffixIcon: isDatePicker
                        ? const Icon(Icons.date_range_outlined)
                        : const Icon(Icons.timer_outlined)),
                onTap: () async {
                  //suite time or date picker
                  DateTime? datePicker;
                  TimeOfDay? timePicker;
                  if (isDatePicker) {
                    datePicker = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(DateTime.now().year),
                        lastDate: DateTime(2200));
                    controller.text =
                        DateFormat("yyyy-MM-dd").format(datePicker!);
                  } else {
                    timePicker = await showTimePicker(
                        context: context,
                        initialTime: const TimeOfDay(hour: 11, minute: 0));
                    bool isPM=timePicker!.hour > 12;
                    controller.text = DateFormat("hh:mm").format(DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day,
                        isPM? (timePicker.hour + 12) :timePicker.hour,
                        timePicker.minute));
                  }
                },
              ),
            ),
          ]),
    );
//todo: embed Bloc state management instead of setState()
