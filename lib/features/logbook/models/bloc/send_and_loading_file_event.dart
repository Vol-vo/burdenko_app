
part of 'send_and_loading_file_bloc.dart';

@immutable
abstract class SendAndLoadingFileEvent {}

class SendDataAndLoadingFile extends SendAndLoadingFileEvent{
  SendDataAndLoadingFile(this.dataForSendAndBuildDocx);

  final DataForSendAndBuildDocx dataForSendAndBuildDocx;
}
