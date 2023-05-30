import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stream_provider_codgen.g.dart';

// StreamProvider sem codgen
final streamValues1StmProvider = StreamProvider<Stream<int>>((ref) async* {
  yield Stream.fromIterable([1, 2, 3]);
});
// function StreamProvider com codgen
@riverpod
Stream<int> streamValues2Stm(StreamValues2StmRef ref) {
  return Stream.fromIterable([1, 2, 3]);
}
// class StreamProvider com codgen
