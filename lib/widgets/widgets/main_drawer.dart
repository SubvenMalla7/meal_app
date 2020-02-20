import 'package:flutter/material.dart';
import 'package:mealapp/screen/filters_screen.dart';


class MainDrawer extends StatelessWidget {
  Widget builderListTile(IconData icon, String title, Function tapController) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 25,
            fontWeight: FontWeight.w700),
      ),
      onTap: () => tapController(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking up',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 24,
                color: Theme.of(context).primaryColor
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          builderListTile(
            Icons.restaurant,
            'Meal',
            (){
              Navigator.of(context).pushReplacementNamed('/');
            }
          ),
          builderListTile(
            Icons.settings,
            'Filters',
            (){
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            }
          ),
        ],
      ),
    );
  }
}
