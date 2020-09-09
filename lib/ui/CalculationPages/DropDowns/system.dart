

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp2/system_bloc/system_bloc.dart';
import 'package:flutterapp2/system_bloc/system_event.dart';

import 'exposeddropdown.dart';

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
      selectedSystem = selectedCompany;
      if(selectedSystem.name == 'Metric') {
        BlocProvider.of<SystemBloc>(context).add(GetMetric());
        Exposed.systems = 'Metric';
      } else if (selectedSystem.name == 'Imperial') {
        BlocProvider.of<SystemBloc>(context).add(GetImperial());
        Exposed.systems = 'Imperial';
      }
    });
  }

  List<SystemDrop> _companies = SystemDrop.getCompanies();
  List<DropdownMenuItem<SystemDrop>> _dropdownMenuItemsCalcs;
  static SystemDrop selectedSystem;

  /* String exposedSystem = selectedSystem.name;*/



  @override
  void initState() {
    _dropdownMenuItemsCalcs = buildDropdownMenuItems(_companies);
    selectedSystem = _dropdownMenuItemsCalcs[0].value;

    /*exposedSystem = selectedSystem.name;*/

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
      value: selectedSystem,
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
