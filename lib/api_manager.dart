// import 'package:dio/adapter.dart';
// import 'package:dio/dio.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// import '../../customer/auth/screens/login/login_import.dart';
// import '../utils/environment_config.dart';
// import 'api_interceptor.dart';

// class ApiManager {
//   final int _connectTimeout = 10 * 100000;
//   final int _receiveTimeout = 15 * 100000;

//   Dio? dio;

//   ApiManager(ByteData data) {
//     BaseOptions options = BaseOptions(
//       baseUrl: EnvironmentConfig.baseUrl,
//       connectTimeout: _connectTimeout,
//       receiveTimeout: _receiveTimeout,
//       contentType: Headers.jsonContentType,
//       headers: {
//         "Accept": "application/json",
//       },
//     );

//     dio = Dio(options);
//     dio!.interceptors.add(
//       ApiInterceptor(
//         dioInstance: dio,
//       ),
//     );

//     /// to handle SSL handsake error.
//     (dio?.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//         (HttpClient client) {
//       if (EnvironmentConfig.envIsProd) {
//         // !TODO: uncomment this and comment code below

//         // ByteData data = await rootBundle.load(NetworkSource.sslCertificate);
//         SecurityContext sc = new SecurityContext(withTrustedRoots: true);
//         sc.setTrustedCertificatesBytes(data.buffer.asUint8List());
//         HttpClient httpClient = new HttpClient(context: sc);
//         return httpClient;
//       } else {
//         client.badCertificateCallback =
//             (X509Certificate cert, String host, int port) => true;
//         return client;
//       }

//       // client.badCertificateCallback =
//       //     (X509Certificate cert, String host, int port) => true;
//       // return client;
//     };

//     // if any error occurred, display error with response
//     dio!.interceptors.add(
//       PrettyDioLogger(
//         requestHeader: false,
//         responseBody: false,
//         requestBody: true,
//         responseHeader: false,
//         compact: false,
//       ),
//     );
//   }
// }
