import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/app_cubit/app_cubit.dart';
import '../widgets/programs_list_widget.dart';
import '../widgets/two_buttons_widget.dart';
import '../../helper/widgets/snack_bar.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TwoButtonsWidget(),
            BlocConsumer<AppCubit, AppState>(listener: (context, state) {
              if (state is DeletedProgramState) {
                return ShowSnackBar().showErrorSnackBar(
                    context: context, message: 'Program Deleted Successfully');
              } else if (state is DeletedExercisetate) {
                return ShowSnackBar().showErrorSnackBar(
                    context: context, message: 'Exercise Deleted Successfully');
              } else if (state is ExerciseAddState) {
                return ShowSnackBar().showSuccessSnackBar(
                    context: context, message: 'Exercise Add Successfully');
              } else if (state is ProgramAddState) {
                return ShowSnackBar().showSuccessSnackBar(
                    context: context, message: 'Program Add Successfully');
              } else if (state is EditProgramState) {
                return ShowSnackBar().showSuccessSnackBar(
                    context: context, message: 'Program Edited Successfully');
              }
            }, builder: (context, state) {
              if (state is InitialAppState) {
                return ProgramsListWidget(
                  progList: state.programList,
                );
              } else {
                return const SizedBox();
              }
            })
          ],
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) => AppBar(
        title: Text(
          'Dash Board',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );
}
