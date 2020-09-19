

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'exposeddropdown.dart';

class GoalDropDown extends StatefulWidget {

  @override
  _GoalDropDownState createState() =>  _GoalDropDownState();



}

class GoalDrop {
  int id;
  String name;

  GoalDrop(this.id, this.name);

  static List<GoalDrop> getCompanies() {
    return <GoalDrop>[
      GoalDrop(1, 'Maintain Weight'),
      GoalDrop(2, 'Mild Weight Loss (.5lb / .25kg per week)'),
      GoalDrop(3, 'Medium Weight Loss (1lb / .5kg per week)'),
      GoalDrop(4, 'Extreme Weight Loss (2lb / 1kg per week)'),
      GoalDrop(5, 'Mild Weight Gain (.5lb / .25kg per week)'),
      GoalDrop(6, 'Medium Weight Gain (1 lb / .5kg per week)'),
      GoalDrop(7, 'Extreme Weight Gain (2 lb / 1kg per week)'),
    ];
  }
}





class _GoalDropDownState extends State<GoalDropDown> {




  onChangeDropdownItem(GoalDrop selectedCompany) {
    setState(() {
      _selectedGoal = selectedCompany;

      if(_selectedGoal.name == 'Mild Weight Loss (.5lb / .25kg per week)') {
        Exposed.goal = 'Mild Weight Loss (.5lb / .25kg per week)';
      } else if (_selectedGoal.name == 'Maintain Weight') {
        Exposed.goal = 'Maintain Weight';
      } else if (_selectedGoal.name == 'Medium Weight Loss (1lb / .5kg per week)') {
        Exposed.goal = 'Medium Weight Loss (1lb / .5kg per week)';
      }else if (_selectedGoal.name == 'Extreme Weight Loss (2lb / 1kg per week)') {
        Exposed.goal = 'Extreme Weight Loss (2lb / 1kg per week)';
      } else if (_selectedGoal.name == 'Mild Weight Gain (.5lb / .25kg per week)') {
        Exposed.goal = 'Mild Weight Gain (.5lb / .25kg per week)';
      } else if (_selectedGoal.name == 'Medium Weight Gain (1 lb / .5kg per week)') {
        Exposed.goal = 'Medium Weight Gain (1 lb / .5kg per week)';
      } else if (_selectedGoal.name == 'Extreme Weight Gain (2 lb / 1kg per week)') {
        Exposed.goal = 'Extreme Weight Gain (2 lb / 1kg per week)';
      }

    });
  }

  List<GoalDrop> _companies = GoalDrop.getCompanies();
  List<DropdownMenuItem<GoalDrop>> _dropdownMenuItemsCalcs;
  GoalDrop _selectedGoal;

  String exposedGoal = 'Maintain Weight';

  int initialGoal() {
    if(Exposed.goal  == 'Maintain Weight') {
      return 0;
    } else if (Exposed.goal == 'Mild Weight Loss (.5lb / .25kg per week)') {
      return 1;
    } else if (Exposed.goal == 'Medium Weight Loss (1lb / .5kg per week)') {
      return 2;
    } else if (Exposed.goal == 'Extreme Weight Loss (2lb / 1kg per week)') {
      return 3;
    } else if (Exposed.goal == 'Mild Weight Gain (.5lb / .25kg per week)') {
      return 4;
    } else if (Exposed.goal == 'Medium Weight Gain (1 lb / .5kg per week)') {
      return 5;
    } else if (Exposed.goal == 'Extreme Weight Gain (2 lb / 1kg per week)') {
      return 6;
    }
  }


  @override
  void initState() {
    _dropdownMenuItemsCalcs = buildDropdownMenuItems(_companies);
    _selectedGoal = _dropdownMenuItemsCalcs[initialGoal()].value;

    /*exposedGoal = _selectedGoal.name;*/

    super.initState();
  }


  List<DropdownMenuItem<GoalDrop>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<GoalDrop>> items = List();
    for (GoalDrop company in companies) {
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
      value: _selectedGoal,
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


