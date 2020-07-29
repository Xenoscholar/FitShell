

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityDropDown extends StatefulWidget {
  @override
  _ActivityDropDownState createState() => _ActivityDropDownState();


}

class ActivityDrop {
  int id;
  String name;

  ActivityDrop(this.id, this.name);

  static List<ActivityDrop> getCompanies() {
    return <ActivityDrop>[
      ActivityDrop(1, 'Basal Metabolic Rate (BMR)'),
      ActivityDrop(2, 'Sedentary: Little or no exercise'),
      ActivityDrop(3, 'Light: Exercise 1-3 times/week'),
      ActivityDrop(4, 'moderate: Exercise 4-5 times/week'),
      ActivityDrop(5, 'Active: Daily Exercise or intense exercise 3-4 times/week'),
      ActivityDrop(6, 'Very Active: Intense exercise 6-7 times/week'),
      ActivityDrop(7, 'Extra Active: Intense Exercise daily'),
    ];
  }
}



class _ActivityDropDownState extends State<ActivityDropDown> {

  onChangeDropdownItem(ActivityDrop selectedCompany) {
    setState(() {
      _selectedActivity = selectedCompany;
    });
  }

  List<ActivityDrop> _companies = ActivityDrop.getCompanies();
  List<DropdownMenuItem<ActivityDrop>> _dropdownMenuItemsCalcs;
  ActivityDrop _selectedActivity;

  String exposedActivity = 'Basal Metabolic Rate (BMR)';


  @override
  void initState() {
    _dropdownMenuItemsCalcs = buildDropdownMenuItems(_companies);
    _selectedActivity = _dropdownMenuItemsCalcs[0].value;

    exposedActivity = _selectedActivity.name;

    super.initState();
  }


  List<DropdownMenuItem<ActivityDrop>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<ActivityDrop>> items = List();
    for (ActivityDrop company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }







  @override
  Widget build(BuildContext context) {

    return DropdownButton(
      value: _selectedActivity,
      iconEnabledColor: Colors.deepPurpleAccent,
      iconSize: 30,
      underline: Text(''),
      items: _dropdownMenuItemsCalcs,
      onChanged: onChangeDropdownItem,
      isExpanded: true,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w300,
      ),
      focusColor: Colors.grey.withOpacity(.5),
    );
  }
}
