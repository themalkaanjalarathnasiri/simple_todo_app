import 'package:flutter/material.dart';
import 'package:todo_application_full/util/dialog_box.dart';

import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // text controller
  final _controller = TextEditingController();

  // list to do tasks
  List toDoList= [
    ["Make Tutorial", false],
  ];

  // checkbox was tapped
  void checkBoxChanged(bool? value, int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // save new task
  void saveNewTask () {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }
    // create new task
    void createNewTask() {
      showDialog(
          context: context,
          builder: (context) {
            return DialogBox(
              controller: _controller,
              onSave: saveNewTask,
              onCancel: () => Navigator.of(context).pop(),
            );
          }
      );
    }

    // delete task
  void deleteTask(int index){
    setState(() {
      toDoList.remove(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: Text(
            "TO DO",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context,index) {
          return ToDoTile(
              taskName:toDoList[index][0],
              taskCompleted:toDoList[index][1] ,
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context)=> deleteTask(index),
          );
        },
      )


    );
  }
}
