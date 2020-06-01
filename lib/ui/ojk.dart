import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
class ValueB extends StatefulWidget {
  ValueB({Key key, this.calcPageValue}) : super(key: key);
  final String calcPageValue;

  @override
  _ValueBState createState() => _ValueBState();
}

class _ValueBState extends State<ValueB> {
 */
/* final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final Widget goodJob = const Text('Good job!');*//*


  */
/*final ValueNotifier<String> _calcName = ValueNotifier<String>('${widget.title}');

  final Widget goodJob1 = const Text('bmi job!');
  final Widget goodJob2 = const Text('bmr job!');
  final Widget goodJob3 = const Text('body fat job!');
  final Widget goodJob4 = const Text('lean body mass job!');*//*


  @override
  Widget build(BuildContext context) {

    final ValueNotifier<String> _calcName = ValueNotifier<String>('${widget.calcPageValue}');

    final Widget goodJob1 = const Text('bmi job!');
    final Widget goodJob2 = const Text('bmr job!');
    final Widget goodJob3 = const Text('body fat job!');
    final Widget goodJob4 = const Text('lean body mass job!');
    
    return ValueListenableBuilder(
              builder: (BuildContext context, String value, Widget child) {
                // This builder will only get called when the _counter
                // is updated.



                if(_calcName.value == 'bmi') {
                  return goodJob1;
                }else if (_calcName.value == 'bmr') {
                  return goodJob2;
                }else if (_calcName.value == 'body fat') {
                  return goodJob3;
                }else if (_calcName.value == 'lbm') {
                  return goodJob4;
                }



                */
/*return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text('$value'),
                            child,
                          ],
                        );*//*

              },
              valueListenable: _calcName,
              // The child parameter is most helpful if the child is
              // expensive to build and does not depend on the value from
              // the notifier.
              */
/*child: goodJob1,*//*

            );

  }
}*/


class Vbb extends StatefulWidget {
  Vbb({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _VbbState createState() => _VbbState();
}

class _VbbState extends State<Vbb> {
  /*final ValueNotifier<String> _counter = ValueNotifier<String>('${widget.title}');
  final Widget goodJob = const Text('Good job!');

  final Widget goodJob1 = const Text('bmi job!');
  final Widget goodJob2 = const Text('bmr job!');
  final Widget goodJob3 = const Text('body fat job!');
  final Widget goodJob4 = const Text('lean body mass job!');*/

  @override
  Widget build(BuildContext context) {

     ValueNotifier<String> _counter = ValueNotifier<String>('${widget.title}');
    final Widget goodJob = const Text('Good job!');

    final Widget goodJob1 = const Text('bmi job!');
    final Widget goodJob2 = const Text('bmr job!');
    final Widget goodJob3 = const Text('body fat job!');
    final Widget goodJob4 = const Text('lean body mass job!');

    return ValueListenableBuilder(
              builder: (BuildContext context, String value, Widget child) {
                // This builder will only get called when the _counter
                // is updated.
                /*return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('$value'),
                    child,
                  ],
                );*/

                switch(_counter.value) {
                  case 'bmi': {
                    return goodJob1;
                  }
                  break;
                  case 'lbm': {
                    return goodJob4;
                  }
                }
              },
              valueListenable: _counter,
              // The child parameter is most helpful if the child is
              // expensive to build and does not depend on the value from
              // the notifier.
              child: goodJob,
            );

  }
}