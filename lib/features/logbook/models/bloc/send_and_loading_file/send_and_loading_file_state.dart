part of 'send_and_loading_file_bloc.dart';

abstract class SendAndLoadingFileState {}

class SendDataState extends SendAndLoadingFileState {

}
class BuildingDocxState extends SendAndLoadingFileState {}
class LoadingDocxState extends SendAndLoadingFileState {}
class DefaultState extends SendAndLoadingFileState {}
class FileIsReadyState extends SendAndLoadingFileState{
  FileIsReadyState({required this.file});

  final File file;

}
