import 'package:ceria_app/constant.dart';
import 'package:ceria_app/main/bloc/auth_bloc.dart';
import 'package:ceria_app/repo/api-repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ApiRepository repo = ApiRepository();
  AuthBloc authBloc;
  bool loading = false;
  @override
  void initState() {
    super.initState();
    authBloc = BlocProvider.of<AuthBloc>(context);
  }

  @override
  void dispose() {
    authBloc.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      cubit: authBloc,
      listener: (context, state){
        if(state is AuthSuccess){
          Fluttertoast.showToast(msg: "Success Login", toastLength: Toast.LENGTH_SHORT);
          setState(() {
            loading = false;
          });
        }
        if(state is AuthFailed){
          Fluttertoast.showToast(msg: "Failed Login\nPhone Number and/or Password Incorrect");
          setState(() {
            loading = false;
          });
        }
        if(state is AuthLoading){
          setState(() {
            loading = true;
          });
        }
      },
      child:Container(
        clipBehavior: Clip.antiAlias,
        height: MediaQuery.of(context).size.height * 0.50,
        margin: EdgeInsets.symmetric(horizontal: DefaultDimen.spaceExtraLarge),
        padding: EdgeInsets.symmetric(horizontal: DefaultDimen.spaceLarge),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15))),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: DefaultDimen.spaceExtraLarge),
              padding: EdgeInsets.only(top: DefaultDimen.spaceMedium),
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.all(Radius.circular(45))),
              child: TextField(
                controller: phoneNumberController,
                autofocus: true,
                textAlign: TextAlign.left,
                keyboardType: TextInputType.phone,
                style: TextStyle(
                  fontFamily: DefaultFont.PoppinsFont,
                  fontSize: DefaultDimen.textLarge,
                  color: DefaultColor.textPrimary,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Container(
                    width: 1,
                    height: 1,
                    alignment: Alignment.center,
                    child: Text("62",
                      style: TextStyle(
                        fontFamily: DefaultFont.PoppinsFont,
                        fontSize: DefaultDimen.textLarge,
                        fontWeight: FontWeight.w500,
                        color: DefaultColor.textPrimary,
                      ),
                    ),
                  ),
                  hintText: "Phone Number",
                ),
              ),
            ),
            SizedBox(
              height: DefaultDimen.spaceLarge,
            ),
            Container(
              height: 70,
              padding: EdgeInsets.all(DefaultDimen.spaceLarge),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.all(Radius.circular(45))),
              child: TextField(
                controller: passwordController,
                textAlign: TextAlign.left,
                obscureText: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password"
                ),
              ),
            ),
            SizedBox(
              height: DefaultDimen.spaceLarge,
            ),
            GestureDetector(
              child: Container(
                height: 70,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.all(Radius.circular(45))),
                child: TextField(
                  enabled: false,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Login",
                      hintStyle: TextStyle(
                        fontFamily: DefaultFont.PoppinsFont,
                        fontWeight: FontWeight.bold,
                        fontSize: DefaultDimen.textLarge,
                        color: Colors.white,
                      ),
                      suffixIcon: loading ?
                      Container(
                          padding: EdgeInsets.all(16),
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                      ) :
                      Icon(Icons.arrow_forward, color: Colors.white,size: DefaultDimen.textExtraLarge + 10,)
                  ),
                ),
              ),
              onTap: (){
                if(phoneNumber.value.text.isEmpty && password.value.text.isEmpty){
                  Fluttertoast.showToast(msg: "Can not be Empty");
                }else {
                  authBloc.add(
                      AuthLogin(
                          phoneNumber: phoneNumber.value.text.trim(),
                          password: password.value.text.trim()
                      )
                  );
                }
              },
            ),
            SizedBox(height: DefaultDimen.spaceLarge,),
            GestureDetector(
              child: Container(
                child: Text("Forgot Password ?",
                  style: TextStyle(
                    fontFamily: DefaultFont.PoppinsFont,
                    fontSize: DefaultDimen.textLarge,
                    color: DefaultColor.textPrimary,
                  ),
                ),
              ),
            ),
            SizedBox(height: DefaultDimen.spaceExtraLarge,),
            Container(
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("Do not have account ? ",
                      style: TextStyle(
                        fontFamily: DefaultFont.PoppinsFont,
                        fontSize: DefaultDimen.textLarge,
                        color: DefaultColor.textPrimary,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      child: Text("Register Here",
                        style: TextStyle(
                          fontFamily: DefaultFont.PoppinsFont,
                          fontSize: DefaultDimen.textLarge,
                          color: DefaultColor.textPrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
