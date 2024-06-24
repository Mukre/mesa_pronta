import 'package:flutter/material.dart';

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  MultiSelectChip(this.reportList);
  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}
class _MultiSelectChipState extends State<MultiSelectChip> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: ChoiceChip(
        label: Text("21:00"),
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            isSelected = selected;
          });
        },
      ),
    );
  }
}