import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  // Call delete function with context
                  deleteFunction?.call(context);
                },
                icon: Icons.delete,
                backgroundColor: Colors.orangeAccent.shade100,
                borderRadius: BorderRadius.circular(12),
              )
            ]
        ),
        child: Container(
          padding: EdgeInsets.all(24.0),
          decoration: BoxDecoration(
              color: Colors.purpleAccent[100],
            borderRadius: BorderRadius.circular(12)
          ),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              // task name
              Text(
                  taskName,
                style: TextStyle(
                  decoration: taskCompleted? TextDecoration.lineThrough : TextDecoration.none,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
