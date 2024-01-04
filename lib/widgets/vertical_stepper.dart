import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/utils/utils.dart';
import 'package:another_stepper/widgets/stepper_dot_widget.dart';
import 'package:flutter/material.dart';

class VerticalStepperItem extends StatelessWidget {
  /// Stepper Item to show vertical stepper
  const VerticalStepperItem({
    Key? key,
    required this.item,
    required this.index,
    required this.totalLength,
    required this.gap,
    required this.activeIndex,
    required this.isInverted,
    required this.activeBarColor,
    required this.inActiveBarColor,
    required this.barWidth,
    required this.dotWidget,
    required this.titleTextStyle,
    required this.subtitleTextStyle,
  }) : super(key: key);

  /// Stepper item of type [StepperData] to inflate stepper with data
  final StepperData item;

  /// Index at which the item is present
  final int index;

  /// Total length of the list provided
  final int totalLength;

  /// Active index which needs to be highlighted and before that
  final int activeIndex;

  /// Gap between the items in the stepper
  final double gap;

  /// Inverts the stepper with text that is being used
  final bool isInverted;

  /// Bar color for active step
  final Color activeBarColor;

  /// Bar color for inactive step
  final Color inActiveBarColor;

  /// Bar width/thickness
  final double barWidth;

  /// [Widget] for dot/point
  final Widget? dotWidget;

  /// [TextStyle] for title
  final TextStyle titleTextStyle;

  /// [TextStyle] for subtitle
  final TextStyle subtitleTextStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: isInverted ? getInvertedChildren() : getChildren(),
    );
  }

  List<Widget> getChildren() {
    return [
      Column(
        children: [
          Container(
            color: index == 0
                ? Colors.transparent
                : (index <= activeIndex ? activeBarColor : inActiveBarColor),
            width: barWidth,
            height: gap,
          ),
          index <= activeIndex
              ? item.leadingWidget ??
                  StepperDot(
                    index: index,
                    totalLength: totalLength,
                    activeIndex: activeIndex,
                  )
              : ColorFiltered(
                  colorFilter: Utils.getGreyScaleColorFilter(),
                  child: item.leadingWidget ??
                      StepperDot(
                        index: index,
                        totalLength: totalLength,
                        activeIndex: activeIndex,
                      ),
                ),
          Container(
            color: index == totalLength - 1
                ? Colors.transparent
                : (index < activeIndex ? activeBarColor : inActiveBarColor),
            width: barWidth,
            height: gap,
          ),
        ],
      ),
      const SizedBox(width: 8),
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: isInverted
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                if (item.title != null) ...[
                  item.title!,
                ],
                if (item.subtitle != null) ...[
                  const SizedBox(height: 8),
                  SizedBox(
                    width: 230,
                    child: item.subtitle!,
                  ),
                ],
              ],
            ),
            item.trailingWidget ?? const SizedBox(),
          ],
        ),
      ),
    ];
  }

  List<Widget> getInvertedChildren() {
    return getChildren().reversed.toList();
  }
}
