import 'package:flutter/material.dart';

class SharedKeys {
  static const String countryCode = "countryCode";
  static const String isDoctor = "isDoctor";
  static const String doctorDetails = "doctor_details";
}

double width(context) =>
    MediaQuery.sizeOf(context).width; //MediaQuery(data: data, child: child)
double height(context) =>
    MediaQuery.sizeOf(context).height; //MediaQuery(data: data, child: child)
