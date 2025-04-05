


import '../model/post_model.dart';

abstract class GetAllPostsState {}

class IntGetAllPostState extends GetAllPostsState {}

class LoadingGetAllPostState extends GetAllPostsState {}

class LoadedGetAllPostState extends GetAllPostsState {
  List<PostModel> posts;

  LoadedGetAllPostState({required this.posts});
}

class ErrorGetAllPostState extends GetAllPostsState {
  String msg;

  ErrorGetAllPostState({required this.msg});
}