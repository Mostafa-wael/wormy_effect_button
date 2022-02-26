library draggable_floating_action_button;

import 'package:flutter/material.dart';

/// draggable floating action button
class DraggableFloatingActionButton extends StatefulWidget {
  final List<Widget> children; // the widget that will be animated
  final Offset initialOffset;
  final Function onPressed;
  final int delayBias;

  // ignore: use_key_in_widget_constructors
  const DraggableFloatingActionButton({
    Key? key,
    required this.children,
    this.initialOffset = const Offset(340, 610),
    required this.onPressed,
    required this.delayBias,
  });

  @override
  State<StatefulWidget> createState() => _DraggableFloatingActionButtonState();
}

class _DraggableFloatingActionButtonState
    extends State<DraggableFloatingActionButton> {
  bool _isDragging = false;
  late Offset _offset;
  late Offset _minOffset;
  late Offset _maxOffset;

  @override
  void initState() {
    // Set initial offset
    super.initState();
    _offset = widget.initialOffset;
    WidgetsBinding.instance?.addPostFrameCallback(_setBoundary);
  }

  void _setBoundary(_) {
    try {
      setState(() {
        _minOffset = const Offset(0, 0);
        _maxOffset = Offset(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height);
      });
    } catch (e) {
      print('catch: $e');
    }
  }

  void _updatePosition(
    PointerEvent pointerMoveEvent,
  ) {
    var newOffsetX = _offset.dx + pointerMoveEvent.delta.dx;
    var newOffsetY = _offset.dy + pointerMoveEvent.delta.dy;

    // ensure posistion within limits
    if (newOffsetX < _minOffset.dx) {
      newOffsetX = _minOffset.dx;
    } else if (newOffsetX > _maxOffset.dx) {
      newOffsetX = _maxOffset.dx;
    }
    if (newOffsetY < _minOffset.dy) {
      newOffsetY = _minOffset.dy;
    } else if (newOffsetY > _maxOffset.dy) {
      newOffsetY = _maxOffset.dy;
    }
    // update position
    setState(() {
      _offset = Offset(newOffsetX, newOffsetY);
    });
  }

  List<Widget> getPositions() {
    final children = <Widget>[];
    final len = widget.children.length;
    for (var i = 0; i < len; i++) {
      children.add(
        AnimatedPositioned(
          curve: Curves.fastLinearToSlowEaseIn,
          left: _offset.dx,
          top: _offset.dy,
          duration: Duration(
              milliseconds: i * widget.delayBias + i * widget.delayBias * 2),
          child: Listener(
            onPointerMove: (PointerEvent details) {
              _updatePosition(details);
              setState(() {
                _isDragging = true;
              });
            },
            onPointerUp: (PointerEvent details) {
              print('onPointerUp');
              if (_isDragging) {
                setState(() {
                  _isDragging = false;
                  _offset = widget.initialOffset; // return to the origin
                });
              } else {
                // the button was clicked not dragged
                widget.onPressed();
              }
            },
            child: Container(
              key: ValueKey(i),
              child: widget.children[i],
            ),
          ),
        ),
      );
    }
    return List.from(children.reversed); // to keep the order order
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: getPositions());
  }
}
