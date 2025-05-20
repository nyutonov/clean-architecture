class ResponseData<T> {
  final T? data;
  final dynamic response;
  final String? error;
  final bool ok;
  final int statusCode;

  ResponseData({
    this.data,
    this.response,
    this.error,
    this.ok = false,
    this.statusCode = 500,
  });
}

class Pagination {
  int currentPage;
  int totalPage;
  int pageSize;

  Pagination({
    this.currentPage = 1,
    this.pageSize = 10,
    this.totalPage = 1,
  });

  factory Pagination.fromJson(dynamic json) {
    return Pagination(
      currentPage: json["page"] ?? 1,
      pageSize: json["page_size"] ?? 10,
      totalPage: json["page_sum"] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "page": currentPage,
      "page_size": pageSize,
      "page_sum": totalPage,
    };
  }
}

enum RequestStatus {
  loading,
  success,
  failed,
}
