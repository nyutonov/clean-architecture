import "dart:io";

import "package:dio/dio.dart";
import "package:get_it/get_it.dart";
import "package:hive/hive.dart";
import "package:internet_connection_checker/internet_connection_checker.dart";
import "package:tana/core/connectivity/network_info.dart";
import "package:tana/core/local_source/local_source.dart";
import "package:path_provider/path_provider.dart";

import "constants/constants.dart";
import "core/network/request_manager.dart";
import "features/auth/domain/auth_repository.dart";
import "features/home/presentation/bloc/home/home_bloc.dart";
import "features/users/presentation/bloc/users/users_bloc.dart";

final GetIt sl = GetIt.instance;
late Box<dynamic> _box;

final NetworkInfo networkInfo = sl<NetworkInfo>();
final LocalSource localSource = sl<LocalSource>();

Future<void> init() async {
  // hive
  await _initHive();

  // dio
  sl.registerLazySingleton(
    () => Dio(),
  );

  // core
  sl
    ..registerSingleton(InternetConnectionChecker.createInstance(
      checkInterval: const Duration(seconds: 3),
    ))
    ..registerSingleton<NetworkInfo>(NetworkInfoImpl(sl()))
    ..registerSingleton<LocalSource>(LocalSource(_box))
    ..registerSingleton<RequestManager>(RequestManager(dio: sl()));

  // sl<Dio>().options = BaseOptions(
  //   contentType: "application/json",
  //   baseUrl: PConstants.baseUrl,
  //   sendTimeout: const Duration(seconds: 30),
  //   connectTimeout: const Duration(seconds: 30),
  //   receiveTimeout: const Duration(seconds: 30),
  //   headers: <String, dynamic>{
  //     "x-access-token": localSource.accessToken,
  //   },
  // );
  //
  // sl<Dio>().interceptors.addAll(
  //   <Interceptor>[
  //     InterceptorsWrapper(
  //       onError: (error, handler) async {
  //         if (await networkInfo.isConnected == false) {
  //           final RouteMatch lastMatch = router.routerDelegate.currentConfiguration.last;
  //           final RouteMatchList matchList = lastMatch is ImperativeRouteMatch ? lastMatch.matches : router.routerDelegate.currentConfiguration;
  //           final String location = matchList.uri.toString();
  //           if (location.contains(Routes.noInternet)) {
  //             return;
  //           }
  //
  //           await router.push(Routes.noInternet);
  //
  //           return handler.reject(error);
  //         }
  //
  //         if (error.response?.statusCode != 401 && localSource.isUserLoggedIn) {
  //           CustomSneakBar.show(
  //             status: SneakBarStatus.error,
  //             message: error.toString(),
  //           );
  //         }
  //
  //         if (error.response?.statusCode == 401 && localSource.isUserLoggedIn) {
  //           final result = await sl<AuthRepository>().refresh(
  //             localSource.refreshToken,
  //           );
  //
  //           result.fold(
  //             (left) async {
  //               await localSource.clearUserData();
  //               rootNavigatorKey.currentContext?.go(Routes.signIn);
  //
  //               return handler.reject(error);
  //             },
  //             (right) async {
  //               localSource.setAccessToken(right.accessToken ?? "");
  //               sl<Dio>().options.headers["x-access-token"] = right.accessToken;
  //
  //               final newOptions = error.requestOptions;
  //               final response = await sl<Dio>().request(
  //                 newOptions.path,
  //                 options: Options(
  //                   contentType: "application/json",
  //                   method: newOptions.method,
  //                   headers: <String, dynamic>{
  //                     "x-access-token": right.accessToken,
  //                   },
  //                 ),
  //                 data: newOptions.data,
  //                 queryParameters: newOptions.queryParameters,
  //               );
  //
  //               return handler.resolve(response);
  //             },
  //           );
  //         } else {
  //           return handler.next(error);
  //         }
  //       },
  //     ),
  //     LogInterceptor(
  //       error: kDebugMode,
  //       request: kDebugMode,
  //       requestBody: kDebugMode,
  //       responseBody: kDebugMode,
  //       requestHeader: kDebugMode,
  //       responseHeader: kDebugMode,
  //       logPrint: (Object object) {
  //         if (kDebugMode) {
  //           log("dio: $object");
  //         }
  //       },
  //     ),
  //   ],
  // );

  sl
    // repository
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(requestManager: sl()))

    // bloc
    ..registerFactory(() => HomeBloc())
    ..registerFactory(() => UsersBloc());
}

Future<void> _initHive() async {
  const String boxName = PKeys.box;
  final Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  _box = await Hive.openBox<dynamic>(boxName);
}
