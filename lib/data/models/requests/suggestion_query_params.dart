class SuggestionQueryParams {
  final String query;
  final String sessionToken;
  final String accessToken;

  SuggestionQueryParams({required this.query, required this.sessionToken, required this.accessToken});

  Map<String, dynamic> toJson() => {
    "q": query,
    "session_token": sessionToken,
    "access_token": accessToken
  };
}