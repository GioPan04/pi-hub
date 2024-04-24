import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pi_hub/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('it', null);
  runApp(App());
}
