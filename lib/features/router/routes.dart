import 'package:burdenko/features/dnevnik/data/dnevnicki_gastro.dart';
import 'package:burdenko/features/dnevnik/view/widgets/file_picker_screen.dart';
import 'package:burdenko/features/dnevnik/view/widgets/text_parameter_input.dart';
import 'package:burdenko/features/dnevnik/view/dnevnichki.dart';
import 'package:burdenko/features/dnevnik/view/main_screen.dart';

final routes = {
  "/" : (context) => MainScreen(),
  "/dnevnicki_general" : (context, dnevnichki) => Dnevnichki(dnevnichkiGeneral: dnevnichki)
};