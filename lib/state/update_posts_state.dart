


import '../model/post_model.dart';

abstract class UpdatePostState {}

class IntUpdatePostState extends UpdatePostState {}

class LoadingUpdatePostState extends UpdatePostState {}

class LoadedUpdatePostState extends UpdatePostState {
  PostModel postModel;

  LoadedUpdatePostState({required this.postModel});
}

class ErrorUpdatePostState extends UpdatePostState {
  String msg;

  ErrorUpdatePostState({required this.msg});
}