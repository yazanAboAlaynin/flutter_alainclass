import 'package:flutter/material.dart';

class SellCar extends StatefulWidget {
  @override
  _SellCarState createState() => _SellCarState();
}

class _SellCarState extends State<SellCar> {
  @override
  Widget build(BuildContext context) {
    final sizeAware = MediaQuery.of(context).size;
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Image.asset(
          'assets/images/black_logo.png',
          fit: BoxFit.cover,
          width: sizeAware.width * 0.4,
          //height: sizeAware.height * 0.01,
        ),
        actions: <Widget>[
          Icon(
            Icons.call,
            size: sizeAware.width * 0.1,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: sizeAware.width,
              height: sizeAware.height * 0.3,
              child: Image.asset(
                'assets/images/cover2.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Sell Your Car',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: sizeAware.width * 0.05,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: sizeAware.height * 0.006,
                width: sizeAware.width * 0.3,
                color: Colors.red,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'content here content herecontent herecontent herecontent herecontent herecontent herecontent herecontent herecontent herecontent herecontent here',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: sizeAware.width * 0.04,
                ),
              ),
            ),
            Container(
              color: Color.fromRGBO(48, 52, 56, 1.0),
              width: sizeAware.width,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: sizeAware.height * 0.02,
                      ),
                      Center(
                        child: Text(
                          'Submit your car details',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      SizedBox(
                        height: sizeAware.height * 0.02,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.add_circle,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: sizeAware.width * 0.02,
                          ),
                          Text(
                            'Add Car images',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: sizeAware.height * 0.02,
                      ),
                      Text(
                        'Full Name',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: sizeAware.height * 0.015,
                      ),
                      Container(
                        height: sizeAware.height * 0.055,
                        width: sizeAware.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.red,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(71, 77, 82, 1.0),
                            focusColor: Color.fromRGBO(48, 52, 56, 1.0),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                          ),
                          validator: (val) =>
                              val.isEmpty ? 'Enter a name' : null,
                          onChanged: (val) {
                            setState(() {
                              //email = val;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: sizeAware.height * 0.025,
                      ),
                      Text(
                        'Phone Number',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: sizeAware.height * 0.015,
                      ),
                      Container(
                        height: sizeAware.height * 0.055,
                        width: sizeAware.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.red,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(71, 77, 82, 1.0),
                            focusColor: Color.fromRGBO(48, 52, 56, 1.0),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                          ),
                          validator: (val) =>
                              val.isEmpty ? 'Enter a name' : null,
                          onChanged: (val) {
                            setState(() {
                              //email = val;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: sizeAware.height * 0.025,
                      ),
                      Text(
                        'Email Adress',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: sizeAware.height * 0.015,
                      ),
                      Container(
                        height: sizeAware.height * 0.055,
                        width: sizeAware.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.red,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(71, 77, 82, 1.0),
                            focusColor: Color.fromRGBO(48, 52, 56, 1.0),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                          ),
                          validator: (val) =>
                              val.isEmpty ? 'Enter a name' : null,
                          onChanged: (val) {
                            setState(() {
                              //email = val;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: sizeAware.height * 0.025,
                      ),
                      Text(
                        'Make',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: sizeAware.height * 0.015,
                      ),
                      Container(
                        height: sizeAware.height * 0.055,
                        width: sizeAware.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.red,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(71, 77, 82, 1.0),
                            focusColor: Color.fromRGBO(48, 52, 56, 1.0),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                          ),
                          validator: (val) =>
                              val.isEmpty ? 'Enter a name' : null,
                          onChanged: (val) {
                            setState(() {
                              //email = val;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: sizeAware.height * 0.025,
                      ),
                      Text(
                        'Car Model',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: sizeAware.height * 0.015,
                      ),
                      Container(
                        height: sizeAware.height * 0.055,
                        width: sizeAware.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.red,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(71, 77, 82, 1.0),
                            focusColor: Color.fromRGBO(48, 52, 56, 1.0),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                          ),
                          validator: (val) =>
                              val.isEmpty ? 'Enter a name' : null,
                          onChanged: (val) {
                            setState(() {
                              //email = val;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: sizeAware.height * 0.025,
                      ),
                      Text(
                        'Year',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: sizeAware.height * 0.015,
                      ),
                      Container(
                        height: sizeAware.height * 0.055,
                        width: sizeAware.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.red,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(71, 77, 82, 1.0),
                            focusColor: Color.fromRGBO(48, 52, 56, 1.0),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                          ),
                          validator: (val) =>
                              val.isEmpty ? 'Enter a name' : null,
                          onChanged: (val) {
                            setState(() {
                              //email = val;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: sizeAware.height * 0.025,
                      ),
                      Text(
                        'Milage',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: sizeAware.height * 0.015,
                      ),
                      Container(
                        height: sizeAware.height * 0.055,
                        width: sizeAware.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.red,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(71, 77, 82, 1.0),
                            focusColor: Color.fromRGBO(48, 52, 56, 1.0),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                          ),
                          validator: (val) =>
                              val.isEmpty ? 'Enter a name' : null,
                          onChanged: (val) {
                            setState(() {
                              //email = val;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: sizeAware.height * 0.025,
                      ),
                      Text(
                        'Price',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: sizeAware.height * 0.015,
                      ),
                      Container(
                        height: sizeAware.height * 0.055,
                        width: sizeAware.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.red,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(71, 77, 82, 1.0),
                            focusColor: Color.fromRGBO(48, 52, 56, 1.0),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                          ),
                          validator: (val) =>
                              val.isEmpty ? 'Enter a name' : null,
                          onChanged: (val) {
                            setState(() {
                              //email = val;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: sizeAware.height * 0.025,
                      ),
                      Text(
                        'Notes',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: sizeAware.height * 0.015,
                      ),
                      Container(
                        height: sizeAware.height * 0.12,
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.red,
                          expands: true,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(71, 77, 82, 1.0),
                            focusColor: Color.fromRGBO(48, 52, 56, 1.0),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                          ),
                          validator: (val) =>
                              val.isEmpty ? 'Enter a name' : null,
                          onChanged: (val) {
                            setState(() {
                              //email = val;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
