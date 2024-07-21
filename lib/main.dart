import 'dart:async';

import 'package:flutter/material.dart';

import 'core/navigation/router/burdenko_app.dart';
import 'core/navigation/router/logger.dart';

void main() {
  runZonedGuarded(() => runApp(const Wrapper()), (error, stack) {
    logger.e(error, error: error, stackTrace: stack);
  });
}

final rootKey = GlobalKey<NavigatorState>();