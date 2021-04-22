# Animations

### Which tool should I use?

- Drawing Animation?
    - [Flare](https://pub.dev/packages/flare_flutter) 
    - [Lottie](https://pub.dev/packages/lottie)
- Code-based Animation?
    - Implicit Animation
    - Explicit Animation (repeat, discontinuous, multiple objects)

#### Implicit Animation
- Built-in Animated Widgets, 
    - such as AnimatedContainer, AnimatedOpacity, AnimatedPositioned, etc.
    - https://flutter.dev/docs/development/ui/widgets/animation
```dart
final clicked = false;
...
@override
Widget build(BuildContext context) {
return Center(
  child: Column(
    children: [
      AnimatedContainer(
        width: clicked ? 200.0 : 100.0,
        height: clicked ? 100.0 : 200.0,
        color: clicked ? Colors.red : Colors.blue,
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
      ),
      TextButton(
        onPressed: () {
          setState(() {
            clicked = !clicked;
          });
        },
        child: Text('click'),
      ),
    ],
  ),
);
}
```
- TweenAnimationBuilder
```dart
TweenAnimationBuilder<double>(
  tween: Tween<double>(begin: 0, end: targetValue),
  duration: const Duration(seconds: 2),
  builder: (BuildContext context, double size, Widget child) {
    return IconButton(
      iconSize: size,
      color: Colors.blue,
      icon: child,
      onPressed: () {
        setState(() {
          targetValue = targetValue == 50.0 ? 80.0 : 50.0;
        });
      },
    );
  },
  child: const Icon(Icons.mobile_friendly),
)
```

```dart
TweenAnimationBuilder(
  tween: ColorTween(begin: Colors.white, end: Colors.red),
  duration: Duration(seconds: 2),
  builder: (_, Color color, __) {
    return ColorFiltered(
      child: Image.asset('assets/xxx.png'),
      colorFilter: ColorFilter.mode(color, BlendMode.modulate),
    );
  },
)
```
#### Explicit Animation
- Using animation controller
- Built-in Transition Widgets
    - such as PositionedTransition, RotationTransition, SizeTransition, etc.

``` dart
class _ExplicitAnimationState extends State<ExplicitAnimation>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ExplicitAnimation.title),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: _animation,
              child: Center(
                child: Image.asset('assets/earth.png', width: 300),
              ),
            ),
            TextButton(
              onPressed: () {
                _controller.forward(from: 0);
              },
              child: Text(
                'Rotate',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
```

#### Libraries
1. [Hero](https://flutter.dev/docs/development/ui/animations/hero-animations)
2. [Page Transition](https://pub.dev/packages/page_transition)
3. [Animator](https://github.com/sharp3dges/animator)
4. [Simple Animations](https://pub.dev/packages/simple_animations)
5. [Liquid Swipe](https://pub.dev/packages/liquid_swipe)



