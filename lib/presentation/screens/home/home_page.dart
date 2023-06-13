import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:vendedor/presentation/screens/visits/widgets/timer_provider.dart';

import '../../../data/themes.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
  const HomePage({super.key});
}

class _HomePageState extends State<HomePage> {
  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');

    return '$minutesStr:$secondsStr';
  }

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);
    final seconds = timerProvider.seconds;
    final formattedTime = _formatTime(seconds);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 20, 10),
            width: 120,
            height: 32,
            child:
                TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
              final seconds = timerProvider.seconds;
              final formattedTime = _formatTime(seconds);
              return Container(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                width: 120,
                height: 32,
                decoration: BoxDecoration(
                  color: kPrimary,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  _formatTime(timerProvider.seconds),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kWhite, fontSize: 24),
                ),
              );
            }),
          ),
        ],
        title: const Text('App Seller'),
      ),
      body: const Center(
        child: Text('Home page'),
      ),
    );
  }
}
