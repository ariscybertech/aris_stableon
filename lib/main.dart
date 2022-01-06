import 'dart:async';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_datastore/types/DataStoreHubEvents/DataStoreHubEvent.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';

import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';
import 'todos_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _amplifyConfigured = false;

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    try {
      final dataStorePlugin =
          AmplifyDataStore(modelProvider: ModelProvider.instance);
      await Amplify.addPlugin(dataStorePlugin);
      await Amplify.addPlugin(AmplifyAPI());
      await Amplify.addPlugin(AmplifyAuthCognito());
      await Amplify.configure(amplifyconfig);
      print('Amplify configured');
      // await Amplify.DataStore.clear();
      // print('cleared datastore');
      _observeHub();
      setState(() => _amplifyConfigured = true);
    } on AmplifyAlreadyConfiguredException catch (amplifyException) {
      print(amplifyException.message);
      print('Amplify not configured for restart');
    } catch (e) {
      print('error occured: ${e.runtimeType}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MaterialApp(
          home: _amplifyConfigured
              ? TodosView()
              : Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }

  StreamSubscription sub;
  void _observeHub() {
    print('started observing hub');
    sub = Amplify.Hub.listen([HubChannel.DataStore], (hubEvent) {
      final dshubevent = hubEvent as DataStoreHubEvent;
      print('hub event: ${dshubevent.eventName}');
    });
  }
}
