
part of 'send_and_loading_file_bloc.dart';


abstract class SendAndLoadingFileEvent {
  DataForSendAndBuildDocx getDataForSendAndBuildDocx();
}

class SendDataAndLoadingFileEvent extends SendAndLoadingFileEvent{
  SendDataAndLoadingFileEvent(this._dataForSendAndBuildDocx);

  @override
  DataForSendAndBuildDocx getDataForSendAndBuildDocx(){
    return _dataForSendAndBuildDocx;
  }

  final DataForSendAndBuildDocx _dataForSendAndBuildDocx;

}
