import 'package:rma_lv3_bird_counting_app/data/sharedpref/constants/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class SharedPreferencesHelper {
  Future<int> getStoredBirdCount() async {
    final _prefs = await SharedPreferences.getInstance();
    final birdCount = _prefs.getInt(Preferences.birdCount);
    return birdCount;
  }

  Future<MaterialColor> getStoredBirdColor() async {
    final _prefs = await SharedPreferences.getInstance();
    final colorString = _prefs.getString(Preferences.lastColor);
    switch (colorString) {
      case 'brown':
        return Colors.brown;
        break;
      case 'grey':
        return Colors.grey;
        break;
      case 'black':
        return Colors.black;
        break;
      case 'orange':
        return Colors.orange;
        break;
      default:
        return Colors.blue;
        break;
    }
  }
}
