import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitness_app/models/program_model.dart';
import '../../business_logic/app_cubit/app_cubit.dart';
import 'add_.dart';
import 'edit.dart';
import 'exercise_list_widget.dart';

class ProgramsListWidget extends StatefulWidget {
  final List<ProgramModel> progList;
  const ProgramsListWidget({
    Key? key,
    required this.progList,
  }) : super(key: key);

  @override
  State<ProgramsListWidget> createState() => _ProgramsListWidgetState();
}

class _ProgramsListWidgetState extends State<ProgramsListWidget> {
  String valueName = "";
  TextEditingController exercicsController = TextEditingController();
  @override
  void dispose() {
    exercicsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        height: 10.h,
        // thickness: 0,
        // color: Colors.grey,
      ),
      reverse: true,
      shrinkWrap: true,
      itemCount: widget.progList.length,
      itemBuilder: (context, progIndex) {
        return ExpansionTile(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  widget.progList[progIndex].progName,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              InkWell(
                onTap: () => edit(context, progIndex),
                child: const Icon(
                  Icons.edit_outlined,
                  size: 25,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: InkWell(
                    onTap: () {
                      addExercise(context, progIndex);
                      //   controller.add(context, false, () {
                      //     controller.programs[progIndex].exercise.add(
                      //         ExerciseModel(
                      //             exerName:
                      //                 controller.exerController.text));
                      //     ShowSnackBar().showSuccessSnackBar(
                      //         context: context,
                      //         message: 'Exercise Add Successfully');
                      // });
                    },
                    child: const Icon(
                      Icons.add,
                      size: 25,
                    )),
              ),
              InkWell(
                onTap: () {
                  context.read<AppCubit>().deleteProgram(progIndex: progIndex);
                },
                child: const Icon(
                  Icons.delete_outline_rounded,
                  size: 25,
                ),
              ),
            ],
          ),
          children: [
            ExercisesListWidget(
              progIndex: progIndex,
            )
          ],
        );
      },
    );
  }

  void addExercise(BuildContext context, int progIndex) {
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
                  context.read<AppCubit>().addExercise(
                      progIndex: progIndex, name: exercicsController.text);
                  Navigator.pop(context);
                  exercicsController.clear();
                },
                isProgram: false,
                controller: exercicsController,
              ),
            ),
          ),
        );
      },
    );
  }

  void edit(BuildContext context, int index) {
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
              child: Edit(
                onPressed: () {
                  context.read<AppCubit>().editProgram(
                      progOldName: widget.progList[index].progName,
                      progNewName: valueName,
                      progIndex: index);
                  exercicsController.clear();
                  Navigator.pop(context);
                },
                initialValue: widget.progList[index].progName,
                onChanged: (String value) {
                  setState(() {
                    valueName = value;
                  });
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
