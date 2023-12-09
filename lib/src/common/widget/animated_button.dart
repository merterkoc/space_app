import 'package:flutter/material.dart';

class ClickableShrinkWidget extends StatefulWidget {
  final Widget child;
  final Function() onTap;

  const ClickableShrinkWidget({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  ClickableShrinkWidgetState createState() => ClickableShrinkWidgetState();
}

class ClickableShrinkWidgetState extends State<ClickableShrinkWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      reverseDuration: const Duration(milliseconds: 100),
    );
    _animation = Tween<double>(begin: 1.0, end: 0.95).animate(_controller);

    _animation.addListener(() {
      setState(() {});
    });

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed && !_isPressed) {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: widget.onTap,
      child: Transform.scale(
        scale: _animation.value,
        child: widget.child,
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    _isPressed = true;
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _isPressed = false;
    _controller.reverse();
  }

  void _onTapCancel() {
    _isPressed = false;
    _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
