import 'package:rma_lv3_bird_counting_app/data/sharedpref/constants/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class SharedPreferencesHelper {
  Future<void> saveBirdCount(int count) async {
    final _prefs = await SharedPreferences.getInstance();
    await _prefs.setInt(Preferences.count, count);
  }

  Future<void> saveLastBirdColor(String color) async {
    final _prefs = await SharedPreferences.getInstance();
    switch (color) {
      case 'brown':
        await _prefs.setString(Preferences.color, 'brown');
        break;
      case 'grey':
        await _prefs.setString(Preferences.color, 'grey');
        break;
      case 'black':
        await _prefs.setString(Preferences.color, 'black');
        break;
      case 'orange':
        await _prefs.setString(Preferences.color, 'orange');
        break;
      default:
        return;
    }
  }

  Future<Map<String, dynamic>> getStoredBirdData() async {
    final birdCount = await _getStoredBirdCount();
    final lastBirdColor = await _getStoredBirdColor();
    return {
      Preferences.count: birdCount,
      Preferences.color: lastBirdColor,
    };
  }

  Future<int> _getStoredBirdCount() async {
    final _prefs = await SharedPreferences.getInstance();
    final birdCount = _prefs.getInt(Preferences.count) ?? 0;
    return birdCount;
  }

  Future<Color> _getStoredBirdColor() async {
    final _prefs = await SharedPreferences.getInstance();
    final colorString = _prefs.getString(Preferences.color);
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
