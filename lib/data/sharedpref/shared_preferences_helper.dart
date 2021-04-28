import 'package:rma_lv3_bird_counting_app/data/sharedpref/constants/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class SharedPreferencesHelper {
  Future<void> saveBirdCount(int count) async {
    final _prefs = await SharedPreferences.getInstance();
    await _prefs.setInt('count', count);
  }

  Future<void> saveLastBirdColor(String color) async {
    final _prefs = await SharedPreferences.getInstance();
    switch (color) {
      case 'Brown':
        _prefs.setString('color', 'brown');
        break;
      case 'Grey':
        _prefs.setString('color', 'grey');
        break;
      case 'Black':
        _prefs.setString('color', 'black');
        break;
      case 'Orange':
        _prefs.setString('color', 'orange');
        break;
      default:
        _prefs.remove('color');
        break;
    }
  }

  Future<Map<String, dynamic>> getStoredBirdData() async {
    final birdCount = await _getStoredBirdCount();
    final lastBirdColor = await _getStoredBirdColor();
    return {
      'count': birdCount,
      'color': lastBirdColor,
    };
  }

  Future<int> _getStoredBirdCount() async {
    final _prefs = await SharedPreferences.getInstance();
    final birdCount = _prefs.getInt(Preferences.birdCount) ?? 0;
    return birdCount;
  }

  Future<Color> _getStoredBirdColor() async {
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

  Future<void> deleteAllData() async {
    final _prefs = await SharedPreferences.getInstance();
    _prefs.clear();
  }
}
