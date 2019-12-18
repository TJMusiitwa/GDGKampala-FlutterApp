import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

class GDGKla {
  // App Data
  static const String app_name = "GDG Kampala";
  static const String app_version = "Version 0.0.1";
  static const String app_color = "#ffd7167";
  static Color primaryAppColor = Colors.white;
  static Color secondaryAppColor = Colors.black;

  //* Images
  static const String banner_light = "assets/images/banner_light.png";
  static const String banner_dark = "assets/images/banner_dark.png";
  static const String logo = "assets/images/logo-lockup-gdg-horizontal_720.png";
  static const String logo2 = "assets/images/GDG-Logo.png";
  static const String chapter_logo = "assets/images/GDGKampala.png";
  static const String cloud_logo = "assets/images/GDGCloud.png";

  // Services
  static final Crashlytics crashlytics = Crashlytics();
  static final Firestore firestore = Firestore.instance;
}
