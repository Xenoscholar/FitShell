

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp2/calculation_bloc/calculation_bloc.dart';
import 'package:flutterapp2/calculation_bloc/calculation_event.dart';

class ExtraCalcDropDown extends StatefulWidget {
  @override
  _ExtraCalcDropDownState createState() => _ExtraCalcDropDownState();


}

class ExtraCalc {
  int id;
  String name;

  ExtraCalc(this.id, this.name);

  static List<ExtraCalc> getCompanies() {
    return <ExtraCalc>[
      ExtraCalc(1, 'One Rep Max'),
      ExtraCalc(2, 'Protein Intake'),
      ExtraCalc(3, 'Creatine Intake'),
      ExtraCalc(4, 'Calorie Deficit/Surplus'),
      ExtraCalc(5, 'Macro Split'),
      ExtraCalc(6, 'Max Heart Rate'),
      ExtraCalc(7, 'Target Heart Rate'),
    ];
  }
}



class _ExtraCalcDropDownState extends State<ExtraCalcDropDown> {

  onChangeDropdownItem(ExtraCalc selectedCompany) {
    setState(() {
      _selectedCalc = selectedCompany;

      /*BlocProvider.of<CalculationBloc>(context)
          .add(GetLeanBodyMass());*/

      if(_selectedCalc.name == 'One Rep Max') {
        BlocProvider.of<CalculationBloc>(context)
            .add(GetLeanBodyMass());
      }

      switch(_selectedCalc.name) {
        case 'One Rep Max': {
          BlocProvider.of<CalculationBloc>(context)
              .add(GetOneRepMax());
        }
        break;

        case 'Protein Intake': {
          BlocProvider.of<CalculationBloc>(context)
              .add(GetProteinIntake());
        }
        break;

        case 'Creatine Intake': {
          BlocProvider.of<CalculationBloc>(context)
              .add(GetCreatineIntake());
        }
        break;

        case 'Calorie Deficit/Surplus': {
          BlocProvider.of<CalculationBloc>(context)
              .add(GetCaloricDeficit());
        }
        break;

        case 'Macro Split': {
          BlocProvider.of<CalculationBloc>(context)
              .add(GetMacroSplit());
        }
        break;

        case 'Max Heart Rate': {
          BlocProvider.of<CalculationBloc>(context)
              .add(GetMaxHeartRate());
        }
        break;

        case 'Target Heart Rate': {
          BlocProvider.of<CalculationBloc>(context)
              .add(GetTargetHeartRate());
        }
        break;

      }


    });
  }

  List<ExtraCalc> _companies = ExtraCalc.getCompanies();
  List<DropdownMenuItem<ExtraCalc>> _dropdownMenuItemsCalcs;
  ExtraCalc _selectedCalc;


  @override
  void initState() {
    _dropdownMenuItemsCalcs = buildDropdownMenuItems(_companies);
    _selectedCalc = _dropdownMenuItemsCalcs[0].value;

    super.initState();
  }


  List<DropdownMenuItem<ExtraCalc>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<ExtraCalc>> items = List();
    for (ExtraCalc company in companies) {
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
      value: _selectedCalc,
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
