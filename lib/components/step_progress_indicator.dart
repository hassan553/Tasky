import 'package:flutter/material.dart';

class StepProgressIndicator extends StatefulWidget {
  final int currentStep;
  final int totalSteps;
  final Function(int) onStepTapped;

  const StepProgressIndicator({
    required this.currentStep,
    required this.totalSteps,
    required this.onStepTapped,
    Key? key,
  }) : super(key: key);

  @override
  _StepProgressIndicatorState createState() => _StepProgressIndicatorState();
}

class _StepProgressIndicatorState extends State<StepProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(widget.totalSteps, (index) {
        return GestureDetector(
          onTap: () => widget.onStepTapped(index + 1),
          child: StepCircle(
            isActive: widget.currentStep == index + 1,
            stepNumber: index + 1,
          ),
        );
      }),
    );
  }
}

class StepCircle extends StatelessWidget {
  final bool isActive;
  final int stepNumber;

  const StepCircle({
    required this.isActive,
    required this.stepNumber,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: isActive ? Colors.blue : Colors.grey[300],
      child: Text(
        '$stepNumber',
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

// class StepProgressScreen extends StatefulWidget {
//   @override
//   _StepProgressScreenState createState() => _StepProgressScreenState();
// }

// class _StepProgressScreenState extends State<StepProgressScreen> {
//   int _currentStep = 1;
//   final int _totalSteps = 4;

//   void _onStepTapped(int step) {
//     setState(() {
//       _currentStep = step;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Step Progress Indicator'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           StepProgressIndicator(
//             currentStep: _currentStep,
//             totalSteps: _totalSteps,
//             onStepTapped: _onStepTapped,
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               if (_currentStep < _totalSteps) {
//                 setState(() {
//                   _currentStep++;
//                 });
//               }
//             },
//             child: Text('Next'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               if (_currentStep > 1) {
//                 setState(() {
//                   _currentStep--;
//                 });
//               }
//             },
//             child: Text('Previous'),
//           ),
//         ],
//       ),
//     );
//   }
// }
