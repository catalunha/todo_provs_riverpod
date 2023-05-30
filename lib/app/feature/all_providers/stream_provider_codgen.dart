import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stream_provider_codgen.g.dart';

// StreamProvider sem codgen
final streamValues1Provider = StreamProvider<Stream<int>>((ref) async* {
  yield Stream.fromIterable([1, 2, 3]);
});
// function StreamProvider com codgen
@riverpod
Stream<int> streamValues2(StreamValues2Ref ref) {
  return Stream.fromIterable([1, 2, 3]);
}
// class StreamProvider com codgen

@riverpod
class StreamValues3 extends _$StreamValues3 {
  @override
  Stream<int> build() {
    return Stream.fromIterable([1, 2, 3]);
  }
}
