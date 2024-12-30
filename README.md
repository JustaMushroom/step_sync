# Step Sync

Step Sync is a Flutter package that uses the accelerometer and mathematical calculations to track the number of steps taken by a user. This package also provides a method to reset the step count. It is easy to use and has a simple API.

## Installation

To use Step Sync in your Flutter project, add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  step_sync: ^1.0.0  # Use the latest version
```


Here's what you need to do for both platforms:

Android (AndroidManifest.xml):

    Open the android/app/src/main/AndroidManifest.xml file in your Flutter project.
    To request access to the accelerometer sensor, add the following line within the <manifest> element

  ```xml
    <uses-permission android:name="android.permission.BODY_SENSORS" />

```

Open the ios/Runner/Info.plist file in your Flutter project.

To access the accelerometer, you don't need to specify a permission. However, you should include a description of why you need this data. Add the following key-value pair within the <dict> element:

```xml
<key>NSMotionUsageDescription</key>
<string>The app needs to access the accelerometer to count your steps.</string>
```

## Usage

Once you have Step Sync installed in your project, you can use it to track and reset the step count. Here's how:

1. Import the Step Sync package in your Dart file:

```dart
import 'package:step_sync/step_sync.dart';
```
2.Create Instance of Our Class Called StepCounter

```dart
final stepCounter = StepCounter();
```
3.Access Steps Directly using .steps property
```dart
final currentSteps = stepCounter.steps; 
```

4.```dart
StreamBuilder<int>(
  stream: stepCounter.stepStream,
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator(); // Show loading while waiting for data
    }

    return Text(
      'Steps Taken: ${snapshot.data ?? 0}',
      style: TextStyle(fontSize: 24),
    );
  },
)

```
5. To Reset Steps use resetSteps method provided by StepCounter Class
```dart
stepCounter.resetSteps();
```

6.Example User Interface```dart
import 'package:flutter/material.dart';
import 'package:step_sync/step_sync.dart'; // Import your package

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Step Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StepCounterScreen(),
    );
  }
}

class StepCounterScreen extends StatefulWidget {
  @override
  _StepCounterScreenState createState() => _StepCounterScreenState();
}

class _StepCounterScreenState extends State<StepCounterScreen> {
  // Create an instance of StepCounter
  final StepCounter stepCounter = StepCounter();

  @override
  void initState() {
    super.initState();
    stepCounter.updateSteps();  // Start listening to step updates
  }

  @override
  void dispose() {
    super.dispose();
    // No need to call dispose() on the StepCounter instance
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step Counter'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: stepCounter.stepStream, // Listen to the step count stream
          builder: (context, snapshot) {
            // Handle the stream's data
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Display the current step count
                  Text(
                    'Steps Taken: ${snapshot.data}',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 20),
                  // Button to reset the step count
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        stepCounter.resetSteps();  // Reset step count when the button is pressed
                      });
                    },
                    child: Text('Reset Steps'),
                  ),
                ],
              );
            } else {
              return Text('No data available');
            }
          },
        ),
      ),
    );
  }
}

```
