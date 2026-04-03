import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class AnimSequences {
  static SequenceAnimation logoInit(AnimationController controller) {
    return SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<double>(begin: 0.0, end: 1.0),
          from: const Duration(seconds: 0),
          to: const Duration(seconds: 2),
          tag: "Logo Fade",
        )
        .addAnimatableAfterLastOne(
          duration: Duration(seconds: 2),
          animatable: Tween<Alignment>(
            begin: Alignment.center,
            end: Alignment.topLeft,
          ),
          tag: "Logo Alignment",
          delay: Duration(milliseconds: 500),
        )
        .addAnimatableAfterLastOne(
          animatable: Tween<double>(begin: 0, end: 1),
          duration: Duration(seconds: 2),
          delay: Duration(milliseconds: 500),
          tag: "Logo Text Opacity",
        )
        .animate(controller);
  }

  static SequenceAnimation sideBarFadeIn(AnimationController controller) {
    return SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<double>(begin: 0.0, end: 1.0),
          from: Duration(milliseconds: 0),
          to: Duration(milliseconds: 200),
          tag: "Option1",
        )
        .addAnimatableAfterLastOne(
          animatable: Tween<double>(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: 200),
          tag: "Option2",
        )
        .addAnimatableAfterLastOne(
          animatable: Tween<double>(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: 200),
          tag: "Option3",
        )
        .addAnimatableAfterLastOne(
          animatable: Tween<double>(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: 200),
          tag: "Option4",
        )
        .animate(controller);
  }

  static SequenceAnimation bodyAnimAboutUs(AnimationController controller) {
    return SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<double>(begin: 0.0, end: 1.0),
          from: Duration(seconds: 0),
          to: Duration(milliseconds: 500),
          tag: "Header",
        )
        .addAnimatableAfterLastOne(
          animatable: Tween<double>(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: 500),
          tag: "Body",
        )
        .animate(controller);
  }

  static SequenceAnimation serviceBody(AnimationController controller) {
    return SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<double>(begin: 0.0, end: 1.0),
          from: Duration(milliseconds: 500),
          to: Duration(milliseconds: 500),
          tag: "Title",
        )
        .addAnimatableAfterLastOne(
          animatable: Tween<double>(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: 500),
          tag: "Header1",
        )
        .addAnimatableAfterLastOne(
          animatable: Tween<double>(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: 500),
          tag: "Header2",
        )
        .addAnimatableAfterLastOne(
          animatable: Tween<double>(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: 500),
          tag: "Body",
        )
        .addAnimatableAfterLastOne(
          animatable: Tween<double>(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: 500),
          tag: "Footer",
        )
        .animate(controller);
  }

  static SequenceAnimation policiesBody(AnimationController controller) {
    return SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<double>(begin: 0.0, end: 1.0),
          from: Duration(milliseconds: 500),
          to: Duration(milliseconds: 500),
          tag: "Title1",
        )
        .addAnimatableAfterLastOne(
          animatable: Tween<double>(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: 500),
          tag: "Header1",
        )
        .addAnimatableAfterLastOne(
          animatable: Tween<double>(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: 500),
          tag: "Header2",
        )
        .addAnimatableAfterLastOne(
          animatable: Tween<double>(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: 500),
          tag: "Body1",
        )
        .addAnimatableAfterLastOne(
          animatable: Tween<double>(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: 500),
          tag: "Footer1",
        )
        .addAnimatableAfterLastOne(
          animatable: Tween<double>(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: 500),
          tag: "Title2",
        )
        .addAnimatableAfterLastOne(
          animatable: Tween<double>(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: 500),
          tag: "Header3",
        )
        .addAnimatableAfterLastOne(
          animatable: Tween<double>(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: 500),
          tag: "Header4",
        )
        .addAnimatableAfterLastOne(
          animatable: Tween<double>(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: 500),
          tag: "Body2",
        )
        .addAnimatableAfterLastOne(
          animatable: Tween<double>(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: 500),
          tag: "Footer2",
        )
        .animate(controller);
  }
}
