import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class CalculatorButton extends StatefulWidget {
  final String symbol;
  final Color color;
  final Function(String symbol) function;
  const CalculatorButton({Key? key, required this.symbol, required this.color, required this.function}) : super(key: key);

  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    String symbol = widget.symbol;
    Color color = widget.color;
    Offset distance = isPressed ? const Offset(1,1) : const Offset(2, 2);
    double blur = isPressed ? 2.0 : 3.0;
    return Listener(
      onPointerUp: (_) {
        setState(() => isPressed = false);
        widget.function(symbol);
      }
      ,
      onPointerDown: (_) => setState(() => isPressed = true),
      child: AnimatedContainer(
        duration: const Duration(milliseconds:100),
        width: 200,
        height: 200,
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: Text(
                symbol,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, fontFamily: 'Montserrat'),
                textAlign: TextAlign.center)
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  blurRadius: blur,
                  offset: -distance,
                  color: Colors.white,
                  inset: isPressed
              ),
              BoxShadow(
                  blurRadius: blur,
                  offset: distance,
                  color: const Color(0xFFA7A9AF),
                  inset: isPressed
              )
            ]
        )
      )
    );
  }
}
