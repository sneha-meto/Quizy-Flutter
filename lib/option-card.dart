import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final String opt;
  final int radioVal;
  final int grpVal;
  final Function onTap;

  OptionCard(
      {@required this.opt,
      @required this.radioVal,
      @required this.grpVal,
      @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.deepPurple[100].withOpacity(0.6),
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Text(
                  opt,
                  style: TextStyle(color: Colors.deepPurple, fontSize: 22),
                ),
              ),
              Radio(
                value: radioVal,
                groupValue: grpVal,
                onChanged: (value) {},
                activeColor: Colors.deepPurple,
              )
            ],
          ),
        ),
      ),
    );
  }
}
