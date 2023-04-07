import 'package:app/screens/course.dart';
import 'package:app/screens/homepage.dart';
import 'package:app/screens/profile.dart';
import 'package:app/screens/trending.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder>mp={
    '/home':(BuildContext context) =>MyHomePage() ,
    '/couses':(BuildContext context) =>coursePage(),
    '/trending':(BuildContext context) =>trendingPage(),
    '/profile':(BuildContext context) => profilePage(),
  };