import 'package:flutter/material.dart';
import 'package:rma_lv3_bird_counting_app/locators.dart';
import '../data/sharedpref/shared_preferences_helper.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int count;
  Color color;

  @override
  void initState() {
    super.initState();
    _getSharedPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bird Counter'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: count == null
                    ? Center(
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white)),
                      )
                    : Center(
                        child: Text(
                          count.toString(),
                          style: TextStyle(fontSize: 60, color: Colors.white),
                        ),
                      ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildIncrementButton('Brown', Colors.brown),
              _buildIncrementButton('Grey', Colors.grey),
              _buildIncrementButton('Black', Colors.black),
              _buildIncrementButton('Orange', Colors.orange),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Reset'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIncrementButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {
        _onIncrementButtonTap(text);
      },
      child: Text(text),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
      ),
    );
  }

  _onIncrementButtonTap(String color) {
    switch (color) {
      case 'Brown':
        setState(() {
          this.color = Colors.brown;
          count++;
        });
        break;
      case 'Grey':
        setState(() {
          this.color = Colors.grey;
          count++;
        });
        break;
      case 'Black':
        setState(() {
          this.color = Colors.black;
          count++;
        });
        break;
      case 'Orange':
        setState(() {
          this.color = Colors.orange;
          count++;
        });
        break;
      default:
        setState(() {
          this.color = Colors.blue;
        });
    }
  }

  Future<Null> _getSharedPrefs() async {
    final data = await locator<SharedPreferencesHelper>().getStoredBirdData();
    setState(() {
      count = data['count'];
      color = data['color'];
    });
  }
}
