import 'package:flutter/material.dart';

class VerticalBar extends StatelessWidget {
  double input_temp;
  String png;
  VerticalBar({Key? key, required this.input_temp, required this.png})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.network(
          "https:${png}",
          scale: 2.1,
        ),
        // const SizedBox(
        //   height: 10,
        // ),
        Text(input_temp.toString()),
        Container(
          color: Colors.red,
          width: 20,
          height: input_temp / 50 * 250,
        ),
      ],
    );
  }
}
