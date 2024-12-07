part of 'home_bloc.dart';

enum Status { loading, success, error }

class HomeState extends Equatable {
  final Status status;
  final List<Recipe> recipes;
  final bool hasReashedMax;
  final String errorMessage;

  const HomeState(
      {this.status = Status.loading,
      this.recipes = const [],
      this.hasReashedMax = false,
      this.errorMessage = ''});

  HomeState copyWith({
    Status? status,
    List<Recipe>? recipes,
    bool? hasReashedMax,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      recipes: recipes ?? this.recipes,
      hasReashedMax: hasReashedMax ?? this.hasReashedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, recipes, errorMessage, hasReashedMax];
}
