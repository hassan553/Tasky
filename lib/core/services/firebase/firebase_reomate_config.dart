import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class FirebaseRemoteConfigWidget extends StatefulWidget {
  const FirebaseRemoteConfigWidget({super.key});

  @override
  State<FirebaseRemoteConfigWidget> createState() =>
      _FirebaseRemoteConfigWidgetState();
}

class _FirebaseRemoteConfigWidgetState
    extends State<FirebaseRemoteConfigWidget> {
  @override
  void initState() {
    _initRemoteConfig();
    super.initState();
  }

  _initRemoteConfig() async {
    final FirebaseRemoteConfig firebaseRemoteConfig =
        FirebaseRemoteConfig.instance;
    await firebaseRemoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(seconds: 10),
      ),
    );
    await firebaseRemoteConfig.setDefaults({'name': 'Flutter'});
    try {
      await firebaseRemoteConfig.fetchAndActivate();
      print(firebaseRemoteConfig.getString('name'));

      firebaseRemoteConfig.onConfigUpdated.listen((event) {
        firebaseRemoteConfig.activate();
        name = firebaseRemoteConfig.getString('name');
        setState(() {});
      });
    } catch (e) {
      print(e);
    }
  }

  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          name,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
