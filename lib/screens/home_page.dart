import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worky/data/workout_data.dart';
import 'package:worky/screens/workout_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final newWorkoutNameController = TextEditingController();

  void createNewWorkOut() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Create New WorkOut"),
              content: TextField(
                controller: newWorkoutNameController,
              ),
              actions: [
                //Save
                MaterialButton(
                  onPressed: save,
                  child: Text("Save"),
                ),

                //Cancel
                MaterialButton(
                  onPressed: cancel,
                  child: Text("Cancel"),
                ),
              ],
            ));
  }

  void save() {
    String newWorkoutName = newWorkoutNameController.text;
    Provider.of<WorkoutData>(context, listen: false).addWorkout(newWorkoutName);
    Navigator.pop(context);
    clear();
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    newWorkoutNameController.clear();
  }

  void goToWorkoutPage(String workoutName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkoutPage(
          workoutName: workoutName,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
      builder: (context, value, index) => Scaffold(
        appBar: AppBar(
          title: const Text('Workout Tracker'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewWorkOut,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: value.getWorkoutList().length,
            itemBuilder: (context, index) => ListTile(
                  title: Text(value.getWorkoutList()[index].name),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () =>
                        goToWorkoutPage(value.getWorkoutList()[index].name),
                  ),
                )),
      ),
    );
  }
}
