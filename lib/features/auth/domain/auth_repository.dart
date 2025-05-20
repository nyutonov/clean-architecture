import 'package:tana/core/network/request_manager.dart';

abstract class AuthRepository {}

class AuthRepositoryImpl extends AuthRepository {
  final RequestManager requestManager;

  AuthRepositoryImpl({required this.requestManager});
}
