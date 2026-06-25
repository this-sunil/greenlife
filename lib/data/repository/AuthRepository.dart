import 'package:either_dart/src/either.dart';
import 'package:greenlife/data/entity/Failure.dart';
import 'package:greenlife/data/entity/Success.dart';
import 'package:greenlife/domain/repository/BaseAuthRepo.dart';

class AuthRepository implements BaseAuthRepo{
  @override
  Future<Either<Failure, Success>> login(String url, Map<String, dynamic> body) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Success>> register(String url, Map<String, dynamic> body) {
    // TODO: implement register
    throw UnimplementedError();
  }

}