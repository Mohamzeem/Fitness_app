// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProgramModel {
  final String progName;
  final List<ExerciseModel> exercise;
  ProgramModel({
    required this.progName,
    required this.exercise,
  });
}

class ExerciseModel {
  final String exerName;
  ExerciseModel({
    required this.exerName,
  });
}
