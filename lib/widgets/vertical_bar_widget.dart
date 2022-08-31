import 'package:flutter/material.dart';

class VerticalBar extends StatelessWidget {
  double input_temp;
  String png;
  int time;
  VerticalBar(
      {Key? key,
      required this.input_temp,
      required this.png,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.network(
          "https:${png}",
          width: 30,
          height: 30,
        ),
        // const SizedBox(
        //   height: 10,
        // ),
        Text(input_temp.toString()),
        const SizedBox(
          height: 3,
        ),
        Container(
          color: input_temp <= 20
              ? Colors.blue
              : input_temp > 20 && input_temp < 30
                  ? Color.fromARGB(255, 247, 203, 145)
                  : Color.fromARGB(255, 243, 138, 138),
          width: 20,
          height: input_temp / 50 * 230,
        ),
        const SizedBox(
          height: 3,
        ),
        Text(time < 10 ? "0${time}:00" : "${time}:00"),
      ],
    );
  }
}
