import 'dart:async';

import 'package:flutter/material.dart';
import 'package:burdenko/features/router/burdenko_app.dart';
import 'package:burdenko/features/router/logger.dart';

void main() {
  runZonedGuarded(() => runApp(const Wrapper()), (error, stack) {
    logger.e(error, error: error, stackTrace: stack);
  });
}

final rootKey = GlobalKey<NavigatorState>();