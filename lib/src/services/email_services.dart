import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class EmailServices extends ChangeNotifier {
  final _dio = Dio();

  bool _cargando = false;

  set setCargando(value) {
    _cargando = value;
    notifyListeners();
  }

  get cargando => _cargando;

  Future<bool> sendEmail(Map data) async {
    _cargando = true;

    const url = 'https://mailer-g-network-dev.herokuapp.com/api/email';

    // const url = 'http://localhost:8080/api/email';

    try {
      final resp = await _dio.post(
        url,
        data: data,
      );
      print(resp);
      _cargando = false;
      return true;
    } on DioError catch (e) {
      print(e);
      _cargando = false;

      return false;
    }
  }
}
