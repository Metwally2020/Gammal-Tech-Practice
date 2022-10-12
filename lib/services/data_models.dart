
import 'package:json_annotation/json_annotation.dart';
part 'data_models.g.dart';

@JsonSerializable()
class MyUser {
  final String uid;
  String name = 'gammaltech_user';
  final int age;
  final int solved10SecPractice;
  final int solved15SecPractice;

  MyUser({
    this.uid = '',
    this.name = '',
    this.age = 20,
    this.solved10SecPractice = 0,
    this.solved15SecPractice = 0,
  });

  factory MyUser.fromJson(Map<String, dynamic>? json) => _$MyUserFromJson(json);
  Map<String, dynamic>? toJson() => _$MyUserToJson(this);
}

@JsonSerializable()
class Practice {
  final int type;
  final List<String> quiz;
  final int quizAnswer;
  final String practiceId;
  final String practiceUrl;
  final List<String> solvedBy;
  Practice(
      {required this.type,
      required this.quiz,
      required this.quizAnswer,
      this.practiceId = '',
      required this.practiceUrl,
      required this.solvedBy});

  factory Practice.fromJson(Map<String, dynamic>? json) =>
      _$PracticeFromJson(json);
  Map<String, dynamic>? toJson() => _$PracticeToJson(this);
}
