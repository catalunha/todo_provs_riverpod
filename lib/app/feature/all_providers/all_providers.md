# Riverpod

O riverpo nos dá alguns provedores. 

# Riverpod e seus Providers

A seguir relaciono alguns deles e apresento o que tenho aprendido sobre eles

## Principais
Os novos principais providers são:

### Provider
Usado geralmente para acessar dependencias em nosso código.

Com riverpod annotation defini-se como uma função.

Não altera estado com: ref.read(x.notifier).functionX();

[Exemplo: provider_codgen.dart](./provider_codgen.dart)

### FutureProvider
Usado geralmente para armazenar dados assincronos de futuros.

Com riverpod annotation defini-se como uma função.

[Exemplo: future_provider_codgen.dart](./future_provider_codgen.dart)


### StreamProvider
Usado geralmente para armazenar dados assincronos de streams.

Com riverpod annotation defini-se como uma função.

[Exemplo: stream_provider_codgen.dart](./stream_provider_codgen.dart)


## NotifierProvider
Usado para gerenciar dados simples e complexos que sejam sincronos.

Com riverpod annotation defini-se como uma classe.

[Exemplo: notifier_provider_codgen.dart](./notifier_provider_codgen.dart)

## AsyncNotifierProvider
Usado para gerenciar dados simples e complexos que sejam assincronos.

Com riverpod annotation defini-se como uma classe.

[Exemplo: async_notifier_provider_codgen.dart](./async_notifier_provider_codgen.dart)

## StreamNotifierProvider
Usado para gerenciar dados simples e complexos que sejam assincronos do tipo streams.

Com riverpod annotation defini-se como uma classe.

[Exemplo: stream_notifier_provider_codgen.dart](./stream_notifier_provider_codgen.dart)


## Legados

Os providers legados são:

### StateProvider

Usado para gerenciar dados simples como int, bool, double, String, enum.

Não é usado com funções complexas.

Com riverpod annotation defini-se como uma função.

[Exemplo: state_provider_codgen.dart](./state_provider_codgen.dart)

### StateNotifierProvider

Usado para gerenciar estados sincrono e assincrono em nosso aplicativo
Com riverpod annotation defini-se como uma função.

[Exemplo: state_notifier_sync_codgen.dart](./state_notifier_sync_codgen.dart)

[Exemplo: state_notifier_async_codgen.dart](./state_notifier_async_codgen.dart)

### ChangeNotifierProvider

Usado para gerenciar estados em nosso aplicativo.
Nao tem riverpod_annotation

[Exemplo: em construção...](./)

---

Minhas Abreviações serão

Providers | Abreviação| annotation
---|---|---
Provider | abcProvider | function
FutureProvider | abcFutProvider | function
StreamProvider | abcStmProvider| function
NotifierProvider | abcNotProvider| class
AsyncNotifierProvider | abcAsyNotProvider| class
StreamNotifierProvider | abcStmNotProvider| class
---|---|---
StateProvider|abcSttProvider| zzz
StateNotifierProvider|abcSttNotProvider| xxx
ChangeNotifierProvider|abcChgNotProvider| yyy

xxx = Prefira (Async)NotifierProvider
yyy = Usado apenas no Go_Router, prefira (Async)NotifierProvider
zzz = use nomenclatura antiga


Function Example:
Usado para Provider, FutureProvider e StreamProvider.
```dart
@riverpod
String simpleValue(SimpleValue2Ref ref) {
  ref.read(anotherProvider);
  return 'StringTest';
}
```

Class Example:
Usado para NotifierProvider, AsyncNotifierProvider, StreamNotifierProvider
```dart
@riverpod
class Counter extends _$Counter {
  @override
  int build() {
    ref.read(anotherProvider);
    return 0;
  }

  void increment() {
    ref.read(anotherProvider);
    state++;
  }
}
```
Os legados StateProvider, StateNotifierProvider e ChangeNotifierProvider devem ser substituidos por alguns dos anteriores
Old Sintaxe:

Example StateProvider:
```dart
final counterSttProvider = StateProvider<int>((ref) => 0);
```

Example StateNotifierProvider:
```dart
class CounterSttNot extends StateNotifier<int> {
  CounterSttNot() : super(0);
  void increment() {
    state++;
  }
}

final counterSttNotProvider =
    StateNotifierProvider<CounterSttNot, int>((ref) => CounterSttNot());
```

Example ChangeNotifierProvider:
```dart
class CounterChNot extends ChangeNotifier {
  CounterChNot();
  int counter = 0;
  void increment() {
    counter++;
    notifyListeners();
  }
}

final counterChNotProvider =
    ChangeNotifierProvider<CounterChNot>((ref) => CounterChNot());
```