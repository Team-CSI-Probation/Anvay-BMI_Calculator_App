import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool valid = false;
  int Height = 150;
  int Weight = 50;
  double BMIScore = 0.0;
  String Status = '';
  var GenderColor = Colors.black;
  double CalBMI(int ht, int wt) {
    return (wt / (ht / 100 * ht / 100));
    // (wt / ((ht / 100) * (ht / 100)))
  }

  void BMIScale(double bmiscore) {
    if (bmiscore < 18.5) {
      Status = 'Underweight';
    } else if (bmiscore >= 18.5 && bmiscore < 25.0) {
      Status = 'Normal';
    } else if (bmiscore >= 25.0 && bmiscore < 30.0) {
      Status = 'Overweight';
    } else {
      Status = 'Obese';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen.shade600,
          title: Center(
            child: Text(
              'BMI Calculator',
              style: TextStyle(
                fontFamily: 'Mochiy',
              ),
            ),
          ),
        ),
        body: SafeArea(child: Builder(builder: (context) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/BMICalcDesign_AnvayRaj.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            print('Male Selected');
                            setState(() {
                              valid = true;
                              GenderColor = Colors.lightBlueAccent;
                            });
                          },
                          child: Icon(
                            Icons.male,
                            size: 80.0,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          '  Gender  ',
                          style: TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'Mochiy',
                              color: Colors.green.shade900),
                        ),
                        TextButton(
                          onPressed: () {
                            print('Female Selected');
                            setState(() {
                              valid = true;
                              GenderColor = Colors.pinkAccent;
                            });
                          },
                          child: Icon(
                            Icons.female,
                            size: 80.0,
                            color: Colors.pink,
                          ),
                        ),
                      ],
                    ),
                    // color: Colors.red,
                    // height: 100.0,
                  ),
                  Card(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                'Height : ',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                '$Height',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: GenderColor,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                ' cm',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Center(
                            child: Slider(
                              value: Height.toDouble(),
                              min: 25,
                              max: 250,
                              activeColor: GenderColor,
                              inactiveColor: Colors.grey,
                              onChanged: (double newValue) {
                                setState(() {
                                  Height = newValue.round();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                'Weight : ',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                '$Weight',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: GenderColor,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                ' Kg',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Center(
                            child: Slider(
                              value: Weight.toDouble(),
                              min: 5,
                              max: 150,
                              activeColor: GenderColor,
                              inactiveColor: Colors.grey,
                              onChanged: (double newValue) {
                                setState(() {
                                  Weight = newValue.round();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Column(
                              children: [
                                Card(
                                  child: Center(
                                    heightFactor: 2,
                                    child: Text(
                                      'Your BMI Score : $BMIScore',
                                      style: TextStyle(
                                        color: Colors.teal,
                                        fontFamily: 'Times New Roman',
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    color: Colors.green.shade100,
                                    child: Center(
                                      heightFactor: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Status : ',
                                              style: TextStyle(
                                                color: Colors.blueGrey,
                                                fontFamily: 'Times New Roman',
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              '$Status',
                                              style: TextStyle(
                                                color: GenderColor,
                                                fontFamily: 'Times New Roman',
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (valid) {
                                setState(() {
                                  BMIScore = CalBMI(Height, Weight);
                                  BMIScore = double.parse(
                                      (BMIScore).toStringAsFixed(2));
                                  BMIScale(BMIScore);
                                });
                              } else {
                                SnackBar validity = SnackBar(
                                    content: Text('Select Genger First !'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(validity);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(280.0, 50.0),
                              primary: Colors.green,
                            ),
                            child: Text(
                              'Calculate',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    flex: 2,
                  ),
                ],
              ),
            ),
          );
        })),
      ),
    );
  }
}
