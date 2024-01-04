import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/horizontal_stepper.dart';
import 'package:another_stepper/widgets/vertical_stepper.dart';
import 'package:flutter/material.dart';

class AnotherStepper extends StatelessWidget {
  /// Another stepper is a package, which helps build
  /// customizable and easy to manage steppers.
  ///
  /// The package and be used to build horizontal as well
  /// as vertical steppers just by providing [Axis] in the [gap] parameter.
  const AnotherStepper({
    Key? key,
    required this.stepperList,
    this.trailingWidgets = const [],
    this.gap = 40,
    this.activeIndex = 0,
    required this.stepperDirection,
    this.inverted = false,
    this.activeBarColor,
    this.inActiveBarColor,
    this.barThickness = 2,
    this.dotWidget,
    this.titleTextStyle = const TextStyle(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    this.subtitleTextStyle = const TextStyle(
      fontSize: 12,
      color: Colors.grey,
      fontWeight: FontWeight.w500,
    ),
    this.scrollPhysics,
  }) : super(key: key);

  /// Stepper [List] of type [StepperData] to inflate stepper with data
  final List<StepperData> stepperList;

  /// To add trailing widgets to the stepper.
  /// Length should be equal to the length of [stepperList]
  ///
  /// It is used in [Axis.vertical] stepper only.
  final List<Widget> trailingWidgets;

  /// Gap between the items in the vertical stepper, Default = 40
  /// Recommended to keep it greater than 20.
  final double gap;

  /// Active index, till which [index] the stepper will be highlighted
  final int activeIndex;

  /// Stepper direction takes [Axis]
  /// Use [Axis.horizontal] to get horizontal stepper
  /// /// Use [Axis.vertical] to get vertical stepper
  final Axis stepperDirection;

  /// Inverts the stepper with text that is being used
  final bool inverted;

  /// Bar color for active step
  final Color? activeBarColor;

  /// Bar color for inactive step
  final Color? inActiveBarColor;

  /// Bar width/thickness/height
  final double barThickness;

  /// [Widget] for dot/point
  final Widget? dotWidget;

  /// [TextStyle] for title
  final TextStyle titleTextStyle;

  /// [TextStyle] for subtitle
  final TextStyle subtitleTextStyle;

  /// Scroll physics for listview
  final ScrollPhysics? scrollPhysics;

  @override
  Widget build(BuildContext context) {
    var caa = stepperDirection == Axis.horizontal
        ? CrossAxisAlignment.end
        : CrossAxisAlignment.start;
    if (inverted) {
      // invert Alignment
      caa = caa == CrossAxisAlignment.end
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end;
    }
    final Iterable<int> iter = Iterable<int>.generate(stepperList.length);
    return SizedBox(
      child: Flex(
        crossAxisAlignment: caa,
        direction: stepperDirection,
        children:
            iter.map((index) => _getPreferredStepper(context, index)).toList(),
      ),
    );
  }

  Widget _getPreferredStepper(BuildContext context, index) {
    if (stepperDirection == Axis.horizontal) {
      return HorizontalStepperItem(
        index: index,
        item: stepperList[index],
        totalLength: stepperList.length,
        activeIndex: activeIndex,
        isInverted: inverted,
        inActiveBarColor: inActiveBarColor ?? Theme.of(context).disabledColor,
        activeBarColor:
            inActiveBarColor ?? Theme.of(context).colorScheme.primary,
        barHeight: barThickness,
        dotWidget: dotWidget,
        titleTextStyle: titleTextStyle,
        subtitleTextStyle: subtitleTextStyle,
      );
    } else {
      return VerticalStepperItem(
        index: index,
        item: stepperList[index],
        trailingWidget: trailingWidgets[index],
        totalLength: stepperList.length,
        gap: gap,
        activeIndex: activeIndex,
        isInverted: inverted,
        inActiveBarColor: inActiveBarColor ?? Theme.of(context).disabledColor,
        activeBarColor:
            inActiveBarColor ?? Theme.of(context).colorScheme.primary,
        barWidth: barThickness,
        dotWidget: dotWidget,
        titleTextStyle: titleTextStyle,
        subtitleTextStyle: subtitleTextStyle,
      );
    }
  }
}
