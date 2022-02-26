library draggable_floating_action_button;

import 'package:flutter/material.dart';

class DraggableFloatingActionButton extends StatefulWidget {
  /// the underlying widgets that will be animated
  final List<Widget> children;

  /// the initial offset of the button
  final Offset initialOffset;

  /// the onPressed function
  final Function onPressed;

  /// the delay between the movement of the underlying widgets
  final int motionDelay;

  // ignore: use_key_in_widget_constructors
  const DraggableFloatingActionButton({
    Key? key,
    this.initialOffset = const Offset(340, 610),
    this.motionDelay = 200,
    required this.children,
    required this.onPressed,
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

  /// set the initial offset of the button
  @override
  void initState() {
    /// Set initial offset
    super.initState();
    _offset = widget.initialOffset;
    WidgetsBinding.instance?.addPostFrameCallback(_setBoundary);
  }

  /// set the boundaries of dragging the button
  void _setBoundary(_) {
    try {
      setState(() {
        _minOffset = const Offset(0, 0);
        _maxOffset = Offset(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height);
      });
    } catch (e) {}
  }

  /// Update the button position
  void _updatePosition(
    PointerEvent pointerMoveEvent,
  ) {
    var newOffsetX = _offset.dx + pointerMoveEvent.delta.dx;
    var newOffsetY = _offset.dy + pointerMoveEvent.delta.dy;

    /// ensure position within the limits
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

    /// update position
    setState(() {
      _offset = Offset(newOffsetX, newOffsetY);
    });
  }

  List<Widget> getAnimatedPositionedWidgets() {
    final children = <Widget>[];
    final len = widget.children.length;

    /// to keep the widgets order
    for (var i = len - 1; i >= 0; i--) {
      children.add(
        AnimatedPositioned(
          curve: Curves.fastLinearToSlowEaseIn,
          left: _offset.dx,
          top: _offset.dy,
          duration: Duration(
              milliseconds:
                  i * widget.motionDelay + i * widget.motionDelay * 2),
          child: Listener(
            onPointerMove: (PointerEvent details) {
              _updatePosition(details);
              setState(() {
                _isDragging = true;
              });
            },
            onPointerUp: (PointerEvent details) {
              if (_isDragging) {
                setState(() {
                  /// return to the origin
                  _isDragging = false;
                  _offset = widget.initialOffset;
                });
              } else if (i == 0) {
                /// the button was clicked not dragged
                /// add the onPressed function to the top widget only
                widget.onPressed();
              }
            },
            child: Container(
              /// the key is the widget order
              key: ValueKey(i),
              child: widget.children[i],
            ),
          ),
        ),
      );
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: getAnimatedPositionedWidgets());
  }
}
