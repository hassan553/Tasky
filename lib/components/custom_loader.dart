import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const CircularProgressIndicator(),
    );
  }
}

startLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    useSafeArea: true,
    builder: (context) => const CustomLoader(),
  );
}

stopLoading(BuildContext context) {
  Navigator.canPop(context);
}
