import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'stream_notifier_provider_codgen.g.dart';

@riverpod
class StreamValues3StmNot extends _$StreamValues3StmNot {
  @override
  Stream<int> build() {
    return Stream.fromIterable([1, 2, 3]);
  }

  Future<void> newValues() async {
    return;
  }
}
