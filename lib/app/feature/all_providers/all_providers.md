# Riverpod

O riverpo nos dá alguns provedores. 

# Riverpod e seus Providers

A seguir relaciono alguns deles e apresento o que tenho aprendido sobre eles

## Principais
Os novos principais providers são:

### Provider
Usado geralmente para acessar dependencias em nosso código.
[Exemplo: provider_codgen.dart](./provider_codgen.dart)

### FutureProvider
Usado geralmente para armazenar dados assincronos de futuros
[Exemplo: future_provider_codgen.dart](./future_provider_codgen.dart)

### StreamProvider
Usado geralmente para armazenar dados assincronos de streams
[Exemplo: stream_provider_codgen.dart](./stream_provider_codgen.dart)

## NotifierProvider
Usado para gerenciar dados simples e complexos que sejam sincronos.
[Exemplo: notifier_provider_codgen.dart](./notifier_provider_codgen.dart)

## AsyncNotifierProvider
Usado para gerenciar dados simples e complexos que sejam assincronos.
[Exemplo: async_notifier_provider_codgen.dart](./async_notifier_provider_codgen.dart)


## Legados
Os providers legados são:

### StateProvider
Usado para gerenciar dados simples como int, bool, double, String, enum.
Não é usado com funções complexas.
[Exemplo: state_provider_codgen.dart](./state_provider_codgen.dart)

### StateNotifierProvider
Usado para gerenciar estados sincrono e assincrono em nosso aplicativo
[Exemplo: state_notifier_sync_codgen.dart](./state_notifier_sync_codgen.dart)
[Exemplo: state_notifier_async_codgen.dart](./state_notifier_async_codgen.dart)

### ChangeNotifierProvider
Usado para gerenciar estados em nosso aplicativo
[Exemplo: em construção...](./)


