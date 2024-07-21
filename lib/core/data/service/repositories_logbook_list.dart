import '../../models/model_for_department/department/department.dart';

abstract class RepositoriesLogbookList{
  Future<List<Department>> getLogbookList(String fileString);
}

