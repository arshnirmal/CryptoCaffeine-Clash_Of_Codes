import 'dart:async';
import 'dart:convert' show jsonDecode;
import 'package:flutter/services.dart' show rootBundle;

import 'package:defi/models/datum.dart';

Future<List<Datum>> loadData() async {
  final String fileContent = await rootBundle.loadString('assets/data.json');
  final List<dynamic> data = jsonDecode(fileContent);
  return data.map((json) => Datum.fromJson(json)).toList();
}
