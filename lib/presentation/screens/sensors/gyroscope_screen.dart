import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/widgets.dart';
import '../../providers/providers.dart';

class GyroscopeScreen extends ConsumerWidget {
  const GyroscopeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final gyroscope$ = ref.watch(gyroscopeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Giroscópio'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: gyroscope$.when(
            data: (value) => Text(
              value.toString(),
              style: const TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
            error: (error, stackTrace) => const SensorError(),
            loading: () => const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
