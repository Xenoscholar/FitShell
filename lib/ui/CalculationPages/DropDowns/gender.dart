

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'exposeddropdown.dart';

class GenderDropDown extends StatefulWidget {
  @override
  _GenderDropDownState createState() => _GenderDropDownState();


}

class GenderDrop {
  int id;
  String name;

  GenderDrop(this.id, this.name);

  static List<GenderDrop> getCompanies() {
    return <GenderDrop>[
      GenderDrop(1, 'Male'),
      GenderDrop(2, 'Female'),
    ];
  }
}



class _GenderDropDownState extends State<GenderDropDown> {

  onChangeDropdownItem(GenderDrop selectedCompany) {
    setState(() {
      _selectedGender = selectedCompany;

      if(_selectedGender.name == 'Male') {
        Exposed.gender = 'Male';
      } else if (_selectedGender.name == 'Female') {
        Exposed.gender = 'Female';
      }
    });
  }

  List<GenderDrop> _companies = GenderDrop.getCompanies();
  List<DropdownMenuItem<GenderDrop>> _dropdownMenuItemsCalcs;
  GenderDrop _selectedGender;

  String exposedActivity = 'Male';


  @override
  void initState() {
    _dropdownMenuItemsCalcs = buildDropdownMenuItems(_companies);
    _selectedGender = _dropdownMenuItemsCalcs[0].value;

    exposedActivity = _selectedGender.name;

    super.initState();
  }


  List<DropdownMenuItem<GenderDrop>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<GenderDrop>> items = List();
    for (GenderDrop company in companies) {
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
      value: _selectedGender,
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
