import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gypool/Model/UiColor.dart';
import 'package:gypool/Widget/SpaceWidget.dart';
import 'package:gypool/Widget/TextWidget.dart';

class SelectWidget extends StatefulWidget {
  final String? lable;
  final List<String> items;
  final String? value;
  final String? hint;
  final Function(String?)? onChanged;

  const SelectWidget({
    super.key,
    this.lable,
    required this.items,
    this.value,
    this.hint,
    this.onChanged,
  });

  @override
  State<SelectWidget> createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectWidget> {
  String? selectedValue;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
    if (selectedValue != null) {
      selectedIndex = widget.items.indexOf(selectedValue!);
      if (selectedIndex == -1) selectedIndex = 0;
    }
  }

  void _showPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: Text('취소', style: TextStyle(color: Colors.red)),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  CupertinoButton(
                    child: Text('확인'),
                    onPressed: () {
                      setState(() {
                        selectedValue = widget.items[selectedIndex];
                      });
                      if (widget.onChanged != null) {
                        widget.onChanged!(selectedValue);
                      }
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              Expanded(
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(
                    initialItem: selectedIndex,
                  ),
                  itemExtent: 40,
                  onSelectedItemChanged: (int index) {
                    selectedIndex = index;
                  },
                  children: widget.items.map((String item) {
                    return Center(
                      child: Textwidget(
                        text: item,
                        fontSize: 18,
                        fontSpacing: 0,
                        fontHeight: 1.5,
                        fontWeight: FontWeight.w400,
                        fontColor: UiColor.black100Per,
                        textAlign: TextAlign.center,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.lable != null)
          Column(
            children: [
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.5),
                  child: Textwidget(
                    text: widget.lable!,
                    fontSize: 18,
                    fontSpacing: 0,
                    fontHeight: 1.6,
                    fontWeight: FontWeight.w600,
                    fontColor: UiColor.black100Per,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SpaceWidget(width: 0, height: 8),
            ],
          ),
        GestureDetector(
          onTap: _showPicker,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(color: UiColor.black100Per.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Textwidget(
                  text: selectedValue ?? widget.hint ?? '선택해주세요',
                  fontSize: 16,
                  fontSpacing: 0,
                  fontHeight: 1.5,
                  fontWeight: FontWeight.w400,
                  fontColor: selectedValue != null
                      ? UiColor.black100Per
                      : UiColor.black100Per.withOpacity(0.5),
                  textAlign: TextAlign.left,
                ),
                Icon(Icons.arrow_drop_down, color: UiColor.black100Per),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
