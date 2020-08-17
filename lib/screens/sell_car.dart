import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_uploader/flutter_uploader.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class SellCar extends StatefulWidget {
  @override
  _SellCarState createState() => _SellCarState();
}

class _SellCarState extends State<SellCar> {
  String _name;
  String _phone;
  String _email;
  String _make;
  String _model;
  String _year;
  String _millage;
  String _price;
  String _notes = "";
  final _formKey = GlobalKey<FormState>();
  List<Asset> images = List<Asset>();

  Future getImage() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';
    final uploader = FlutterUploader();

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
      );

      setState(() {
        images = resultList;
      });

      final String path = "await getApplicationDocumentsDirectory().path";

      final Uint8List newImage =
          (await images[0].getByteData()).buffer.asUint8List();
      File im = File.fromRawPath(newImage);
    } on Exception catch (e) {
      print('here');
      error = e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizeAware = MediaQuery.of(context).size;
    var inputDecoration = InputDecoration(
      filled: true,
      fillColor: Color.fromRGBO(71, 77, 82, 1.0),
      focusColor: Color.fromRGBO(48, 52, 56, 1.0),
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
    );

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
                "We are also the perfect place to sell your car and welcome your enquiry. You can be assured of premium service and that your sale is in the very best hands." +
                    "There are four ways we can assist in selling your car: \n• Sell for cash \n• Part Exchange \n• Selling a Forward Order \n• By Brokerage (we sell your car for a percentage of the agreed sale price)" +
                    "\nPlease fill in the contact form below, or call us for an informal chat to check out your sale options.",
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
                      InkWell(
                        onTap: getImage,
                        child: Row(
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
                      ),
                      images.isNotEmpty
                          ? Container(
                              child: AssetThumb(
                                asset: images[0],
                                width: 400,
                                height: 300,
                              ),
                            )
                          : Container(),
                      SizedBox(
                        height: sizeAware.height * 0.02,
                      ),
                      Text(
                        'Full Name*',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: sizeAware.height * 0.015,
                      ),
                      Container(
                        width: sizeAware.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.red,
                          decoration: inputDecoration,
                          validator: (val) =>
                              val.isEmpty ? 'Enter a name' : null,
                          onChanged: (val) {
                            setState(() {
                              _name = val;
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
                        width: sizeAware.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.red,
                          decoration: inputDecoration,
                          validator: (val) =>
                              val.isEmpty ? 'Enter a number' : null,
                          onChanged: (val) {
                            setState(() {
                              _phone = val;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: sizeAware.height * 0.025,
                      ),
                      Text(
                        'Email Adress*',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: sizeAware.height * 0.015,
                      ),
                      Container(
                        width: sizeAware.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.red,
                          decoration: inputDecoration,
                          validator: (val) =>
                              val.isEmpty ? 'Enter an email' : null,
                          onChanged: (val) {
                            setState(() {
                              _email = val;
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
                        width: sizeAware.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.red,
                          decoration: inputDecoration,
                          validator: (val) => val.isEmpty ? 'Enter make' : null,
                          onChanged: (val) {
                            setState(() {
                              _make = val;
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
                        width: sizeAware.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.red,
                          decoration: inputDecoration,
                          validator: (val) =>
                              val.isEmpty ? 'Enter model' : null,
                          onChanged: (val) {
                            setState(() {
                              _model = val;
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
                        width: sizeAware.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.red,
                          decoration: inputDecoration,
                          validator: (val) =>
                              val.isEmpty ? 'Enter a year' : null,
                          onChanged: (val) {
                            setState(() {
                              _year = val;
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
                        width: sizeAware.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.red,
                          decoration: inputDecoration,
                          validator: (val) =>
                              val.isEmpty ? 'Enter millage' : null,
                          onChanged: (val) {
                            setState(() {
                              _millage = val;
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
                        width: sizeAware.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.red,
                          decoration: inputDecoration,
                          validator: (val) =>
                              val.isEmpty ? 'Enter a price' : null,
                          onChanged: (val) {
                            setState(() {
                              _price = val;
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
                          decoration: inputDecoration,
                          onChanged: (val) {
                            setState(() {
                              _notes = val;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: sizeAware.height * 0.02),
                      MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            print("yes");
                          }
                        },
                        height: sizeAware.height * 0.07,
                        minWidth: sizeAware.width,
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        color: Colors.red,
                        textColor: Colors.white,
                        child: new Text(
                          "Submit Details",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        splashColor: Colors.redAccent,
                      ),
                      SizedBox(height: sizeAware.height * 0.035),
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
