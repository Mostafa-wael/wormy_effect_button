# WormyEffectButton
![logo](logo.png)
[![pub package](https://img.shields.io/pub/v/wormy_effect_button.svg)](https://pub.dev/packages/wormy_effect_button)
[![pub points](https://badges.bar/wormy_effect_button/pub%20points)](https://pub.dev/packages/wormy_effect_button/score)
[![popularity](https://badges.bar/wormy_effect_button/popularity)](https://pub.dev/packages/wormy_effect_button/score)

## Platform Support

| Android | iOS | MacOS | Web | Linux | Windows |
| :-----: | :-: | :---: | :-: | :---: | :-----: |
|   ✔️    | ✔️  |  ✔️   | ✔️  |  ✔️   |   ✔️    |

## Features

This Package helps you to create draggable widgets with wormy effect

## Getting started

You should ensure that you add the dependency in your flutter project.
```yaml
dependencies:
  wormy_effect_button: "^0.0.1"
```
## Usage

```dart
import 'package:wormy_effect_button/wormy_effect_button.dart';
WormyEffectButton(
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
## Example

https://user-images.githubusercontent.com/56788883/155863104-81b4300a-ab42-4a2d-ae8d-72e68ccc8269.mp4


## Additional information

More information about how to contribute will be available soon!
