import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeSelector extends StatefulWidget {
  final String label, hint;
  final int width;
  final bool isDatePicker;

  const DateTimeSelector(
      {Key? key,
      required this.label,
      required this.hint,
      required this.width,
      required this.isDatePicker})
      : super(key: key);

  @override
  State<DateTimeSelector> createState() => _DateTimeSelectorState();
}

class _DateTimeSelectorState extends State<DateTimeSelector> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
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
                    labelText: widget.hint,
                    fillColor: Colors.black12,
                    filled: true,
                    suffixIcon: widget.isDatePicker
                        ? const Icon(Icons.date_range_outlined)
                        : const Icon(Icons.timer_outlined)),
                onTap: () async {
                  //suite time or date picker
                  DateTime? datePicker;
                  TimeOfDay? timePicker;
                  if (widget.isDatePicker) {
                    datePicker = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(DateTime.now().year),
                        lastDate: DateTime(2200));
                  } else {
                    timePicker = await showTimePicker(
                        context: context,
                        initialTime: const TimeOfDay(hour: 11, minute: 0));
                  }
                  setState(() {
                    controller.text = datePicker != null
                        ? DateFormat('yyyy-MM-dd').format(datePicker)
                        : timePicker != null
                            ? timePicker.format(context)
                            : "";
                  });
                },
              ),
            ),
          ]),
    );
  }
}
//todo: embed Bloc state management instead of setState()
