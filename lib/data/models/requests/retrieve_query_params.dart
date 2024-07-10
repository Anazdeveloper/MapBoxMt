class RetrieveQueryParams {
  final String sessionToken;
  final String accessToken;

  RetrieveQueryParams({required this.accessToken, required this.sessionToken});

  Map<String, dynamic> toJson() => {
    "session_token": sessionToken,
    "access_token": accessToken
  };
}