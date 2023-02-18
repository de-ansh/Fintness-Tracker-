import 'package:flutter/material.dart';
import 'package:worky/models/excercise.dart';
import 'package:worky/models/workout.dart';

class WorkoutData extends ChangeNotifier {
  List<WorkOut> workoutList = [
    WorkOut(name: 'Upper Body', excercises: [
      Exercise(name: "Bicep Curls", weight: "10", reps: "10", sets: "3"),
    ]),
    WorkOut(name: 'Legs', excercises: [
      Exercise(
          name: "Free Squats", weight: "Body Weight", reps: "50", sets: "3"),
    ])
  ];
  //get the list of Workout
  List<WorkOut> getWorkoutList() {
    return workoutList;
  }

  //list length
  int numberOfExercisesInWorkout(String workoutName) {
    WorkOut relevantWorkout = getReleventWorkout(workoutName);
    return relevantWorkout.excercises.length;
  }

  //add aworkout

  void addWorkout(String name) {
    workoutList.add(WorkOut(name: name, excercises: []));
    notifyListeners();
  }

  //add an excercise to workout

  void addExercise(String workoutName, String exercise, String weight,
      String reps, String sets) {
    //find the relevent Workout

    WorkOut relevantWorkout = getReleventWorkout(workoutName);
    relevantWorkout.excercises
        .add(Exercise(name: exercise, weight: weight, reps: reps, sets: sets));

    notifyListeners();
  }

  //checkoff excercise
  void checkOffExercise(String workoutName, String exerciseName) {
    //find the relevent workout and relevent exercise
    Exercise relevantExercise = getReleventExercise(workoutName, exerciseName);

    relevantExercise.isCompleted = !relevantExercise.isCompleted;
    notifyListeners();
  }

//helper method
  WorkOut getReleventWorkout(String workoutName) {
    WorkOut relevantWorkout =
        workoutList.firstWhere((workout) => workout.name == workoutName);
    return relevantWorkout;
  }

  Exercise getReleventExercise(String workoutName, String exerciseName) {
    WorkOut relevantWorkout = getReleventWorkout(workoutName);
    Exercise relevantExercise = relevantWorkout.excercises
        .firstWhere((exercise) => exercise.name == exerciseName);
    return relevantExercise;
  }
//return
}
