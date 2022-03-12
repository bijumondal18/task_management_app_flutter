import 'package:flutter/material.dart';
import 'package:flutter_todo_app/common/widgets/custom_app_bar.dart';

import '../../../common/common.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({Key? key}) : super(key: key);

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Create New Task'),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const SizedBox(height: AppSizes.padding24),
            //TODO: text field to write new task
            const Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Create New Task',
                  hintText: 'Write Your Task Here...',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.primary,
                  textStyle: const TextStyle(fontSize: AppSizes.font16),
                  minimumSize: const Size.fromHeight(
                      48), // fromHeight use double.infinity as width and 40 is the height
                ),
                onPressed: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Confirmation'),
                      content:
                          const Text('Are you sure you want to add this task?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text(
                            'Cancel',
                          ),
                        ),
                        TextButton(
                          //TODO: button to submit task to database and close the dialog

                          onPressed: () => Navigator.pop(context, 'Submit'),
                          child: const Text(
                            'Submit',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('Add Task'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
