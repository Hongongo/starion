import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SensorError extends StatelessWidget {
  const SensorError({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: context.pop,
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
    );
  }
}
