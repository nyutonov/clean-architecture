part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

class OnChangeCityEvent extends HomeEvent {
  final String city;

  const OnChangeCityEvent(this.city);

  @override
  List<Object?> get props => [city];
}
