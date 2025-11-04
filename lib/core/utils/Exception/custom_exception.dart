class CustomException implements Exception {
  /// A message describing the format error.
  final String message;

  const CustomException([this.message = ""]);
}
