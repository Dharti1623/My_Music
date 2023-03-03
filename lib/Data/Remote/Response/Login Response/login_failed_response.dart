class LoginModelFailedResponse {
  String? error;

  LoginModelFailedResponse({ this.error,});

  LoginModelFailedResponse.empty();

  factory LoginModelFailedResponse.fromJson(Map<String, dynamic> json) {
    return LoginModelFailedResponse(
      error: json['error'],
    );
  }

  LoginModelFailedResponse.withError(String errorMessage) {
    error = errorMessage;
  }
}