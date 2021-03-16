import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

///runs the entire program. Basically a main function

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    ///builds a blank app with an internal title and an amber background
    return MaterialApp(
      title: _title,
      theme: new ThemeData(scaffoldBackgroundColor: Colors.white),
      home: MyStatefulWidget(),

      ///this is what links it to a non static app
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();

  ///this class calls the state to be built and returned
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  ///index int
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  ///text styling
  ///this is a list of widgets to be selected. The widgets are separated by commas
  List<Widget> _widgetOptions = <Widget>[
    Column(
      ///widget 1
      mainAxisAlignment: MainAxisAlignment.center,

      ///sets all column children to the center of the typical y axis
      children: <Widget>[
        ///list of all children cast as widgets to ensure they are
        Container(

            ///blank container used for background colors and spacing
            color: Colors.green,
            alignment: Alignment.center,
            height: 200.0,
            width: 400.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'SRF Running',
                  style: optionStyle,
                ),
                Container(
                  ///blank container for spacing
                  height: 18.0,
                ),
                Text(
                  '250 MW',
                  style: optionStyle,
                ),
              ],
            )),
        Container(
          ///this container is used for padding. It could just be text without a padding need
          padding: new EdgeInsets.all(10.0),
          child: Text(
            'This is where the small description of the daily experiment could go. Or it could go in the stream description which would be a lot easier.',
            textAlign: TextAlign.center,

            ///this makes the text center in the x and y axis in the container
          ),
        ),
      ],
    ),
    Center(
      ///widget 2
      child: Text(
        'Chart goes here with charts_flutter or fl_charts',
        style: optionStyle,
      ),
    ),
    Text(
      ///widget 3
      'Youtube Stream here with youtube_player_flutter',
      style: optionStyle,
    ),
  ];

  ///this is the on tap function used to change the selected widget
  void _onItemTapped(int index) {
    setState(() {
      ///this set state is what calls the build function of the widget state class
      _selectedIndex = index;

      ///this is the information in the state that changed
    });
  }

  ///this is what builds the state and goes over the stateless widget in the background
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///a scaffold is usually the root widget. it is just a blank container
      appBar: AppBar(
        ///the bar at the top is the app bar. it can contain buttons and icons
        title: const Text('Solar Research Facility'),
        backgroundColor: Colors.amber,
      ),

      ///the body of a scaffold is the child widget that makes up the middle part of the screen
      body: Center(
        ///a center container just centers the child widget
        child: _widgetOptions.elementAt(_selectedIndex),

        ///this is the widget in the list chosen by the state
      ),
      bottomNavigationBar: BottomNavigationBar(
        ///this is like the opposite of an app bar but has tools for navigation
        backgroundColor: Colors.brown,
        items: const <BottomNavigationBarItem>[
          ///this is a list of the items which need icons text and/or pictures
          BottomNavigationBarItem(
            icon: Icon(Icons.home),

            ///there is a massive list of icons in the Icons library
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),

            ///these aren't but they have specifically iOS icons too
            label: 'Data Review',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam),
            label: 'Live Feed',
          ),
        ],
        currentIndex: _selectedIndex,

        ///this is the item that is selected. will change with state change
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,

        ///this is the on tap for all of the items in the navigation bar. It calls the state change
        ///and the navigation bar automatically changes the index
      ),
    );
  }
}
