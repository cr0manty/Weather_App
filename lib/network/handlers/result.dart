class Result<T> {
  final T data;
  final bool isSuccess;
  final String error;

  Result({this.data, this.isSuccess, this.error});
}
