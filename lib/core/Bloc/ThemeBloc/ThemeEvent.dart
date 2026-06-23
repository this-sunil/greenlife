part of "ThemeBloc.dart";

abstract class ThemeEvent extends Equatable{}

class SetThemeEvent extends ThemeEvent{
  final bool isDark;
  SetThemeEvent({required this.isDark});
  @override
  // TODO: implement props
  List<Object?> get props => [isDark];
}

class LoadThemeEvent extends ThemeEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}