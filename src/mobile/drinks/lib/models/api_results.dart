import 'dart:convert';

class ApiResult<T> {
  T data;

  ApiResult({
    required this.data
  });

  factory ApiResult.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    return ApiResult(data: fromJsonT(json['data']));
  }
}

class ApiResults<T> {
  Meta meta;
  List<T> data;

  ApiResults({
    required this.meta,
    required this.data
  });

  factory ApiResults.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    return ApiResults(
      meta: Meta.fromJson(json['meta']),
      data: List<T>.from(json['data'].map((item) => fromJsonT(item))),
    );
  }
}

class Meta {
  int total;
  int perPage;
  int currentPage;
  int lastPage;
  int firstPage;
  String firstPageUrl;
  String lastPageUrl;
  String? nextPageUrl;
  String? previousPageUrl;

  Meta({
    required this.total,
    required this.perPage,
    required this.currentPage,
    required this.lastPage,
    required this.firstPage,
    required this.firstPageUrl,
    required this.lastPageUrl,
    this.nextPageUrl,
    this.previousPageUrl,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      total: json['total'],
      perPage: json['perPage'],
      currentPage: json['currentPage'],
      lastPage: json['lastPage'],
      firstPage: json['firstPage'],
      firstPageUrl: json['firstPageUrl'],
      lastPageUrl: json['lastPageUrl'],
      nextPageUrl: json['nextPageUrl'],
      previousPageUrl: json['previousPageUrl'],
    );
  }
}