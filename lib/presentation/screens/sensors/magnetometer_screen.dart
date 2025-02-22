import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/widgets.dart';
import '../../providers/providers.dart';

class MagnetometerScreen extends ConsumerWidget {
  const MagnetometerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final magnetometer$ = ref.watch(magnetometerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Magnetómetro'),
      ),
      body: Center(
        child: magnetometer$.when(
            data: (value) => Text(
                  value.x.toString(),
                  style: const TextStyle(fontSize: 30),
                ),
            error: (error, stackTrace) => const SensorError(),
            loading: () => const CircularProgressIndicator()),
      ),
    );
  }
}
