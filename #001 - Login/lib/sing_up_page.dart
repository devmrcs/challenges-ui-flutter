import 'dart:ui';

import 'package:dailyui_001/colors.dart';
import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 50.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width - 20, size.height - 250);
    var secondEndPoint =
        Offset(size.width + (size.width / 2), size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 80);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class WaveClipperTop extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 50.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width - 20, size.height - 150);
    var secondEndPoint =
        Offset(size.width + (size.width / 2), size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 80);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

final FocusNode focusNode = FocusNode();

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (FocusScope.of(context).hasFocus) {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: MyColors.white,
        body: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Header(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFileds(),
                      Buttons(),
                      DontHaveAccount()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: WaveClipperTop(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: MyColors.gradientPurpleBlue,
                stops: [0.0, 0.9],
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: MyColors.gradientPurpleBlue,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        Positioned(
          top: 24 + 8.0,
          left: 8,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 50,
                width: 50,
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.arrow_back,
                  size: 35,
                  color: Colors.white60,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 80,
          left: 24,
          child: Text(
            "Create Account",
            style: TextStyle(
              color: MyColors.white,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class TextFileds extends StatelessWidget {
  const TextFileds({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        runSpacing: 8.0,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: "Name",
              isDense: false,
              contentPadding: EdgeInsets.zero,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Email",
              isDense: false,
              contentPadding: EdgeInsets.zero,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Password",
              isDense: false,
              contentPadding: EdgeInsets.zero,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Corfirm Password",
              isDense: false,
              contentPadding: EdgeInsets.all(4),
            ),
          ),
        ],
      ),
    );
  }
}

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Already have a account? ",
            style: TextStyle(
                color: MyColors.grayLight,
                fontSize: 15,
                fontWeight: FontWeight.w400),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: () {},
            child: Text(
              "Sign In",
              style: TextStyle(
                color: MyColors.purple,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 8.0,
        children: <Widget>[
          Text(
            "Forget password?",
            style: TextStyle(
              color: MyColors.grayLight,
              fontSize: 15,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF5B35BC), Color(0xFF4568DD)],
                stops: [0.2, 1.5],
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: GradientButton(text: "Sign In"),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 1,
                  color: MyColors.grayLight,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "or",
                  style: TextStyle(
                    color: MyColors.grayLight,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 1,
                  color: MyColors.grayLight,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(25),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(4),
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 20,
                    child: Image.asset("assets/google.png"),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Sign in with Goole",
                    style: TextStyle(
                      color: MyColors.gray,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: MyColors.grayLight,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  final String text;
  const GradientButton({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: () {},
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(8),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: MyColors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
