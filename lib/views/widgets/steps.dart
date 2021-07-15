import 'package:flutter/material.dart';

class Steps{
  List<Step> steps = [
    Step(
      title: Text("Ordered Wednesday, May 23"),
      content: Text(""),
      isActive: true,
      state: StepState.complete,
    ),
    Step(
      title: Text("Shipped Wednesday, May 23"),
      content: Text(""),
      isActive: false,
      state: StepState.complete,
    ),
    Step(
      title: Text("Out for Dilivery"),
      content: Text(""),
      isActive: false,
      state: StepState.complete,
    ),
    Step(
      title: Text("Arriving Today by 8PM"),
      content: Text(""),
      isActive: false,
      state: StepState.complete,
    )
  ];
}