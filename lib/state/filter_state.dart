
abstract class FilterState {

}

class FilterInitial extends FilterState {
  final String filter;
  FilterInitial({required this.filter});
}

class FilterUpdated extends FilterState {
  final String filter;
  FilterUpdated({required this.filter});
}