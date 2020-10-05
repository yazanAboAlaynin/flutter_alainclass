import 'package:alainclass/blocs/blocs.dart';
import 'package:alainclass/models/models.dart';
import 'package:alainclass/repositories/repositories.dart';
import 'package:alainclass/screens/view_car/image_slider.dart';
import 'package:alainclass/shared/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewCar extends StatefulWidget {
  final Car car;

  const ViewCar({Key key, this.car}) : super(key: key);
  @override
  _ViewCarState createState() => _ViewCarState();
}

class _ViewCarState extends State<ViewCar> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  String name;
  String email;
  String number;
  String message;

  bool showDesc = false;
  List images = [];
  List<Car> similar_cars = [];
  final CarRepository carRepository = CarRepository(
    carApi: CarApi(
      httpClient: http.Client(),
    ),
  );
  CarBloc carBloc;
  calling() async {
    print('here');
    const url = 'tel:0097143782222';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    carBloc = CarBloc(carRepository: carRepository);
  }

  @override
  Widget build(BuildContext context) {
    final sizeAware = MediaQuery.of(context).size;
    return BlocBuilder(
      cubit: carBloc,
      builder: (context, state) {
        if (state is CarInitial) {
          carBloc.add(CarRequested(id: widget.car.id));
        }
        if (state is CarLoadInProgress) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is CarLoadSuccess) {
          images = state.images;
          similar_cars = state.similar_cars;
          return Scaffold(
            backgroundColor: Colors.black,
            key: _scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.black,
              centerTitle: true,
              title: Image.asset(
                'assets/images/black_logo.png',
                fit: BoxFit.cover,
                width: 130,
                //height: sizeAware.height * 0.01,
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                  child: IconButton(
                      icon: Icon(
                        Icons.share,
                        size: 30,
                      ),
                      onPressed: () {
                        final RenderBox box = context.findRenderObject();
                        Share.share("${widget.car.permalink}",
                            sharePositionOrigin:
                                box.localToGlobal(Offset.zero) & box.size);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 2, 4, 2),
                  child: IconButton(
                    icon: Icon(
                      Icons.call,
                      size: 30,
                    ),
                    onPressed: calling,
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: sizeAware.width * 0.6,
                    width: sizeAware.width,
                    child: Image.network(
                      'https://www.alainclass.com/' + widget.car.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: sizeAware.width,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Html(
                          data: """
          ${widget.car.title}
        """,
                          style: {
                            "*": Style(
                                color: Colors.white,
                                fontSize: FontSize(sizeAware.width * 0.06),
                                fontFamily: 'Gentium'),
                          },
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
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Gentium'),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey[600],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Model Year',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Gentium'),
                                    ),
                                    SizedBox(
                                      height: sizeAware.height * 0.02,
                                    ),
                                    Text(
                                      widget.car.model_year,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Gentium'
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
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Gentium'),
                                    ),
                                    SizedBox(
                                      height: sizeAware.height * 0.02,
                                    ),
                                    Text(
                                      widget.car.exterior,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Gentium'
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
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Gentium'),
                                    ),
                                    SizedBox(
                                      height: sizeAware.height * 0.02,
                                    ),
                                    Text(
                                      widget.car.engine,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Gentium'
                                          //fontSize: 18,
                                          // fontWeight: FontWeight.bold
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Mileage',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Gentium'),
                                    ),
                                    SizedBox(
                                      height: sizeAware.height * 0.02,
                                    ),
                                    Text(
                                      widget.car.mileage,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Gentium'
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
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Gentium'),
                                    ),
                                    SizedBox(
                                      height: sizeAware.height * 0.02,
                                    ),
                                    Text(
                                      widget.car.interior,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Gentium'
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
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Gentium'),
                                    ),
                                    SizedBox(
                                      height: sizeAware.height * 0.02,
                                    ),
                                    Text(
                                      widget.car.origin,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Gentium'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey[600],
                          ),
                          Row(
                            children: [
                              Text(
                                'Price: ',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Gentium'),
                              ),
                              Text(
                                widget.car.price ?? 'Not Avilable',
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Gentium'),
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
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Gentium'),
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
                            child: Container(
                              child: Html(
                                data: """
          ${widget.car.description}
        """,
                                style: {
                                  "html": Style(
                                      backgroundColor: Colors.black12,
                                      color: Colors.white,
                                      fontSize:
                                          FontSize(sizeAware.width * 0.05),
                                      fontFamily: 'Gentium'),
                                },
                              ),
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
                        fontFamily: 'Gentium'),
                  ),
                  Container(
                    height: sizeAware.width * 0.5,
                    child: ManuallyControlledSlider(images: images),
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
                        fontFamily: 'Gentium'),
                  ),
                  Text(
                    'For more information or any enquiries, Kindly fill the form.',
                    style: TextStyle(color: Colors.grey, fontFamily: 'Gentium'),
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
                                fontSize: 17,
                                fontFamily: 'Gentium'),
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
                              validator: (val) =>
                                  val.isEmpty ? 'Enter a name' : null,
                              onChanged: (val) {
                                setState(() {
                                  name = val;
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
                                fontSize: 17,
                                fontFamily: 'Gentium'),
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
                              validator: (val) =>
                                  val.isEmpty ? 'Enter a email' : null,
                              onChanged: (val) {
                                setState(() {
                                  email = val;
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
                                fontSize: 17,
                                fontFamily: 'Gentium'),
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
                              validator: (val) =>
                                  val.isEmpty ? 'Enter youe number' : null,
                              onChanged: (val) {
                                setState(() {
                                  number = val;
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
                                fontSize: 17,
                                fontFamily: 'Gentium'),
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
                              validator: (val) =>
                                  val.isEmpty ? 'Enter a message' : null,
                              onChanged: (val) {
                                setState(() {
                                  message = val;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: sizeAware.height * 0.02,
                          ),
                          MaterialButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                var data = {
                                  'name': name,
                                  'email': email,
                                  'number': number,
                                  'message': message
                                };
                                carBloc.add(SendEnquiries(data: data));
                              }
                            },
                            height: sizeAware.height * 0.07,
                            minWidth: sizeAware.width,
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: Colors.red,
                            textColor: Colors.white,
                            child: new Text(
                              "Submit Message",
                              style: TextStyle(
                                  fontSize: 20.0, fontFamily: 'Gentium'),
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
        if (state is SendFinished) {
          return Scaffold(
            backgroundColor: Colors.black,
            key: _scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.black,
              centerTitle: true,
              title: Image.asset(
                'assets/images/black_logo.png',
                fit: BoxFit.cover,
                width: 130,
                //height: sizeAware.height * 0.01,
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                  child: IconButton(
                      icon: Icon(
                        Icons.share,
                        size: 30,
                      ),
                      onPressed: () {
                        final RenderBox box = context.findRenderObject();
                        Share.share("${widget.car.permalink}",
                            sharePositionOrigin:
                                box.localToGlobal(Offset.zero) & box.size);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 2, 4, 2),
                  child: IconButton(
                    icon: Icon(
                      Icons.call,
                      size: 30,
                    ),
                    onPressed: calling,
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: sizeAware.width * 0.6,
                    width: sizeAware.width,
                    child: Image.network(
                      'https://www.alainclass.com/' + widget.car.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: sizeAware.width,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Html(
                          data: """
          ${widget.car.title}
        """,
                          style: {
                            "*": Style(
                                color: Colors.white,
                                fontSize: FontSize(sizeAware.width * 0.06),
                                fontFamily: 'Gentium'),
                          },
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
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Gentium'),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey[600],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Model Year',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Gentium'),
                                    ),
                                    SizedBox(
                                      height: sizeAware.height * 0.02,
                                    ),
                                    Text(
                                      widget.car.model_year,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Gentium'
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
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Gentium'),
                                    ),
                                    SizedBox(
                                      height: sizeAware.height * 0.02,
                                    ),
                                    Text(
                                      widget.car.exterior,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Gentium'
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
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Gentium'),
                                    ),
                                    SizedBox(
                                      height: sizeAware.height * 0.02,
                                    ),
                                    Text(
                                      widget.car.engine,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Gentium'
                                          //fontSize: 18,
                                          // fontWeight: FontWeight.bold
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Mileage',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Gentium'),
                                    ),
                                    SizedBox(
                                      height: sizeAware.height * 0.02,
                                    ),
                                    Text(
                                      widget.car.mileage,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Gentium'
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
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Gentium'),
                                    ),
                                    SizedBox(
                                      height: sizeAware.height * 0.02,
                                    ),
                                    Text(
                                      widget.car.interior,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Gentium'
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
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Gentium'),
                                    ),
                                    SizedBox(
                                      height: sizeAware.height * 0.02,
                                    ),
                                    Text(
                                      widget.car.origin,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Gentium'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey[600],
                          ),
                          Row(
                            children: [
                              Text(
                                'Price: ',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Gentium'),
                              ),
                              Text(
                                widget.car.price ?? 'Not Avilable',
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Gentium'),
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
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Gentium'),
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
                            child: Container(
                              child: Html(
                                data: """
          ${widget.car.description}
        """,
                                style: {
                                  "html": Style(
                                      backgroundColor: Colors.black12,
                                      color: Colors.white,
                                      fontSize:
                                          FontSize(sizeAware.width * 0.05),
                                      fontFamily: 'Gentium'),
                                },
                              ),
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
                        fontFamily: 'Gentium'),
                  ),
                  Container(
                    height: sizeAware.width * 0.5,
                    child: ManuallyControlledSlider(images: images),
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
                        fontFamily: 'Gentium'),
                  ),
                  Text(
                    'For more information or any enquiries, Kindly fill the form.',
                    style: TextStyle(color: Colors.grey, fontFamily: 'Gentium'),
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
                                fontSize: 17,
                                fontFamily: 'Gentium'),
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
                              validator: (val) =>
                                  val.isEmpty ? 'Enter a name' : null,
                              onChanged: (val) {
                                setState(() {
                                  name = val;
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
                                fontSize: 17,
                                fontFamily: 'Gentium'),
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
                              validator: (val) =>
                                  val.isEmpty ? 'Enter a email' : null,
                              onChanged: (val) {
                                setState(() {
                                  email = val;
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
                                fontSize: 17,
                                fontFamily: 'Gentium'),
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
                              validator: (val) =>
                                  val.isEmpty ? 'Enter youe number' : null,
                              onChanged: (val) {
                                setState(() {
                                  number = val;
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
                                fontSize: 17,
                                fontFamily: 'Gentium'),
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
                              validator: (val) =>
                                  val.isEmpty ? 'Enter a message' : null,
                              onChanged: (val) {
                                setState(() {
                                  message = val;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: sizeAware.height * 0.02,
                          ),
                          MaterialButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                var data = {
                                  'name': name,
                                  'email': email,
                                  'number': number,
                                  'message': message
                                };
                                carBloc.add(SendEnquiries(data: data));
                              }
                            },
                            height: sizeAware.height * 0.07,
                            minWidth: sizeAware.width,
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: Colors.red,
                            textColor: Colors.white,
                            child: new Text(
                              "Submit Message",
                              style: TextStyle(
                                  fontSize: 20.0, fontFamily: 'Gentium'),
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
        if (state is CarLoadFailure) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: FlatButton(
                  color: Colors.white,
                  onPressed: () {
                    carBloc.add(CarRequested(id: widget.car.id));
                  },
                  child: Text('Try Again')),
            ),
          );
        }
      },
    );
  }
}
