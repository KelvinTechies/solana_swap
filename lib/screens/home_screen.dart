import 'dart:ui';

import 'package:flutter/material.dart';

class HomeSccreen extends StatefulWidget {
  const HomeSccreen({super.key});

  @override
  State<HomeSccreen> createState() => _HomeSccreenState();
}

final Map<String, String> currencyImages = {
  'USDT': 'assets/images/t.png',
  'SOL': 'assets/images/solana_logo.png',
};

String _displayTxt = "";
bool _t = false;
double _offsetX = 0.0;
String? selectedCurrency = 'USDT'; // Default selected value
String? selectedCurrencyForSol = 'SOL'; // Default selected value
bool isTextFieldEmpty = true;
double _imageOffset = 0.0;
double _maxOffset = 500.0; // Adjust as needed

String shortenWithAsterisks(String text, int maxLength) {
  if (text.length <= maxLength) {
    return text;
  } else {
    int prefixLength = (maxLength ~/ 2) - 1;
    int suffixLength = maxLength - prefixLength - 1;
    String prefix = text.substring(0, prefixLength);
    String suffix = text.substring(text.length - suffixLength);
    return '$prefix.....$suffix';
  }
}

String solAddr = '34567898765fgbhg';
String shortenedText = shortenWithAsterisks(solAddr, 15);

class _HomeSccreenState extends State<HomeSccreen> {
  @override
  void _showModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          actions: [
            Container(
              width: 220,
              height: 56,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color(0x0FF6FB9DA),
                      width: 1,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(100)),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color(0x0FF6FB9DA),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    textAlign: TextAlign.center,
                    "Okay! Got it",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: "NunitoSans",
                        fontSize: 16,
                        color: Color(0X0FF0B090D)),
                  )),
            ),
          ],
          title: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 138,
                child: Text(
                  textAlign: TextAlign.center,
                  "SOL Swapped successfully",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0X0FFF5F5F5)),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/gradient_BG.png'), // Replace this with your image path
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            color: Colors.black.withOpacity(0.8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 173,
                    child: ListTile(
                      leading: Image.asset("assets/images/profile-circle.png"),
                      subtitle: Text(
                        shortenedText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: "NunitoSans",
                        ),
                      ),
                      title: Text(
                        'John Doe',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontFamily: "NunitoSans",
                        ),
                      ),
                    )),
                Container(
                  decoration: BoxDecoration(
                      // color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  padding: EdgeInsets.all(10),
                  child: Container(
                    /*        width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height, */
                    /*  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), */
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(11, 9, 13, 0.5),

                          // color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Swap",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Container(
                                  width: 170,
                                  child: DropdownButtonFormField(
                                    value: selectedCurrency,
                                    dropdownColor: Colors.black,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Poppins",
                                    ),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    items: currencyImages.entries.map((entry) {
                                      return DropdownMenuItem(
                                        value: entry.key,
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              entry.value,
                                              width:
                                                  24, // Adjust width according to your design
                                              height:
                                                  24, // Adjust height according to your design
                                            ),
                                            SizedBox(
                                                width:
                                                    10), // Adjust spacing according to your design
                                            Text(
                                              entry.key,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                    18, // Adjust font size according to your design
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "Poppins",
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (val) {
                                      setState(() {
                                        selectedCurrency = val as String?;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      // Update the boolean variable based on whether the text field is empty or not
                                      isTextFieldEmpty = value.isEmpty;
                                    });
                                  },
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                  ),
                                  decoration: InputDecoration(
                                      hintText: "0.00",
                                      hintStyle: TextStyle(
                                        color: Color(0X0FF626262),
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Poppins",
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            style: BorderStyle.none,
                                            width: 0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(
                              "Bal: 2,555 USDT",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFCACACA),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: "NunitoSans",
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Image.asset("assets/images/grp_4.png")],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Container(
                                  width: 170,
                                  child: DropdownButtonFormField(
                                    value: selectedCurrencyForSol,
                                    dropdownColor: Colors.black,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Poppins",
                                    ),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    items: currencyImages.entries.map((entry) {
                                      return DropdownMenuItem(
                                        value: entry.key,
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              entry.value,
                                              width:
                                                  24, // Adjust width according to your design
                                              height:
                                                  24, // Adjust height according to your design
                                            ),
                                            SizedBox(
                                                width:
                                                    10), // Adjust spacing according to your design
                                            Text(
                                              entry.key,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                    18, // Adjust font size according to your design
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "Poppins",
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (val) {
                                      setState(() {
                                        selectedCurrencyForSol = val as String?;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                  ),
                                  decoration: InputDecoration(
                                      hintText: "0.00",
                                      hintStyle: TextStyle(
                                        color: Color(0X0FF626262),
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Poppins",
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            style: BorderStyle.none,
                                            width: 0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(
                              "Bal: 2,555 USDT",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFCACACA),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: "NunitoSans",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // )
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(11, 9, 13, 0.5),

                      // color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "Swap Summary",
                          style: TextStyle(
                              color: Color(0X0ffA2A2A2),
                              fontFamily: "NunitoSans",
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Expected payment",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "NunitoSans",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            Text(
                              "0.00 SOL",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "NunitoSans",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Price Impact",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "NunitoSans",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            Text(
                              "0%",
                              style: TextStyle(
                                  color: Color(0X0FF4BCE97),
                                  fontFamily: "NunitoSans",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Min received after slippage (0%)",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "NunitoSans",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            Text(
                              "0.00 SOL",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "NunitoSans",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Network Fee",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "NunitoSans",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            Text(
                              "0.00 SOL",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "NunitoSans",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Provider ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "NunitoSans",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            Text(
                              "--",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "NunitoSans",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Opacity(
                    opacity: isTextFieldEmpty ? 0.3 : 1.0,
                    child: /* Container(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFF0D0D0D)),
                      ),
                      onPressed: null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("assets/images/grp_44.png"),
                          Text(
                            "Slide to Swap",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "NunitoSans",
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                          Image.asset(
                              "assets/images/arrow-down-double-sharp.png")
                        ],
                      ),
                    ),
                  ), */

                        Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF0D0D0D),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: GestureDetector(
                        onHorizontalDragUpdate: (details) {
                          setState(() {
                            // Update offsetX based on drag gesture
                            _offsetX += details.primaryDelta!;
                          });
                        },
                        onHorizontalDragEnd: (details) {
                          // Reset offsetX when drag ends
                          if (_offsetX > 220) {
                            _displayTxt = "Swap processing...";
                            _t = true;
                            _showModal();
                          } else {
                            _displayTxt = "Slide to Swap";
                          }
                          setState(() {
                            _offsetX = 0.0;
                          });
                        },
                        child: Container(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Color(0xFF0D0D0D),
                              ),
                            ),
                            onPressed: () {
                              null;
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Transform.translate(
                                  offset: Offset(_offsetX, 0),
                                  child: _t
                                      ? Image.asset(
                                          "assets/images/grp_44.png",
                                        )
                                      : Stack(
                                          children: [
                                            Positioned(
                                              right: 0,
                                              child: Image.asset(
                                                "assets/images/grp_44.png",
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
                                Text(
                                  _displayTxt,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "NunitoSans",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                Image.asset(
                                  "assets/images/arrow-down-double-sharp.png",
                                  width: 20, // Adjust arrow size as needed
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
