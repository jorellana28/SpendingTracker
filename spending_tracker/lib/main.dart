import 'package:flutter/material.dart';

import '../app.dart';
import 'db/db_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBManager.initialize();
  runApp(const MyApp());
}
