part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ThemeChanged extends ThemeEvent {
  final AppTheme appTheme;

  ThemeChanged({@required this.appTheme});
  @override
  List<Object> get props => [appTheme];
}
