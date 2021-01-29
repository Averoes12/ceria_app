import 'package:ceria_app/constant.dart';
import 'package:ceria_app/main/auth-screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DefaultColor.primaryColor,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: DefaultDimen.spaceExtraLarge, bottom: DefaultDimen.spaceLarge),
                width: 200,
                child: Image.asset(DefaultImg.Logo,),
              ),
              Container(
                child: Text("Clean Home\nClean Life.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: DefaultDimen.textDoubleExtraLarge - 10,
                    fontFamily: DefaultFont.PoppinsFont,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              ),
              SizedBox(height: DefaultDimen.spaceMedium,),
              Container(
                child: Text("Book Cleaners at the Comfort\nof you home",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: DefaultFont.PoppinsFont,
                    fontSize: DefaultDimen.textExtraLarge,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: DefaultDimen.spaceLarge,),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(DefaultImg.Login),
              ),
              SizedBox(height: DefaultDimen.spaceLarge,),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: DefaultDimen.spaceLarge),
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(DefaultDimen.radius * 8))
                  ),
                  child: Text("Get Started",
                    style: TextStyle(
                      fontFamily: DefaultFont.PoppinsFont,
                      fontWeight: FontWeight.w500,
                      fontSize: DefaultDimen.textMedium,
                      color: DefaultColor.primaryColor
                    ),
                  ),
                ),
                onTap: (){
                  showModalBottomSheet(
                    enableDrag: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)
                      )
                    ),
                    context: context,
                    builder: (ctx){
                      return AuthScreen();
                    }
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
