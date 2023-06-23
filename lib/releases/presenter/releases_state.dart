part of 'releases_cubit.dart';

enum ReleasesStatus {
  initial,
  loading,
  success,
  failure;
}

enum MessageStatus { good, warning, bad }

class Message {
  final String text;
  final MessageStatus status;

  const Message(this.text, this.status);
}

@freezed
class ReleasesState with _$ReleasesState {
  @Assert('(status == ReleasesStatus.failure)? (message != null) : true',
      'Error state without Failure object')
  const factory ReleasesState({
    @Default(ReleasesStatus.initial) ReleasesStatus status,
    @Default([]) List<ReleasedRepository> repos,
    Message? message,
  }) = _ReleasesState;
}
