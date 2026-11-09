import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Cobra extends CircleComponent {
  Vector2 velocity = Vector2(0, 150);

  Cobra({required double radius, required Vector2 position})
    : super(radius: radius, position: position, anchor: Anchor.center);

  @override
  void onLoad() {
    super.onLoad();
    paint = Paint()..color = Colors.blue;
  }

  @override
  void update(double dt) {
    super.update(dt);

    position += velocity * dt;
  }
}
