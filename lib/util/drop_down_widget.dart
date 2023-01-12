import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:factory_manager/controller/theme_controller.dart';
import 'package:flutter/material.dart';

class DropDownWidget {
  /// enable 항목은 드롭다운 클릭을 불가능하게 하고 싶을 때 사용한다.
  /// 라이브러리 자체에 해당 기능이 없어서 Stack, GestureDetector 사용해서 구현
  static Widget show({
    required List<String> items,
    required String initValue,
    required Function(String selectedValue) select,
    required bool isLight,
    bool enable = true,
    Function()? enableTouch,
    double itemPaddingLeft = 13,
    double buttonPaddingLeft = 5,
    BoxDecoration? buttonDecoration,
  }) {
    buttonDecoration ??= BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      border: Border.all(color: Colors.grey, width: 0.5),
      // color: isLight ? null : Colors.grey.shade700,
    );

    return Stack(
      children: [
        DropdownButtonFormField2(
          buttonDecoration: buttonDecoration,
          alignment: AlignmentDirectional.center,
          buttonHeight: 40,
          value: initValue,
          itemPadding: EdgeInsets.only(left: itemPaddingLeft),
          buttonPadding: EdgeInsets.only(left: buttonPaddingLeft),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.zero,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
            ),
          ),
          isExpanded: true,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          iconSize: 30,
          items: List.generate(items.length, (index) {
            String text = items[index];
            return DropdownMenuItem(
              value: text,
              child: Text(
                text,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            );
          }),
          onChanged: (value) async {
            await select(value!.toString());
          },
        ),
        if (!enable) ...[
          Positioned.fill(
            child: GestureDetector(
              onTap: enable ? null : () => enableTouch?.call(),
              child: Container(color: Colors.transparent),
            ),
          )
        ],
      ],
    );
  }
}
