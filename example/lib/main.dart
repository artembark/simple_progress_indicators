import 'package:flutter/material.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

void main() {
  runApp(const SimpleProgressIndicatorsApp());
}

class SimpleProgressIndicatorsApp extends StatefulWidget {
  const SimpleProgressIndicatorsApp({Key? key}) : super(key: key);

  @override
  State<SimpleProgressIndicatorsApp> createState() =>
      _SimpleProgressIndicatorsAppState();
}

class _SimpleProgressIndicatorsAppState
    extends State<SimpleProgressIndicatorsApp> {
  //variable for holding animation state
  bool full = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Simple Progress Indicator Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Text('ProgressBar'),
                  ProgressBar(
                    value: 0.5,
                    gradient: const LinearGradient(
                      colors: [
                        Colors.yellow,
                        Colors.red,
                      ],
                    ),
                    backgroundColor: Colors.grey.withOpacity(0.4),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text('ProgressBarAnimation'),
                  ProgressBarAnimation(
                    duration: const Duration(seconds: 2),
                    gradient: const LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.purple,
                      ],
                    ),
                    backgroundColor: Colors.grey.withOpacity(0.4),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text('AnimatedProgressBar'),
                  AnimatedProgressBar(
                    value: full ? 1.0 : 0.0,
                    duration: const Duration(seconds: 2),
                    gradient: const LinearGradient(
                      colors: [
                        Colors.amber,
                        Colors.red,
                      ],
                    ),
                    backgroundColor: Colors.grey.withOpacity(0.4),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      full = !full;
                      setState(() {});
                    },
                    child: Text(full ? 'To 0%' : 'To 100%'),
                  )
                ],
              ),
              Column(
                children: [
                  const Text('SineBarAnimation'),
                  SineBarAnimation(
                      duration: const Duration(seconds: 2),
                      gradient: const LinearGradient(
                        colors: [
                          Colors.blue,
                          Colors.purple,
                        ],
                      ),
                      //width: 250,
                      height: 40,
                      backgroundColor: Colors.grey.withOpacity(0.4),
                      wavesNumber: 4,
                      sineLineWidth: 5.0,
                      sineOffset: 0.5),
                ],
              ),
              Column(
                children: const [
                  Text('ArcBarAnimation'),
                  ArcBarAnimation(
                    arcLineWidth: 3,
                    duration: Duration(seconds: 2),
                    arcsAmount: 6,
                    height: 60,
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.purple,
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
