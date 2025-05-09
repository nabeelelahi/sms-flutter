import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms/config/app_config.dart';
import 'package:sms/services/toast.dart';
import 'package:toastification/toastification.dart';

class RequestSingleton<T> {
  final _baseUrl = Uri.parse(AppConfig.baseUrl); // Replace with your base URL
  static const Duration _timeout = Duration(seconds: 10);

  String? _endpoint;
  String? _method;
  bool _withAuth = true;
  bool _withToast = true;
  Map<String, String> _headers = {};
  Map<String, dynamic> _params = {};
  dynamic _body;
  Function(T data, Map<String, String> headers)? _onSuccess;
  Function(dynamic error)? _onFailure;

  RequestSingleton(this._endpoint, this._method);

  RequestSingleton<T> setAuth(bool value) {
    _withAuth = value;
    return this;
  }

  RequestSingleton<T> setParams(Map<String, dynamic> params) {
    _params.addAll(params);
    return this;
  }

  RequestSingleton<T> setHeaders(Map<String, String> headers) {
    _headers.addAll(headers);
    return this;
  }

  RequestSingleton<T> setBody(dynamic body) {
    _body = body;
    return this;
  }

  RequestSingleton<T> setToast(dynamic body) {
    _withToast = true;
    return this;
  }

  RequestSingleton<T> onSuccess(
    Function(T data, Map<String, String> headers) callback,
  ) {
    _onSuccess = callback;
    return this;
  }

  RequestSingleton<T> onFailure(Function(dynamic error) callback) {
    _onFailure = callback;
    return this;
  }

  Future<void> call() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (_withAuth) {
        final token = prefs.getString('auth_token');
        print('token');
        print(token);
        print('token');
        if (token != null) {
          _headers['Authorization'] = 'Bearer $token';
        }
      }
      final uri = Uri.parse('$_baseUrl$_endpoint').replace(
        queryParameters: _params.map(
          (key, value) => MapEntry(key, value.toString()),
        ),
      );
      http.Response response;
      switch (_method?.toUpperCase()) {
        case 'POST':
          _headers['Content-Type'] = 'application/json';
          response = await http
              .post(uri, headers: _headers, body: json.encode(_body))
              .timeout(_timeout);
          break;
        case 'GET':
          response = await http.get(uri, headers: _headers).timeout(_timeout);
          break;
        default:
          throw UnsupportedError('Unsupported HTTP method $_method');
      }

      final data = json.decode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        _onSuccess?.call(data as T, response.headers);
      } else {
        print('_withToast');
        print(_withToast);
        if (_withToast && _method != 'GET') {
          ToastHelper.show(
            message: data['message'] ?? 'Something went wrong',
            type: ToastificationType.error,
          );
        }
        _onFailure?.call(data);
      }
    } catch (e) {
      _onFailure?.call(e.toString());
    }
  }
}
