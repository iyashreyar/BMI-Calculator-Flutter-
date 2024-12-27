import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var msg = "";
  var bgColor = Colors.purple.shade50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
                'BMI Calculator',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              )),
          backgroundColor: Colors.purple,
        ),
        body: Container(
            color: bgColor,
            child: Center(
              child: Container(
                margin: EdgeInsets.all(30),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: 'My  ',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 28,
                                  fontStyle: FontStyle.italic)),
                          TextSpan(
                              text: 'BMI ',
                              style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold,
                                fontSize: 34,
                              )),
                          TextSpan(
                              text: 'Calculator',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 28,
                                  fontStyle: FontStyle.italic)),
                        ]),
                      ),
                      SizedBox(
                        height: 61,
                      ),
                      TextField(
                        controller: wtController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'Enter your Weight (in Kgs)',
                            prefixIcon: Icon(Icons.line_weight)),
                      ),
                      SizedBox(
                        height: 21,
                      ),
                      TextField(
                        controller: ftController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'Enter your Height (in Feet)',
                            prefixIcon: Icon(Icons.height)),
                      ),
                      SizedBox(
                        height: 21,
                      ),
                      TextField(
                        controller: inController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'Enter your Height (in Inch)',
                            prefixIcon: Icon(Icons.height)),
                      ),
                      SizedBox(
                        height: 41,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            var wt = wtController.text.toString();
                            var ft = ftController.text.toString();
                            var inch = inController.text.toString();

                            if (wt != "" && ft != "" && inch != "") {
                              var iWt = int.parse(wt);
                              var iFt = int.parse(ft);
                              var iInch = int.parse(inch);

                              var tInch = (iFt * 12) + iInch;
                              var tCm = tInch * 2.54;
                              var tM = tCm / 100;

                              var bmi = iWt / (tM * tM);

                              if (bmi > 25) {
                                msg = "You're overweight, ";
                                bgColor = Colors.red.shade100;
                              } else if (bmi < 18) {
                                msg = "You're Underweight, ";
                                bgColor = Colors.yellow.shade100;
                              } else {
                                msg = "You're Healthy, ";
                                bgColor = Colors.green.shade100;
                              }

                              setState(() {
                                result = "$msg \n Your BMI is : ${bmi.toStringAsFixed(2)}";
                              });
                            } else {
                              setState(() {
                                result = "Please fill the requires blanks";
                              });
                            }
                          },
                          child: Text('Calculate')),
                      SizedBox(
                        height: 31,
                      ),
                      Center(
                          child: Text(
                            result,
                            style:
                            TextStyle(fontSize: 19),
                          ))
                    ],
                  ),
                ),
              ),
            ),
        ));
    }
}
