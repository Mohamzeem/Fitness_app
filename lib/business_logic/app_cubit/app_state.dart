// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class InitialAppState extends AppState {
  List<ProgramModel> programList;
  InitialAppState({
    required this.programList,
  });
}

class ProgramAddState extends AppState {
  List<ProgramModel> programList;
  ProgramAddState({
    required this.programList,
  });
}

class ExerciseAddState extends AppState {
  List<ProgramModel> programList;
  ExerciseAddState({
    required this.programList,
  });
}

class DeletedProgramState extends AppState {
  List<ProgramModel> programList;
  DeletedProgramState({
    required this.programList,
  });
}

class DeletedExercisetate extends AppState {
  List<ProgramModel> programList;
  DeletedExercisetate({
    required this.programList,
  });
}

class EditProgramState extends AppState {
  List<ProgramModel> programList;
  EditProgramState({
    required this.programList,
  });
}
