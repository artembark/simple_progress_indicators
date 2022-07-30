Simple progress indicators package with solid colors and gradients. Can be used to show progress or for simple progress bar animation. 

# How it looks
<div align="center">
    <img src="https://user-images.githubusercontent.com/30658712/181866655-3741cd9e-623a-41f3-acaa-b35e18dd89b5.jpg"</img> 
</div>

# Table of contents
- [Linear Progress indicator](#linear-progress-indicator)
	- [ProgressBar](#progressbar)
	- [ProgressBarAnimation](#progressbaranimation)
	- [AnimatedProgressBar](#animatedprogressbar)
	- [Animation demo](#animation-demo)

# Usage
## Linear Progress indicator
### ProgressBar
`ProgressBar` is a basic linear indicator widget. It's a _Stateless Widget_ that produces basic horizontal rounded rectangle with optional background rounded rectangle underneath.
Include it in your `build` method like:
```
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

It has several configurable parameters:
- `value` - current indicator value, where `0.0` is 0% progress, `1.0` is 100% progress
- `width` - indicator width, defaults to `200.0`
- `height` - indicator height, defaults to `10.0`
- `color` - solid indicator fill color
- `gradient` - gradient fill, accepts [Gradient class](https://api.flutter.dev/flutter/painting/Gradient-class.html)
- `backgroundColor` - solid indicator background color, defaults to transparent

Minimum working widget requires only a `value` and `color` OR `gradient` property. **NOTE:** Specifying both properties is not accepted.

### ProgressBarAnimation
`ProgressBarAnimation` is a simple animating progress bar widget.
It animates `ProgressBar` widget for a given `duration`. 
Animation starts at the time the widget is built.

It has several configurable parameters:
- `duration` - 0% to 100% animation duration 
- `width` - indicator width, defaults to `200.0`
- `height` - indicator height, defaults to `10.0`
- `color` - solid indicator fill color
- `gradient` - gradient fill, accepts [Gradient class](https://api.flutter.dev/flutter/painting/Gradient-class.html)
- `backgroundColor` - solid indicator background color, defaults to transparent
- `curve` - animation curve, defaults to linear. For other curves check [Curves](https://api.flutter.dev/flutter/animation/Curves-class.html)

```
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
```

### AnimatedProgressBar
`AnimatedProgressBar` is a `ImplicitlyAnimatedWidget`. It behaves like other flutter AnimatedFoo widgets. This animates `value` parameter changes for a given `duration`. Animation starts only when one (initial) value changes to other (final) value. See the example below.

It has several configurable parameters:
- `value` - value widget animates to, need to be changed
- `duration` - initial value to final value animation duration 
- `width` - indicator width, defaults to `200.0`
- `height` - indicator height, defaults to `10.0`
- `color` - solid indicator fill color
- `gradient` - gradient fill, accepts [Gradient class](https://api.flutter.dev/flutter/painting/Gradient-class.html)
- `backgroundColor` - solid indicator background color, defaults to transparent
- `curve` - animation curve, defaults to linear. For other curves check [Curves](https://api.flutter.dev/flutter/animation/Curves-class.html)
- `onEnd` - callback to trigger additional actions (e.g. another animation) at the end of the current animation

```
AnimatedProgressBar(  
  value: full ? 1.0 : 0.0,  
  duration: const Duration(seconds: 3),  
  gradient: const LinearGradient(  
    colors: [  
      Colors.amber,  
      Colors.red,  
    ],  
  ),  
  backgroundColor: Colors.grey.withOpacity(0.4),  
),
```

For full demo check `examples` folder.

## Animation demo
<div align="left">
    <img src="https://user-images.githubusercontent.com/30658712/181866672-79f96781-2fd1-4cea-bcd2-b9524033673c.gif" width="400px"</img> 
</div>

## Additional information

For issues and animation ideas visit issues section on github homepage.
