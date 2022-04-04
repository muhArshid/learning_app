class AuthResponse {
  final String? message;
  final Data? data;

  AuthResponse({
    this.message,
    this.data,
  });

  AuthResponse.fromJson(Map<String, dynamic> json)
      : message = json['message'] as String?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'message': message, 'data': data?.toJson()};
}

class Data {
  final String? tokenType;
  final String? accessToken;

  Data({
    this.tokenType,
    this.accessToken,
  });

  Data.fromJson(Map<String, dynamic> json)
      : tokenType = json['token_type'] as String?,
        accessToken = json['access_token'] as String?;

  Map<String, dynamic> toJson() =>
      {'token_type': tokenType, 'access_token': accessToken};
}
