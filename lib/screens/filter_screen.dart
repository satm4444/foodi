import 'package:flutter/material.dart';
import 'package:foodi/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const String routeName = "/filter_screen";
  final Function setFilter;
  final Map<String, bool> currentFilters;
  FilterScreen(this.setFilter, this.currentFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      onChanged: updateValue,
      value: currentValue,
    );
  }

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Foodi"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final filterData = {
                "gluten": _glutenFree,
                "lactose": _lactoseFree,
                "vegan": _vegan,
                "vegetarian": _vegetarian,
              };
              widget.setFilter(filterData);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Text("Adjust your filters here !"),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _buildSwitchListTile(
                  "Gluten Free", "Only gluten free meals selected", _glutenFree,
                  (value) {
                setState(() {
                  _glutenFree = value;
                });
              }),
              _buildSwitchListTile("Vegan", "Only Vegan meals selected", _vegan,
                  (value) {
                setState(() {
                  _vegan = value;
                });
              }),
              _buildSwitchListTile(
                  "Vegeterian", "Only vegeterian meals selected", _vegetarian,
                  (value) {
                setState(() {
                  _vegetarian = value;
                });
              }),
              _buildSwitchListTile("Lactose Free",
                  "Only Lactose free meals selected", _lactoseFree, (value) {
                setState(() {
                  _lactoseFree = value;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
