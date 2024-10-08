// ignore_for_file: unnecessary_cast, use_build_context_synchronously

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:innerlibs/build_context_extensions.dart';
import 'package:innerlibs/global.dart';

class RestartWidget extends StatefulWidget {
  const RestartWidget({super.key, required this.child, this.onRestart});

  final void Function(BuildContext)? onRestart;

  final Widget child;

  static void restartApp(BuildContext context) {
    var base = context.findAncestorStateOfType<_RestartWidgetState>();
    if (base != null) {
      base.restartApp();
    } else {
      consoleLog("Cannot restart the app. Check if you app is wrapped with RestartWidget");
      context.popUntilFirst();
    }
  }

  @override
  createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = ValueKey(Random().nextDouble());
    });
    if (widget.onRestart != null) {
      widget.onRestart!(context);
    }
  }

  @override
  Widget build(BuildContext context) => KeyedSubtree(
        key: key,
        child: widget.child,
      );
}
