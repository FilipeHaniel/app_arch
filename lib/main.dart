import 'package:app_arch/app/app_arch_injection.dart';
import 'package:app_arch/app/app_arch_module.dart';
import 'package:flutter/material.dart';

void main() async {
  await AppArchInjection().startApp();
  
  runApp(const AppArchModule());
}
