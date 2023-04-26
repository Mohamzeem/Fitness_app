import 'package:fitness_app/helper/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../business_logic/app_cubit/app_cubit.dart';
import '../../helper/widgets/elevated_button.dart';
import 'add_.dart';

class TwoButtonsWidget extends StatefulWidget {
  const TwoButtonsWidget({
    super.key,
  });

  @override
  State<TwoButtonsWidget> createState() => _TwoButtonsWidgetState();
}

class _TwoButtonsWidgetState extends State<TwoButtonsWidget> {
  TextEditingController programController = TextEditingController();
  @override
  void dispose() {
    programController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomElvatedBtn(
              labelText: 'Add Program',
              onPressed: () => addProgram(context),
              backgroundColor: Colors.greenAccent,
              foregroundColor: Colors.black,
              width: 0.38,
              height: 0.05),
          CustomElvatedBtn(
              labelText: 'Add Exercise',
              onPressed: () {
                ShowSnackBar().showErrorSnackBar(
                    context: context,
                    message:
                        'I cant understand What that button do so i made add exercise icon in each program to add exercises');
              },
              backgroundColor: Colors.greenAccent,
              foregroundColor: Colors.black,
              width: 0.38,
              height: 0.05),
        ],
      ),
    );
  }

  void addProgram(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              child: Add(
                onPressed: () {
                  context
                      .read<AppCubit>()
                      .addProgram(name: programController.text);
                  Navigator.pop(context);
                  programController.clear();
                },
                isProgram: true,
                controller: programController,
              ),
            ),
          ),
        );
      },
    );
  }
}
