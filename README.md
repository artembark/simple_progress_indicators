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

Add to pubspec.yaml and import to your code.

## Usage
Linear progress bar has two implementation: one with external value control and one with 
duration and curve parameter. 

The minimum working sample:   
```dart
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: ProgressBar(
            value: 0.5,
            //specify only one: color or gradient
            //color:Colors.red,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.yellowAccent, Colors.deepOrange],
            ),
          ),
        ),
      ),
    );
  }
```
Specifying all parameters:   
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
Animated version minimum working sample:
```dart
  @override
Widget build(BuildContext context) {
  return const MaterialApp(
    home: Scaffold(
      body: Center(
        child: AnimatedProgressBar(
          duration: Duration(seconds: 2),
          //specify only one: color or gradient
          //color:Colors.red,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.yellowAccent, Colors.deepOrange],
          ),
        ),
      ),
    ),
  );
}
```
Animated version with all parameters:   
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

For issues visit issues section on github.
