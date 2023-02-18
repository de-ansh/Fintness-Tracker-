import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worky/data/workout_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void createNewWorkOut() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Create New WorkOut"),
              content: TextField(),
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

  void save() {}
  void cancel() {}

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
                )),
      ),
    );
  }
}
