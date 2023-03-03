class LoginModelResponse {
  String? token;
  String? error;

  LoginModelResponse({
    this.token,
  });

  factory LoginModelResponse.fromJson(Map<String, dynamic> json) {
    return LoginModelResponse(
      token: json['token'],
    );
  }

  LoginModelResponse.withError(String errorMessage) {
    error = errorMessage;
  }
}
