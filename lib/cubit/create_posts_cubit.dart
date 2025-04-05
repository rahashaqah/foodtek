
import 'package:bloc/bloc.dart';

import '../model/post_model.dart';
import '../state/create_posts_state.dart';



class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit() : super(IntCreatePostState());

  Future<void> createPost(PostModel postModel) async {
    try {
      emit(LoadingCreatePostState());

      emit(LoadedCreatePostState(postModel: postModel));
    } catch (e) {
      emit(ErrorCreatePostState(msg: e.toString()));
    }
  }
}
