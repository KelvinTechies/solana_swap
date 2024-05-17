import 'package:flutter/material.dart';
import 'package:simpleswap/screens/create_wallet_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 90,
                left: 0,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset("assets/images/solana_logo.png"),
                    ),
                    Container(
                      child: Text(
                        "Log in",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Text(
                        "Welcome back",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFCACACA),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: "NunitoSans",
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      width: 340,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CreateWalletScreen(), // Navigate to ScreenTwo
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child:
                                  Image.asset('assets/images/google_logo.png'),
                            ),
                            Text(
                              "Log in with Google",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF0B090D),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                fontFamily: "NunitoSans",
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
