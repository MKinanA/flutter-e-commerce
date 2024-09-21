import 'package:flutter/material.dart';

class SplashContent extends StatefulWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Spacer(),
        Text(
          widget.text!,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        widget.image != null ? Image.asset(
          widget.image!,
          height: 265,
          width: 235,
        ) : const SizedBox(),
        widget.image != null ? const Spacer() : const SizedBox()
      ],
    );
  }
}
