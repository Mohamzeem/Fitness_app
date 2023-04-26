import 'package:fitness_app/models/program_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  List<ProgramModel> list = [];

  AppCubit() : super(InitialAppState(programList: const []));

  void addProgram({required String name}) {
    list.add(ProgramModel(progName: name, exercise: []));
    emit(ProgramAddState(programList: list));
    emit(InitialAppState(programList: list));
  }

  void addExercise({required int progIndex, required String name}) {
    list[progIndex].exercise.add(ExerciseModel(exerName: name));
    emit(ExerciseAddState(programList: list));
    emit(InitialAppState(programList: list));
  }

  void deleteProgram({required int progIndex}) {
    list.removeAt(progIndex);
    emit(DeletedProgramState(programList: list));
    emit(InitialAppState(programList: list));
  }

  void deleteExercise({required int progIndex, required int exerIndex}) {
    list[progIndex].exercise.removeAt(exerIndex);
    emit(DeletedExercisetate(programList: list));
    emit(InitialAppState(programList: list));
  }

  void editProgram(
      {required String progOldName,
      required String progNewName,
      required int progIndex}) {
    list.removeWhere((element) => element.progName == progOldName);
    list.add(ProgramModel(
        progName: progNewName, exercise: list[progIndex].exercise));
    emit(EditProgramState(programList: list));
    emit(InitialAppState(programList: list));
  }
}
