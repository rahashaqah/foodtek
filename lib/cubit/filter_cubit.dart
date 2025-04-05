// lib/cubit/filter_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial(filter:'All'));

  void setFilter(String filter) {
    emit(FilterUpdated(filter:filter));
  }
}