import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const routName = '/settings';

  static const gluten = 'gluten';
  static const lactose = 'lactose';
  static const vegetarian = 'vagetarian';
  static const vegan = 'vegan';

  final Function setFilters;
  final Map<String, bool> filters;

  SettingsScreen(this.filters, this.setFilters);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isGlutenFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isLactoseFree = false;

  @override
  void initState() {
    super.initState();
    isGlutenFree = widget.filters[SettingsScreen.gluten];
    isLactoseFree = widget.filters[SettingsScreen.lactose];
    isVegetarian = widget.filters[SettingsScreen.vegetarian];
    isVegan = widget.filters[SettingsScreen.vegan];
  }

  Widget _buildSwich(
      {String title, String subTitle, bool currentVal, Function onChange}) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: currentVal,
      onChanged: onChange,
    );
  }

  bool get isChange{
    if(isGlutenFree == widget.filters[SettingsScreen.gluten]
    && isLactoseFree == widget.filters[SettingsScreen.lactose]
    && isVegetarian == widget.filters[SettingsScreen.vegetarian]
    && isVegan == widget.filters[SettingsScreen.vegan]){
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {

    FloatingActionButton _fab = FloatingActionButton(
        child: isChange ? Icon(Icons.save) : Icon(Icons.arrow_back),
        onPressed: isChange ? () {
          Map<String, bool> filters = {
            SettingsScreen.gluten : isGlutenFree,
            SettingsScreen.lactose : isLactoseFree,
            SettingsScreen.vegetarian : isVegetarian,
            SettingsScreen.vegan : isVegan,
          };
          widget.setFilters(filters);
          Toast.show('SAVED!', context , duration: Toast.LENGTH_LONG , gravity: Toast.BOTTOM);
        } : (){
          Navigator.of(context).pushReplacementNamed('/');
        },
      );

    return Scaffold(
      appBar: AppBar(title: Text('Settings'), centerTitle: true),
      drawer: MainDrawer('/settings'),
      body: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              color: Theme.of(context).primaryColorLight,
              child: Text(
                'filters'.toUpperCase(),
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwich(
                    title: 'Glutten-Free',
                    subTitle: 'show only Glutten-free meals',
                    currentVal: isGlutenFree,
                    onChange: (newVal) {
                      setState(() {
                        isGlutenFree = newVal;
                      });
                    },
                  ),
                  _buildSwich(
                    title: 'Lactose-Free',
                    subTitle: 'show only lactose-free meals',
                    currentVal: isLactoseFree,
                    onChange: (newVal) {
                      setState(() {
                        isLactoseFree = newVal;
                      });
                    },
                  ),
                  _buildSwich(
                    title: 'Vegetarian',
                    subTitle: 'show only vegetarian meals',
                    currentVal: isVegetarian,
                    onChange: (newVal) {
                      setState(() {
                        isVegetarian = newVal;
                      });
                    },
                  ),
                  _buildSwich(
                    title: 'Vegan',
                    subTitle: 'show only vegan meals',
                    currentVal: isVegan,
                    onChange: (newVal) {
                      setState(() {
                        isVegan = newVal;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _fab,
    );
  }
}
