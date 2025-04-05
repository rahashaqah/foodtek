
import 'package:bloc/bloc.dart';

import '../model/post_model.dart';
import '../state/get_all_posts_state.dart';


class GetAllPostsCubit extends Cubit<GetAllPostsState> {
  GetAllPostsCubit() : super(IntGetAllPostState());

  Future<void> getAllPosts() async {
    try {
      emit(LoadingGetAllPostState());

      List<PostModel> posts = [];
      emit(LoadedGetAllPostState(posts: posts));
    } catch (e) {
      emit(ErrorGetAllPostState(msg: e.toString()));
    }
  }
}
