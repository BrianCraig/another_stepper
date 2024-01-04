import 'package:flutter/material.dart';

class StepperData {
  final Text? title;
  final Text? subtitle;
  final Widget? trailingWidget;
  final Widget? leadingWidget;

  const StepperData({
    this.title,
    this.subtitle,
    this.leadingWidget,
    this.trailingWidget,
  });
}
