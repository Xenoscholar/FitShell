

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp2/system_bloc/system_bloc.dart';
import 'package:flutterapp2/system_bloc/system_event.dart';

class SystemDropDown extends StatefulWidget {
  @override
  _SystemDropDownState createState() => _SystemDropDownState();


}

class SystemDrop {
  int id;
  String name;

  SystemDrop(this.id, this.name);

  static List<SystemDrop> getCompanies() {
    return <SystemDrop>[
      SystemDrop(1, 'Metric'),
      SystemDrop(2, 'Imperial'),
    ];
  }
}



class _SystemDropDownState extends State<SystemDropDown> {

  onChangeDropdownItem(SystemDrop selectedCompany) {
    setState(() {
      _selectedGoal = selectedCompany;
      if(_selectedGoal.name == 'Metric') {
        BlocProvider.of<SystemBloc>(context).add(GetMetric());
      } else if (_selectedGoal.name == 'Imperial') {
        BlocProvider.of<SystemBloc>(context).add(GetImperial());
      }
    });
  }

  List<SystemDrop> _companies = SystemDrop.getCompanies();
  List<DropdownMenuItem<SystemDrop>> _dropdownMenuItemsCalcs;
  SystemDrop _selectedGoal;

  String exposedSystem = 'Metric';


  @override
  void initState() {
    _dropdownMenuItemsCalcs = buildDropdownMenuItems(_companies);
    _selectedGoal = _dropdownMenuItemsCalcs[0].value;

    exposedSystem = _selectedGoal.name;

    super.initState();
  }


  List<DropdownMenuItem<SystemDrop>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<SystemDrop>> items = List();
    for (SystemDrop company in companies) {
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
