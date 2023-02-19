import 'package:flutter/material.dart';

class ExerciseTile extends StatelessWidget {
  final String exerciseName;
  final String weight;
  final String reps;
  final String sets;
  final bool isCompleted;
  void Function(bool?)? onCheckBoxChanged;

  ExerciseTile(
      {super.key,
      required this.exerciseName,
      required this.weight,
      required this.reps,
      required this.sets,
      required this.isCompleted,
      required this.onCheckBoxChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(0xFFd5e2db),
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle),
        child: ListTile(
          title: Text(exerciseName),
          subtitle: Row(
            children: [
              //weight
              Chip(
                  backgroundColor: const Color(0xFF04564a),
                  label: Text("$weight  ")),
              const SizedBox(
                width: 20,
              ),
              //reps
              Chip(
                  backgroundColor: const Color(0xFF04564a),
                  label: Text("$reps ")),
              const SizedBox(
                width: 20,
              ),
              //stes
              Chip(
                  backgroundColor: const Color(0xFF04564a),
                  label: Text("$sets sets")),
            ],
          ),
          trailing: Checkbox(
            value: isCompleted,
            onChanged: (value) => onCheckBoxChanged!(value),
          ),
        ),
      ),
    );
  }
}
