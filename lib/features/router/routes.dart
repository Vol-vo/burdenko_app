import 'package:burdenko/features/logbook/view/export_view_all.dart';

final routes = {
  "/" : (context) => const MainScreen(),
  "/department" : (context) => const DepartmentListScreen(),
  "/logbook" : (context) => const InitialInspection(),
  "/currentDepartment" : (context) => const CurrentDepartment(),
  "/departureParamsAndSendingOnEmail" : (context) => const DepartureParamsAndSendingOnEmail()
};