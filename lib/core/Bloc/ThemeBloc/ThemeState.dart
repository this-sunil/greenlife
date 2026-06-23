part of 'ThemeBloc.dart';

enum ThemeStatus { initial, loading, completed, error }

class ThemeState extends Equatable {
  final ThemeStatus? status;
  final ThemeData? theme;

  const ThemeState({this.status, this.theme});

  factory ThemeState.initial() => ThemeState(status: ThemeStatus.initial);

  ThemeState copyWith({ThemeStatus? status, ThemeData? theme}) {
    return ThemeState(status: status ?? status, theme: theme ?? theme);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, theme];
}
