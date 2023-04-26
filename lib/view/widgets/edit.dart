import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../helper/widgets/elevated_button.dart';
import '../../helper/widgets/sized_box_widget.dart';

class Edit extends StatelessWidget {
  final String initialValue;
  final Function(String) onChanged;
  final void Function() onPressed;
  const Edit({
    Key? key,
    required this.initialValue,
    required this.onChanged,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Edit Program', style: Theme.of(context).textTheme.bodyLarge),
        const CustomSizedBox(height: 0.015, width: 1),
        TextFormField(
          autofocus: true,
          onChanged: onChanged,
          initialValue: initialValue,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5.r),
              label: Text('New Name',
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
              labelText: 'Edit',
              onPressed: onPressed,
              backgroundColor: Colors.greenAccent,
              foregroundColor: Colors.black,
            ),
            CustomElvatedBtn(
              width: 0.2,
              height: 0.05,
              labelText: 'Cancel',
              onPressed: () {
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
