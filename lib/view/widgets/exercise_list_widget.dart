import 'package:fitness_app/helper/widgets/sized_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../business_logic/app_cubit/app_cubit.dart';

class ExercisesListWidget extends StatefulWidget {
  final int progIndex;
  const ExercisesListWidget({
    Key? key,
    required this.progIndex,
  }) : super(key: key);

  @override
  State<ExercisesListWidget> createState() => _ExercisesListWidgetState();
}

class _ExercisesListWidgetState extends State<ExercisesListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state is InitialAppState) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.programList[widget.progIndex].exercise.length,
            itemBuilder: (context, exerIndex) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    const CustomSizedBox(height: 0, width: 0.07),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        state.programList[widget.progIndex].exercise[exerIndex]
                            .exerName,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                    InkWell(
                        onTap: () => context.read<AppCubit>().deleteExercise(
                            progIndex: widget.progIndex, exerIndex: exerIndex),
                        child: const Icon(
                          Icons.delete_rounded,
                          size: 25,
                        )),
                  ],
                ),
              );
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
