import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_app/app/di/locator.dart';
import 'package:weather_app/app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  runApp(const MyApp());
}
