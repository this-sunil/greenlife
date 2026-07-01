part of 'InternetBloc.dart';
enum InternetStatus {initial,loading,completed,error}

class InternetState extends Equatable{
  final InternetStatus? status;
  final String? msg;
  const InternetState({this.status,this.msg});

  factory InternetState.initial(){
    return InternetState(status: .initial);
  }

  InternetState copyWith({InternetStatus? status,String? msg}){
    return InternetState(status: status??status,msg: msg??msg);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status,msg];




}