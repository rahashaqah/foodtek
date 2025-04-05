
import '../model/post_model.dart';

abstract class CreatePostState {}

class IntCreatePostState extends CreatePostState {}

class LoadingCreatePostState extends CreatePostState {}

class LoadedCreatePostState extends CreatePostState {
  PostModel postModel;

  LoadedCreatePostState({required this.postModel});
}

class ErrorCreatePostState extends CreatePostState {
  String msg;

  ErrorCreatePostState({required this.msg});
}