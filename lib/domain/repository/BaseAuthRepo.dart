import 'package:either_dart/either.dart';
import '../../data/entity/Failure.dart';
import '../../data/entity/Success.dart';

abstract class BaseAuthRepo{
  Future<Either<Failure,Success>> login(String url,Map<String,dynamic> body);
  Future<Either<Failure,Success>> register(String url,Map<String,dynamic> body);
}