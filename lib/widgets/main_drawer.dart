import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Colors.white,
      ),
      title: Text(title,
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          )),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: new LinearGradient(
              colors: [
                const Color(0xFF000000),
                const Color(0xFF09203f),
              ],
              begin: const FractionalOffset(1.0, 0.0),
              end: const FractionalOffset(0.0, 1.0),
              stops: [0.0, 0.5],
              tileMode: TileMode.clamp),
        ),
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: Text(
                'Cooking Up!',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buildListTile(
              'Meals',
              Icons.restaurant,
              (){
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            buildListTile(
              'Filters',
              Icons.settings,
              (){
                Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
