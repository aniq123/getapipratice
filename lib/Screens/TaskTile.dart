// tasktile.dart
import 'package:flutter/material.dart';

class Tasktile extends StatelessWidget {
  const Tasktile({
    super.key,
    required this.size,
    required this.text,
    this.time,
    this.des,
    this.press,
  });

  final Size size;
  final TextTheme text;
  final String? time, des;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Material(
        elevation: 5,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: size.width * 0.3,
                //height: size.height * 0.5,
                color: Colors.red,
                child: Text(
                  time ?? "",
                  style: text.headlineSmall!.copyWith(color: Colors.white),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    des ?? "",
                    style: text.headline6,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: press as void Function()?,
                child: Container(
                  alignment: Alignment.center,
                  width: size.width * 0.1,
                  color: Colors.red,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
