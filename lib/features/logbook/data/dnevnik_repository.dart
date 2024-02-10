import '../models/parameter.dart';

abstract class DnevnikRepository {
  Future<void> save(List<Parameter> parameters);

  Future<List<Parameter>> load();
}