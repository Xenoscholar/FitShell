

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'exposeddropdown.dart';

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
      ActivityDrop(1, 'Sedentary: Little or no exercise'),
      ActivityDrop(2, 'Light: Exercise 1-3 times/week'),
      ActivityDrop(3, 'moderate: Exercise 4-5 times/week'),
      ActivityDrop(4, 'Active: Daily Exercise or intense exercise 3-4 times/week'),
      ActivityDrop(5, 'Very Active: Intense exercise 6-7 times/week'),
      ActivityDrop(6, 'Extra Active: Intense Exercise daily'),
    ];
  }
}



class _ActivityDropDownState extends State<ActivityDropDown> {

  onChangeDropdownItem(ActivityDrop selectedCompany) {
    setState(() {
      _selectedActivity = selectedCompany;

      if(_selectedActivity.name == 'Active: Daily Exercise or intense exercise 3-4 times/week') {
        Exposed.activity = 'Active: Daily Exercise or intense exercise 3-4 times/week';
      } else if (_selectedActivity.name == 'Sedentary: Little or no exercise') {
        Exposed.activity = 'Sedentary: Little or no exercise';
      } else if (_selectedActivity.name == 'Light: Exercise 1-3 times/week') {
        Exposed.activity = 'Light: Exercise 1-3 times/week';
      } else if (_selectedActivity.name == 'moderate: Exercise 4-5 times/week') {
        Exposed.activity = 'moderate: Exercise 4-5 times/week';
      } else if (_selectedActivity.name == 'Very Active: Intense exercise 6-7 times/week') {
        Exposed.activity = 'Very Active: Intense exercise 6-7 times/week';
      } else if (_selectedActivity.name == 'Extra Active: Intense Exercise daily') {
        Exposed.activity = 'Extra Active: Intense Exercise daily';
      }
    });
  }

  List<ActivityDrop> _companies = ActivityDrop.getCompanies();
  List<DropdownMenuItem<ActivityDrop>> _dropdownMenuItemsCalcs;
  ActivityDrop _selectedActivity;

  String exposedActivity = 'Sedentary: Little or no exercise';

  int initialActivi() {
    if(Exposed.activity  == 'Sedentary: Little or no exercise') {
      return 0;
    }  else if (Exposed.activity == 'Light: Exercise 1-3 times/week') {
      return 1;
    } else if (Exposed.activity == 'moderate: Exercise 4-5 times/week') {
      return 2;
    } else if (Exposed.activity == 'Active: Daily Exercise or intense exercise 3-4 times/week') {
      return 3;
    } else if (Exposed.activity == 'Very Active: Intense exercise 6-7 times/week') {
      return 4;
    } else if (Exposed.activity == 'Extra Active: Intense Exercise daily') {
      return 5;
    }
  }


  @override
  void initState() {
    _dropdownMenuItemsCalcs = buildDropdownMenuItems(_companies);
    _selectedActivity = _dropdownMenuItemsCalcs[initialActivi()].value;

   /* exposedActivity = _selectedActivity.name;*/

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
