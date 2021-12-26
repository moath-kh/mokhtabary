import 'dart:async';
// ignore: implementation_imports
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
// ignore: unused_import
import 'package:mokhtabary/Language/generated/key-lang.dart';
import 'package:mokhtabary/views/send_email_screen.dart';
import 'package:mokhtabary/widgets/Button/my_button.dart';
import 'package:mokhtabary/widgets/CArdS/delivery_card.dart';
import 'package:mokhtabary/widgets/CArdS/price_card.dart';
import 'package:mokhtabary/widgets/CArdS/showcard.dart';

class AfterRerustScreen extends StatefulWidget {
  static const String screenRoute = 'afterrequestscreen';
  const AfterRerustScreen({Key? key, required this.tittle}) : super(key: key);
  final String tittle;

  @override
  _AfterRerustScreenState createState() => _AfterRerustScreenState();
}

class _AfterRerustScreenState extends State<AfterRerustScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  // ignore: prefer_const_constructors
  late String phone;
  late String name;
  late String uid;
  late String age;
  String error = '';
  bool isPassword = true;
  // ignore: prefer_typing_uninitialized_variables
  var   latitude;
  // ignore: prefer_typing_uninitialized_variables
  var   longitude;
  bool loading = false;
  var formkey = GlobalKey<FormState>();
  static CameraPosition get _kGooglePlex => const CameraPosition(
        target: LatLng(30.194933, 35.737234),
        zoom: 14.4746,
      );
  // static final Marker _kLakemarker = Marker(
  //     markerId: MarkerId('_lakemarkerket'),
  //     infoWindow: InfoWindow(title: 'lake pexl'),
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  //     position: LatLng(30.194933, 35.737234));
  // static final Marker _googleplexmarker = Marker(
  //   rotation: 1,
  //   icon: BitmapDescriptor.defaultMarker,
  //   markerId: MarkerId('Your Location'),
  //   infoWindow: InfoWindow(title: 'Med Lap'),
  //   position: LatLng(30.1957514, 35.7360254),
  // );

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  // ignore: unused_field
  late LocationData _location;
  @override
  void initState() {
    super.initState();
    checklocation();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List;
    final requestId = args[0];
    final data = args[1];
    // ignore: avoid_print
    print('our requestId is ------------- $requestId');
    // ignore: avoid_print
    print('our data is ------------- $data');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[900],
        actions: [
          IconButton(
            icon: const Icon(Icons.done_rounded),
            onPressed: () {
              FirebaseFirestore.instance
                  .collection('request')
                  .doc(requestId)
                  .delete();
            },
          )
        ],
        title: Text(
          data['typeTest'],
          style: GoogleFonts.sora(color: Colors.yellowAccent),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: GoogleMap(
                // liteModeEnabled: true,
                // cameraTargetBounds: CameraTargetBounds.unbounded,
                // buildingsEnabled: true,
                // indoorViewEnabled: true,
                 onCameraMove: (object) => {
          setState(() {
            latitude = object.target.latitude;
            longitude = object.target.longitude;
          })},
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            // FloatingActionButton.extended(
            //   onPressed: _goToThelake,
            //   label: Text('data'),
            //   icon: Icon(Icons.directions_boat),
            // ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  ShowCard(
                      icon: Icons.person,
                      title: data['name'],
                      name: KeyLang.username.tr()),
                  const SizedBox(
                    height: 10,
                  ),
                  ShowCard(
                      icon: Icons.event_available,
                      title: data['age'],
                      name: KeyLang.age.tr()),
                  const SizedBox(
                    height: 10,
                  ),
                  ShowCard(
                      icon: Icons.phone,
                      title: data['phone'],
                      name: KeyLang.phone.tr()),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const PriceCard(),
                  const SizedBox(
                    height: 10,
                  ),
                  const DeliveryCard(),
                  const SizedBox(height: 10),
                  Mybuuton(
                      tittle: KeyLang.send.tr(),
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.pushNamed(context, EmailScreen.screenRoute);
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> checklocation() async {
    // ignore: unnecessary_new
    Location location = new Location();
    _serviceEnabled = await location.serviceEnabled();
    if (_serviceEnabled) {
      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.granted) {
        _location = await location.getLocation();
        // ignore: avoid_print
        print(' Location' +
            _location.latitude.toString() +
            " " +
            _location.longitude.toString());
        // location.onLocationChanged.listen((LocationData currentLocation) {
        //   // ignore: avoid_print
        //   print(' Location' +
        //       currentLocation.latitude.toString() +
        //       " " +
        //       currentLocation.longitude.toString());
        //   // Use current location
        // });
        // //
      } else {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted == PermissionStatus.granted) {
          // ignore: avoid_print
          print('user allowed ');
        } else {
          SystemNavigator.pop();
        }
      }
    } else {
      _serviceEnabled = await location.requestService();
      if (_serviceEnabled) {
        _permissionGranted = await location.hasPermission();
        if (_permissionGranted == PermissionStatus.granted) {
          // ignore: avoid_print
          print('user allowed berfore ');
        } else {
          _permissionGranted = await location.requestPermission();
          if (_permissionGranted == PermissionStatus.granted) {
            // ignore: avoid_print
            print('user allowed');
          } else {
            SystemNavigator.pop();
          }
        }
      } else {
        SystemNavigator.pop();
      }
    }
  }

  // ignore: unused_element
  Future<void> _goToThelake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
  }
}
