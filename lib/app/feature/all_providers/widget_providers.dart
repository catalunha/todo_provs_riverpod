import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_provs_riverpod/app/feature/all_providers/stream_notifier_provider_codgen.dart';

import 'async_notifier_provider_codgen.dart';
import 'future_provider_codgen.dart';
import 'notifier_provider_codgen.dart';
import 'provider_codgen.dart';
import 'state_notifier_async_codgen.dart';
import 'state_notifier_sync_codgen.dart';
import 'state_provider_codgen.dart';
import 'stream_provider_codgen.dart';

class WidgetProviders extends ConsumerWidget {
  const WidgetProviders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(simpleValue1Provider);
    ref.watch(simpleValue2Provider);
    ref.watch(restClient1Provider);
    ref.watch(testRepository1Provider);
    ref.watch(testRepository2Provider);
    ref.read(testRepository3FutProv('id0'));
    ref.read(testeRepository4FutProvider(id: 'id1'));
    ref.watch(testeRepository5FutProvider);
    ref.watch(testeRepository6FutProvider);
    ref.watch(streamValues1StmProvider);
    ref.watch(streamValues2StmProvider);
    ref.watch(counterNotProvider);
    ref.watch(counter2NotProvider);
    ref.watch(counter3NotProvider);
    ref.watch(counter4NotProvider);
    ref.watch(counter5NotProvider);
    ref.watch(counter6NotProvider);
    ref.watch(numbers3AsyNotProvider);
    ref.watch(numbers4AsyNotProvider);
    ref.watch(streamValues3StmNotProvider);
    ref.watch(numbersAsyNotProvider);
    ref.watch(numbers2AsyNotProvider);
    ref.watch(counterSttProvider);
    ref.watch(counterSttNotProvider);
    ref.watch(numbersAsySttNotProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usando os providers'),
      ),
      body: Center(
          child: TextButton(
        child: const Text('Change State of Provider'),
        onPressed: () async {
          // ref.read(simpleValue1Provider.notifier); //Error
          // ref.read(simpleValue2Provider.notifier); //Error
          // ref.read(restClient1Provider.notifier); //Error
          // ref.read(testRepository1Provider.notifier); //Error
          // ref.read(testRepository2Provider.notifier); //Error
          // ref.read(streamValues1StmProvider.notifier); //Error
          // ref.read(streamValues2StmProvider.notifier); //Error
          // ref.read(testeRepository5FutProvider.notifier); //Error
          // ref.read(testeRepository6FutProvider.notifier); //Error
          ref.read(streamValues3StmNotProvider.notifier).newValues();
          ref.read(counterNotProvider.notifier).increment();
          ref.read(counter2NotProvider.notifier).increment();
          ref.read(counter3NotProvider.notifier).increment();
          ref.read(counter4NotProvider.notifier).increment();
          ref.read(counter5NotProvider.notifier).increment();
          ref.read(counter6NotProvider.notifier).increment();
          await ref.read(numbers3AsyNotProvider.notifier).newNumbers();
          await ref.read(numbers4AsyNotProvider.notifier).newNumbers();
          await ref.read(streamValues3StmNotProvider.notifier).newValues();
          ref.read(counterSttProvider.notifier).state++;
          ref.read(counterSttNotProvider.notifier).increment();
          ref.read(numbersAsySttNotProvider.notifier).newNumbers();
          ref.read(numbersAsyNotProvider.notifier).newNumbers();
          ref.read(numbers2AsyNotProvider.notifier).newNumbers();
        },
      )),
    );
  }
}
