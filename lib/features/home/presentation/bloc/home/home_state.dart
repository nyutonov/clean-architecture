part of 'home_bloc.dart';

class HomeState extends Equatable {
  final String selectedCity;

  const HomeState({
    this.selectedCity = "Ташкент",
  });

  HomeState copyWith({
    String? selectedCity,
  }) {
    return HomeState(
      selectedCity: selectedCity ?? this.selectedCity,
    );
  }

  @override
  List<Object?> get props => [
        selectedCity,
      ];
}
