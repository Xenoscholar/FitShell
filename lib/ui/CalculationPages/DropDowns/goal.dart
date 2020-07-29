

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoalDropDown extends StatefulWidget {
  @override
  _GoalDropDownState createState() => _GoalDropDownState();


}

class GoalDrop {
  int id;
  String name;

  GoalDrop(this.id, this.name);

  static List<GoalDrop> getCompanies() {
    return <GoalDrop>[
      GoalDrop(1, 'Lose Weight'),
      GoalDrop(2, 'Maintain weight'),
      GoalDrop(3, 'Build Muscle'),
      GoalDrop(4, 'Recomposition (Gain Muscle + Lose Fat')
    ];
  }
}



class _GoalDropDownState extends State<GoalDropDown> {

  onChangeDropdownItem(GoalDrop selectedCompany) {
    setState(() {
      _selectedGoal = selectedCompany;
    });
  }

  List<GoalDrop> _companies = GoalDrop.getCompanies();
  List<DropdownMenuItem<GoalDrop>> _dropdownMenuItemsCalcs;
  GoalDrop _selectedGoal;

  String exposedGoal = 'Lose Weight';


  @override
  void initState() {
    _dropdownMenuItemsCalcs = buildDropdownMenuItems(_companies);
    _selectedGoal = _dropdownMenuItemsCalcs[0].value;

    exposedGoal = _selectedGoal.name;

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
