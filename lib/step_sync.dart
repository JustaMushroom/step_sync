import 'package:vector_math/vector_math.dart'; 
import 'package:sensors_plus/sensors_plus.dart'; 


class StepCounter{

  int steps = 0;
  /*The threshold value is used to control the sensitivity of step detection or event detection in sensor data processing.
   By setting an appropriate threshold, you can avoid detecting false positives (e.g., small jitters or noise) as steps and ensure
   that only significant changes in acceleration are counted as steps. */
  double threshold = 10.00; 

  StepCounter(){
    updateSteps(); 
  }

  void updateSteps() {
   accelerometerEvents.listen((AccelerometerEvent event) {

    
      double  x = event.x; 
      double  y = event.y; 
      double  z = event.z; 
      final acceleration =  Vector3(x,y,z);
      /*Getting magnitude value which is The magnitude of acceleration is like the "size" or "intensity" of the acceleration
       in three-dimensional space, considering the acceleration along the x, y, and z coordinates (axes). */
      //Not too good at maths or these stuff so well i am not as well so just had a look to google to understand basics 
      //And aim of us just code to get StepCount and also reset daily by method.
      final magnitude = acceleration.length; 
      if(magnitude > threshold){
        steps++; 
      }

   },);
  }

  void resetSteps(){
    steps=0;
  }
}