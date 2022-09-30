// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyUser _$MyUserFromJson(Map<String, dynamic>? json) => MyUser(
      uid: json!['uid'] as String? ?? '',
      name: json['name'] as String? ?? '',
      age: json['age'] as int? ?? 20,
      solved10SecPractice: json['solved10SecPractice'] as int? ?? 0,
      solved15SecPractice: json['solved15SecPractice'] as int? ?? 0,
    );

Map<String, dynamic>? _$MyUserToJson(MyUser instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'age': instance.age,
      'solved10SecPractice': instance.solved10SecPractice,
      'solved15SecPractice': instance.solved15SecPractice,
    };

Practice _$PracticeFromJson(Map<String, dynamic>? json) => Practice(
      type: json!['type'] as int,
      answer: json['answer'] as int,
      numberOfLines: json['numberOfLines'] as int,
      quizAnswer: json['quizAnswer'] as int,
      practiceId: json['practiceId'] as String,
      practiceUrl: json['practiceUrl'] as String,
      solvedBy:
          (json['solvedBy'] as List<dynamic>).map((e) => e as String).toList(),
      quiz:
          (json['quiz'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic>? _$PracticeToJson(Practice instance) => <String, dynamic>{
      'type': instance.type,
      'answer': instance.answer,
      'numcerOfLines': instance.numberOfLines,
      'quiz': instance.quiz,
      'quizAnswer': instance.quizAnswer,
      'practiceId': instance.practiceId,
      'practiceUrl': instance.practiceUrl,
      'solvedBy': instance.solvedBy,
    };
