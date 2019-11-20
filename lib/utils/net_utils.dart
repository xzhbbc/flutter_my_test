import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/model/movie.dart';

Map<String, dynamic> optHeader = {
  'accept-language': 'zh-cn',
  'content-type': 'application/json'
};

// var dio = new Dio(BaseOptions(connectTimeout: 30000, headers: optHeader));

class NetUtils {
  static Dio _dio;
  static final String baseUrl = 'http://172.16.1.95';

  static void init() async {
    _dio = Dio(BaseOptions(
        baseUrl: '$baseUrl:3002',
        followRedirects: false,
        connectTimeout: 30000,
        headers: optHeader));
  }

  static Future get(String url, [Map<String, dynamic> params]) async {
    var response;
    if (params != null) {
      response = await _dio.get(url, queryParameters: params);
    } else {
      response = await _dio.get(url);
    }
    return response.data;
  }

  static Future post(String url, Map<String, dynamic> params) async {
    var response = await _dio.post(url, data: params);
    return response.data;
  }

  static Future<Response> _get(
    BuildContext context,
    String url, {
    Map params,
    bool isShowLoading = true,
    String method,
  }) async {
    // if (isShowLoading) Loading.showLoading(context);
    try {
      if (method == 'get') {
        return await _dio.get(url, queryParameters: params);
      } else if (method == 'post') {
        return await _dio.post(url, queryParameters: params);
      }
    } on DioError catch (e) {
      if (e == null) {
        return Future.error(Response(data: -1));
      } else if (e.response != null) {
        if (e.response.statusCode >= 300 && e.response.statusCode < 400) {
          // _reLogin();  重新登录
          return Future.error(Response(data: -1));
        } else {
          return Future.value(e.response);
        }
      } else {
        return Future.error(Response(data: -1));
      }
    } finally {
      // Loading.hideLoading(context);
    }
  }

  static Future<MovieData> getMovie(BuildContext context,
      {Map params = const {
        'start': 0,
      }}) async {
    var response;
    if (params == null) {
      response = await _get(context, '/movie/get', method: 'get');
    } else {
      response =
          await _get(context, '/movie/get', params: params, method: 'get');
    }
    // print(response.data);
    return MovieData.fromJson(response.data['data']);
  }
}
