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

[Exemplo: em construção...](./)


Minhas Abreviações serão

Providers | Abreviação
---|---
Provider | abcProvider
FutureProvider | abcFutProvider
StreamProvider | abcStmProvider
NotifierProvider | abcNotProvider
AsyncNotifierProvider | abcAsyNotProvider
StreamNotifierProvider | abcStmNotProvider
---|---
StateProvider|abcSttProvider
StateNotifierProvider|abcSttNotProvider
ChangeNotifierProvider|abcChgNotProvider