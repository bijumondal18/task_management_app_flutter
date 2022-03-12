
import 'package:flutter_todo_app/features/task_list/data/questions.dart';
import 'package:hive/hive.dart';

class QuestionDatabase {
  final String _boxName = "Questions";

  Future<Box> questionBox() async {
    var box = await Hive.openBox<Questions>(_boxName);

    await box.clear();

    Questions question1 = Questions('Do you mark your attendance?', false, "1");
    box.add(question1);
    Questions question2 = Questions('Do you serve tea?', true, "2");
    box.add(question2);
    Questions question3 = Questions('Are you in the office today?', false, "3");
    box.add(question3);
    Questions question4 = Questions('Are you in the office today?', false, "4");
    box.add(question4);
    Questions question5 = Questions('Are you in the office today?', false, "5");
    box.add(question5);
    Questions question6 = Questions('Do you like bikes?', false, "6");
    box.add(question6);


    return box;
  }

  Future<List<Questions>> getAllTasks() async {
    final box = await questionBox();
    List<Questions> questions = box.values.toList() as List<Questions>;
    return questions;
  }

  Future<void> addToBox(Questions questions) async {
    final box = await questionBox();
    await box.add(questions);
  }

  Future<void> deleteAllFromBox() async {
    final box = await questionBox();
    await box.clear();
  }

  Future<void> editFromBox(int index, Questions questions) async {
    final box = await questionBox();
    await box.putAt(index, questions);
  }
}