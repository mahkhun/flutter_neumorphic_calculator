import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
import 'calculator_buttons.dart';

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({Key? key}) : super(key: key);

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  final backgroundColor = const Color(0xFFE7ECEF);

  String calculationString = "";

  String resultString = "";

  final double sizedBoxHeight = 30.0;

  final double sizedBoxWidth = 20.0;

  void _updateResults(String symbol) {
    setState((){
      if (symbol == "AC") {
        calculationString = "";
        resultString = "";
      } else if (symbol == "DEL") {
        calculationString != "" ? calculationString = calculationString.substring(0, calculationString.length-1) : null;
      } else if (symbol == "=") {
        calculationString = resultString;
        resultString = "";
      } else if (symbol == "+" || symbol == "x" || symbol == "/") {
        !((calculationString.endsWith("+") || calculationString.endsWith("-")|| calculationString.endsWith("x") || calculationString.endsWith("/") || calculationString.endsWith(".")) || calculationString.isEmpty) ? calculationString = "$calculationString$symbol" : null;
      } else if (symbol == "-") {
        !(calculationString.endsWith("-") || calculationString.endsWith(".")) ? calculationString = "$calculationString$symbol" : null;
      } else if (symbol == "%") {
        !((calculationString.endsWith("+") || calculationString.endsWith("-") || calculationString.endsWith("x") || calculationString.endsWith("/") || calculationString.endsWith(".")) || calculationString.isEmpty) ? calculationString = "$calculationString$symbol" : null;
      } else if (symbol == ".") {
        !_isDecimalViolation(calculationString) ? calculationString = "$calculationString$symbol" : null;
      } else {
        calculationString = "$calculationString$symbol";
        }
      try {
        resultString ="${_evaluateExpression(calculationString)}";
      } on RangeError {
        null;
      }
      }
    );
  }

  num _evaluateExpression(String expression){
    expression = expression.replaceAll(RegExp(r"x"), "*").replaceAll(RegExp(r"%"), "*1/100");
    num result = expression.interpret();
    return result;
  }

  bool _isDecimalViolation(String expression) {
    int counter = expression.length;
    if (!(expression == "")) {
      while (counter > 0) {
        String character = expression.substring(counter-1, counter);
        if (character == ".") {
          return true;
        } else if (character == "+" || character == "-" || character == "x" || character == "/") {
          return false;
        } else {
          counter--;
        }
      }
      return false;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: const Center(
              child: Text(
                  "Calculator Application",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 22)
              )
          ),
          backgroundColor: const Color(0xFFA7A9AF),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                  flex: 1,
                  child: Center(
                      child: Container(
                          padding: const EdgeInsets.fromLTRB(14, 14, 14, 7),
                          child: Column(
                              children: <Widget>[
                                Flexible(child: Text(
                                  calculationString,
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 56,
                                  )
                                ), flex: 2),
                                Flexible(child: Text(
                                  resultString,
                                  style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 24,
                                  )
                                )),
                              ]
                          )
                      )
                  )
              ),
              Flexible(
                  flex: 3,
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(14, 7, 14, 14),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget> [
                            SizedBox(width:sizedBoxWidth, height: sizedBoxHeight),
                            Flexible(child: Row(
                                children: [
                                  Flexible(child: CalculatorButton(symbol: "AC", color: backgroundColor, function: _updateResults)),
                                  SizedBox(width:sizedBoxWidth, height: sizedBoxHeight),
                                  Flexible(child: CalculatorButton(symbol:"DEL", color: backgroundColor, function: _updateResults)),
                                  SizedBox(width:sizedBoxWidth, height: sizedBoxHeight),
                                  Flexible(child: CalculatorButton(symbol:"%", color: backgroundColor, function: _updateResults)),
                                  SizedBox(width:sizedBoxWidth, height: sizedBoxHeight),
                                  Flexible(child: CalculatorButton(symbol:"/", color: backgroundColor, function: _updateResults)),
                                ]
                              )
                            ),
                            SizedBox(width:sizedBoxWidth, height: sizedBoxHeight),
                            Flexible(child: Row(
                                children: [
                                  Flexible(child: CalculatorButton(symbol:"7", color: backgroundColor, function: _updateResults)),
                                  SizedBox(width:sizedBoxWidth, height: sizedBoxHeight),
                                  Flexible(child: CalculatorButton(symbol:"8", color: backgroundColor, function: _updateResults)),
                                  SizedBox(width:sizedBoxWidth, height: sizedBoxHeight),
                                  Flexible(child: CalculatorButton(symbol:"9", color: backgroundColor, function: _updateResults)),
                                  SizedBox(width:sizedBoxWidth, height: sizedBoxHeight),
                                  Flexible(child: CalculatorButton(symbol:"x", color: backgroundColor, function: _updateResults)),
                                ]
                              )
                            ),
                            SizedBox(width:sizedBoxWidth, height: sizedBoxHeight),
                            Flexible(child: Row(
                                children: [
                                  Flexible(child: CalculatorButton(symbol:"4", color: backgroundColor, function: _updateResults)),
                                  SizedBox(width:sizedBoxWidth, height: sizedBoxHeight),
                                  Flexible(child: CalculatorButton(symbol:"5", color: backgroundColor, function: _updateResults)),
                                  SizedBox(width:sizedBoxWidth, height: sizedBoxHeight),
                                  Flexible(child: CalculatorButton(symbol:"6", color: backgroundColor, function: _updateResults)),
                                  SizedBox(width:sizedBoxWidth, height: sizedBoxHeight),
                                  Flexible(child: CalculatorButton(symbol:"-", color: backgroundColor, function: _updateResults)),
                                ]
                              )
                            ),
                            SizedBox(width:sizedBoxWidth, height: sizedBoxHeight),
                            Flexible(child: Row(
                                children: [
                                  Flexible(child: CalculatorButton(symbol:"1", color: backgroundColor, function: _updateResults)),
                                  SizedBox(width:sizedBoxWidth, height: sizedBoxHeight),
                                  Flexible(child: CalculatorButton(symbol:"2", color: backgroundColor, function: _updateResults)),
                                  SizedBox(width:sizedBoxWidth, height: sizedBoxHeight),
                                  Flexible(child: CalculatorButton(symbol:"3", color: backgroundColor, function: _updateResults)),
                                  SizedBox(width:sizedBoxWidth, height: sizedBoxHeight),
                                  Flexible(child: CalculatorButton(symbol:"+", color: backgroundColor, function: _updateResults)),
                                ]
                              )
                            ),
                            SizedBox(width:sizedBoxWidth, height: sizedBoxHeight),
                            Flexible(child: Row(
                                children: [
                                  Flexible(child: CalculatorButton(symbol:"0", color: backgroundColor, function: _updateResults)),
                                  SizedBox(width:sizedBoxWidth, height: sizedBoxHeight),
                                  Flexible(child: CalculatorButton(symbol:".", color: backgroundColor, function: _updateResults)),
                                  SizedBox(width:sizedBoxWidth, height: sizedBoxHeight),
                                  Flexible(child: CalculatorButton(symbol:"=", color: Colors.orange, function: _updateResults), flex: 2),
                                ]
                              )
                            ),
                            SizedBox(width:1.2*sizedBoxWidth, height: 1.2*sizedBoxHeight),
                          ]
                      )
                  )
              )
            ]
        )
    );
  }
}