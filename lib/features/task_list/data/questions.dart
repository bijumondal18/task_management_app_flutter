import 'package:hive/hive.dart';

part 'questions.g.dart';

@HiveType(typeId: 1)
class Questions extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final bool isCompleted;
  @HiveField(2)
  final String questionNo;

  Questions( this.title, this.isCompleted, this.questionNo);
}
