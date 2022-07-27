import 'package:flutter/material.dart';

class CustomDropDownList extends StatefulWidget {
  final String label;
  BuildContext context;
  int width;
  List items;
  TextEditingController controller;

  CustomDropDownList(
      {Key? key,
      required this.label,
      required this.width,
      required this.items,
      required this.context,
      required this.controller})
      : super(key: key);

  @override
  State<CustomDropDownList> createState() => _CustomDropDownListState();
}

class _CustomDropDownListState extends State<CustomDropDownList> {
  String selection = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      width: widget.width.toDouble(),
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
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: DropdownButton(
                  isExpanded: true,
                  value: widget.controller.text,
                  icon: Icon(Icons.keyboard_arrow_down_outlined),
                  items: widget.items.map((item) {
                    return DropdownMenuItem(value: item, child: Text(item));
                  }).toList(),
                  onChanged: (Object? value) {
                    setState(() {
                      selection = value.toString();
                      widget.controller.text = value.toString();
                    });
                  },
                )),
          ]),
    );
  }
}
//
// Widget CustomDropDownList(
//         {required String label,
//         hint,
//         required BuildContext context,
//         required int width,
//         required List items,
//         required TextEditingController controller,
//         String selection=""
//         }) =>
//     Container(
//       color: Theme.of(context).backgroundColor,
//       width: width.toDouble(),
//       padding: const EdgeInsets.all(16),
//       child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               label,
//               style: const TextStyle(
//                   color: Colors.black87,
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                   decoration: TextDecoration.none),
//             ),
//             Padding(
//                 padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
//                 child: DropdownButton(
//                   isExpanded: true,
//                   value: controller.text,
//                   icon: Icon(Icons.keyboard_arrow_down_outlined),
//                   items: items.map((item) {
//                     return DropdownMenuItem(value: item, child: Text(item));
//                   }).toList(), onChanged: (Object? value) {
//                     //selection=value.toString();
//                     controller.text=value.toString();
//                 },
//                 )),
//           ]),
//     );
