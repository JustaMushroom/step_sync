# Step Sync

Step Sync is a Flutter package that uses the accelerometer and mathematical calculations to track the number of steps taken by a user. This package also provides a method to reset the step count. It is easy to use and has a simple API.

## Installation

To use Step Sync in your Flutter project, add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  step_sync: ^1.0.0  # Use the latest version
```

## Usage

Once you have Step Sync installed in your project, you can use it to track and reset the step count. Here's how:

1. Import the Step Sync package in your Dart file:

```dart
import 'package:step_sync/step_sync.dart';
final stepCounter = StepCounter();
final currentSteps = stepCounter.steps; 

//Reset Steps
stepCounter.resetSteps();




```
