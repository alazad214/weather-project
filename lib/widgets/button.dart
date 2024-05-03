import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.text, this.color, this.ontap, this.isloading});
  final String text;
  final Color? color;
  final ontap;
  final bool? isloading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 70,
        margin: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color ?? Colors.blue,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blueAccent)),
        child: isloading == true
            ? Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(
                      color: Colors.black,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            : Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
