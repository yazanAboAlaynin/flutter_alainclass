import 'package:alainclass/screens/view_car/image_slider.dart';
import 'package:alainclass/shared/footer.dart';
import 'package:flutter/material.dart';

class ViewCar extends StatefulWidget {
  @override
  _ViewCarState createState() => _ViewCarState();
}

class _ViewCarState extends State<ViewCar> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool showDesc = false;
  @override
  Widget build(BuildContext context) {
    final sizeAware = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      key: _scaffoldKey,
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
          children: <Widget>[
            Container(
              height: sizeAware.height * 0.3,
              width: sizeAware.width,
              child: Image.asset(
                'assets/images/cover7.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: sizeAware.width,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Car Name here',
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: sizeAware.height * 0.02,
            ),
            Container(
              color: Color.fromRGBO(48, 52, 56, 1.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'Technical Details',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey[600],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Model Year',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: sizeAware.height * 0.02,
                            ),
                            Text(
                              '2015',
                              style: TextStyle(
                                color: Colors.white,
                                //fontSize: 18,
                                // fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                              height: sizeAware.height * 0.03,
                            ),
                            Text(
                              'Exterior',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: sizeAware.height * 0.02,
                            ),
                            Text(
                              'Silver Metrilic',
                              style: TextStyle(
                                color: Colors.white,
                                //fontSize: 18,
                                // fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                              height: sizeAware.height * 0.03,
                            ),
                            Text(
                              'Engine',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: sizeAware.height * 0.02,
                            ),
                            Text(
                              '4,6L VB',
                              style: TextStyle(
                                color: Colors.white,
                                //fontSize: 18,
                                // fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: sizeAware.width * 0.2,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Mileage',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: sizeAware.height * 0.02,
                            ),
                            Text(
                              '1,040 KMs',
                              style: TextStyle(
                                color: Colors.white,
                                //fontSize: 18,
                                // fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                              height: sizeAware.height * 0.03,
                            ),
                            Text(
                              'Interior',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: sizeAware.height * 0.02,
                            ),
                            Text(
                              'Black | Green',
                              style: TextStyle(
                                color: Colors.white,
                                //fontSize: 18,
                                // fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                              height: sizeAware.height * 0.03,
                            ),
                            Text(
                              'Origin',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: sizeAware.height * 0.02,
                            ),
                            Text(
                              '',
                              style: TextStyle(
                                color: Colors.white,
                                //fontSize: 18,
                                // fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey[600],
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          showDesc = !showDesc;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Description',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: showDesc,
                      child: Text(
                        'blah blah blah'
                        'blah blah blah'
                        'blah blah blah'
                        'blah blah blah'
                        'blah blah blah'
                        'blah blah blah'
                        'blah blah blah'
                        'blah blah blah'
                        'blah blah blah'
                        'blah blah blah',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: sizeAware.height * 0.02,
            ),
            Text(
              'Car Photos',
              style: TextStyle(
                color: Colors.white,
                fontSize: sizeAware.width * 0.10,
              ),
            ),
            Container(
              height: sizeAware.height * 0.3,
              child: ManuallyControlledSlider(),
            ),
            SizedBox(
              height: sizeAware.height * 0.02,
            ),
            Divider(
              color: Colors.redAccent[700],
              height: sizeAware.height * 0.02,
            ),
            Text(
              'Enquiries',
              style: TextStyle(
                color: Colors.red,
                fontSize: sizeAware.width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'For more information or any enquiries, Kindly fill the form.',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: sizeAware.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                      height: sizeAware.height * 0.065,
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
                          hintText: 'Please enter your name',
                          filled: true,
                          fillColor: Color.fromRGBO(48, 52, 56, 1.0),
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
                        validator: (val) => val.isEmpty ? 'Enter a name' : null,
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
                      height: sizeAware.height * 0.065,
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
                          hintText: 'Please enter your email address',
                          filled: true,
                          fillColor: Color.fromRGBO(48, 52, 56, 1.0),
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
                        validator: (val) => val.isEmpty ? 'Enter a name' : null,
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
                      height: sizeAware.height * 0.065,
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
                          hintText: 'Please enter your number',
                          filled: true,
                          fillColor: Color.fromRGBO(48, 52, 56, 1.0),
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
                        validator: (val) => val.isEmpty ? 'Enter a name' : null,
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
                      'Message',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: sizeAware.height * 0.015,
                    ),
                    Container(
                      height: sizeAware.height * 0.15,
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.red,
                        expands: true,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          filled: true,
                          hintText: 'Type your message here',
                          fillColor: Color.fromRGBO(48, 52, 56, 1.0),
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
                        validator: (val) => val.isEmpty ? 'Enter a name' : null,
                        onChanged: (val) {
                          setState(() {
                            //email = val;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: sizeAware.height * 0.02,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      height: sizeAware.height * 0.07,
                      minWidth: sizeAware.width,
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.red,
                      textColor: Colors.white,
                      child: new Text(
                        "Submit Message",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      splashColor: Colors.redAccent,
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.redAccent[700],
              height: sizeAware.height * 0.02,
            ),
            MyFooter(),
          ],
        ),
      ),
    );
  }
}
