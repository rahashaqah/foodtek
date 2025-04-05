
import 'package:bloc/bloc.dart';

import '../model/post_model.dart';
import '../state/update_posts_state.dart';



class UpdatePostCubit extends Cubit<UpdatePostState> {
  UpdatePostCubit() : super(IntUpdatePostState());

  Future<void> updatePost(PostModel postModel) async {
    try {
      emit(LoadingUpdatePostState());

      emit(LoadedUpdatePostState(postModel: postModel));
    } catch (e) {
      emit(ErrorUpdatePostState(msg: e.toString()));
    }
  }
}
