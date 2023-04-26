import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../helper/widgets/elevated_button.dart';
import '../../helper/widgets/sized_box_widget.dart';

class Add extends StatelessWidget {
  final void Function() onPressed;
  final bool isProgram;
  final TextEditingController controller;

  const Add({
    Key? key,
    required this.onPressed,
    required this.isProgram,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(isProgram ? 'Add Program' : 'Add Exercise',
            style: Theme.of(context).textTheme.bodyLarge),
        const CustomSizedBox(height: 0.015, width: 1),
        TextField(
          autofocus: true,
          controller: controller,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5.r),
              label: Text(isProgram ? 'Prog Name' : 'Exer Name',
                  style: Theme.of(context).textTheme.bodyMedium),
              border:
                  const OutlineInputBorder(borderSide: BorderSide(width: 1))),
        ),
        const CustomSizedBox(height: 0.015, width: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomElvatedBtn(
              width: 0.2,
              height: 0.05,
              labelText: 'Add',
              onPressed: onPressed,
              backgroundColor: Colors.greenAccent,
              foregroundColor: Colors.black,
            ),
            CustomElvatedBtn(
              width: 0.2,
              height: 0.05,
              labelText: 'Cancel',
              onPressed: () {
                controller.clear();
                Navigator.pop(context);
              },
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.black,
            ),
          ],
        )
      ],
    );
  }
}
