import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worky/components/exercisetile.dart';
import 'package:worky/data/workout_data.dart';

class WorkoutPage extends StatefulWidget {
  final String workoutName;
  const WorkoutPage({super.key, required this.workoutName});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  void onCheckBoxChanged(String workoutName, String exerciseName) {
    Provider.of<WorkoutData>(context, listen: false)
        .checkOffExercise(workoutName, exerciseName);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text(widget.workoutName),
        ),
        body: ListView.builder(
          itemCount: value.numberOfExercisesInWorkout(widget.workoutName),
          itemBuilder: (context, index) => ExerciseTile(
            exerciseName: value
                .getReleventWorkout(widget.workoutName)
                .excercises[index]
                .name,
            weight: value
                .getReleventWorkout(widget.workoutName)
                .excercises[index]
                .weight,
            reps: value
                .getReleventWorkout(widget.workoutName)
                .excercises[index]
                .reps,
            sets: value
                .getReleventWorkout(widget.workoutName)
                .excercises[index]
                .sets,
            isCompleted: value
                .getReleventWorkout(widget.workoutName)
                .excercises[index]
                .isCompleted,
            onCheckBoxChanged: (val) => onCheckBoxChanged(
                value
                    .getReleventWorkout(widget.workoutName)
                    .excercises[index]
                    .name,
                widget.workoutName),
          ),
        ),
      ),
    );
  }
}
