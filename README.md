<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Simple progress indicator.

## Features

Currently has two widgets - ProgressBar and AnimatedProgressBar.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage
Linear progress bar has two implementation: one with external value control and one with
animation controller and duration parameter.

```dart
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: ProgressBar(
            value: 0.5,
            width: 200.0,
            height: 10.0,
            //specify only one: color or gradient
            //color:Colors.red,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.yellowAccent, Colors.deepOrange],
            ),
            backgroundColor: Colors.grey,
          ),
        ),
      ),
    );
  }
```

```dart
  @override
Widget build(BuildContext context) {
  return const MaterialApp(
    home: Scaffold(
      body: Center(
        child: AnimatedProgressBar(
          duration: Duration(seconds: 2),
          width: 200.0,
          height: 10.0,
          //specify only one: color or gradient
          //color:Colors.red,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.yellowAccent, Colors.deepOrange],
          ),
          backgroundColor: Colors.grey,
          curve: Curves.ease,
        ),
      ),
    ),
  );
}
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
