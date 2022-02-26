## Platform Support

| Android | iOS | MacOS | Web | Linux | Windows |
| :-----: | :-: | :---: | :-: | :---: | :-----: |
|   ✔️    | ✔️  |  ✔️   | ✔️  |  ✔️   |   ✔️    |

## Features

This Package helps you to create draggable widgets with worm effect

## Getting started

You should ensure that you add the dependency in your flutter project.
```yaml
dependencies:
  draggable_floating_action_button: "^0.0.1"
```
## Usage

```dart
import 'package:draggable_floating_action_button/draggable_floating_action_button.dart';
DraggableFloatingActionButton(
        onPressed: _incrementCounter,
        initialOffset: const Offset(340, 610),
        holdPosition: false,
        curve: Curves.fastLinearToSlowEaseIn,
        motionDelay: 400,
        children: [
          Container(
            width: 50,
            height: 50,
            child: const Icon(Icons.camera),
            decoration:
                const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          ),
          Container(
            width: 50,
            height: 50,
            child: const Icon(Icons.camera),
            decoration:
                const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
          ),
        ],
      ),
    );
```

## Additional information

More information about how to contribute will be availabe soon!
