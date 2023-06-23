abstract class RequestFailure {
  const RequestFailure(this.message);

  final String? message;
  String get standardMessage;

  factory RequestFailure.something(String? message) =>
      RequestFailureSomething(message);

  factory RequestFailure.server(String? message) =>
      RequestServerFailure(message);

  factory RequestFailure.network(String? message) =>
      RequestFailureNetwork(message);
}

class RequestFailureSomething extends RequestFailure {
  const RequestFailureSomething(super.message);

  @override
  String get standardMessage => 'Unknown error';
}

class RequestServerFailure extends RequestFailure {
  const RequestServerFailure(super.message);

  @override
  String get standardMessage => 'Server error';
}

class RequestFailureNetwork extends RequestFailure {
  const RequestFailureNetwork(super.message);

  @override
  String get standardMessage => 'Network error';
}
