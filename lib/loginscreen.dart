import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:
      InkWell(
        child: Center(
          child: Row(
            children: [
              Image(
                image: AssetImage("asset/Images/icons8-google-48.png"),
                height: 30,
              ),
              SizedBox(width: 5),
              Text(
                'Continue with Google',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
