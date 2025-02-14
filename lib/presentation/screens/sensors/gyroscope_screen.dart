import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:starion/presentation/widgets/shared/main_menu.dart';

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
              error: (error, stackTrace) => GestureDetector(
                onTap: () => context.pop(),
                child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.nearby_error_outlined,
                          color: Colors.red,
                          size: 80,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Tu dispositivo no cuenta con este sensor',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
              ),
              loading: () => const CircularProgressIndicator()),
        ),
      ),
    );
  }
}
