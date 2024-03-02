// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/myApp.dart';

void main(){
  setPathUrlStrategy();
  runApp(const MyApp());
}