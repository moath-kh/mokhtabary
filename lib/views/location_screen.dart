import 'dart:async';
// ignore: implementation_imports
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
// ignore: unused_import
import 'package:mokhtabary/Language/generated/key-lang.dart';
import 'package:mokhtabary/widgets/Button/my_button.dart';
import 'package:mokhtabary/widgets/CArdS/delivery_card.dart';
import 'package:mokhtabary/widgets/CArdS/price_card.dart';
import 'package:mokhtabary/widgets/Button/rigester_button.dart';

class AfterTest extends StatefulWidget {
  static const String screenRoute = 'AfterTstsSccreen';
  const AfterTest({Key? key, required this.tittle}) : super(key: key);
  final String tittle;

  @override
  _AfterTestState createState() => _AfterTestState();
}

class _AfterTestState extends State<AfterTest> {
  final Completer<GoogleMapController> _controller = Completer();
  // ignore: prefer_const_constructors
  late String phone;
  late String name;
  late String uid;
  late String age;
  // ignore: prefer_collection_literals
  final Set<Marker> _markers = Set<Marker>();
  List<LatLng> polyongLatLngs = <LatLng>[];
  String error = '';
  bool isPassword = true;
  bool loading = false;
  bool buttonPressed = false;
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

  late List<Marker> marker = [
    const Marker(
      rotation: 1,
      markerId: MarkerId('Your Location'),
      infoWindow: InfoWindow(title: 'Med Lap'),
      position: LatLng(30.1957514, 35.7360254),
    ),
    //marker med lap
    const Marker(
      markerId: MarkerId(' Location 2 '),
      infoWindow: InfoWindow(
        title: 'Med Lap',
      ),
      position: LatLng(30.585164, 36.238414),
    ),
    const Marker(
      markerId: MarkerId(' Location  3'),
      infoWindow: InfoWindow(title: 'Byo Lap'),
      position: LatLng(35.00778, 36.83113),
    ), //35.00778 , 36.83113
  ];
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  // ignore: unused_field
  late LocationData _location;
  @override
  void initState() {
    super.initState();
    checklocation();
    _setMarker(const LatLng(30.194933, 35.737234));
  }

  void _setMarker(LatLng point) {
    setState(() {
      _markers.add(Marker(
        markerId: const MarkerId('marker'),
        position: point,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[900],
        title: Text(
          widget.tittle,
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
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                markers: marker.toSet(),
              ),
            ),
            // FloatingActionButton.extended(
            //   onPressed: _goToThelake,
            //   label: Text('data'),
            //   icon: Icon(Icons.directions_boat),
            // ),
            SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    //name
                    RigsterButton(
                      onsave: (value) {
                        setState(() {
                          name = value!;
                        });
                      },
                      onClick: (value) {
                        name = value;
                      },
                      bord: TextInputType.name,
                      onEmpty: (value) {
                        if (value!.isEmpty) {
                          return KeyLang.pusername.tr();
                        }
                        return null;
                      },
                      titlle: KeyLang.username.tr(),
                      icon: const Icon(Icons.person),
                    ),
                    //age
                    RigsterButton(
                      titlle: KeyLang.age.tr(),
                      bord: TextInputType.number,
                      onEmpty: (value) {
                        if (value!.isEmpty) {
                          return KeyLang.page.tr();
                        }
                        return null;
                      },
                      icon: const Icon(Icons.event_available),
                      onsave: (value) {
                        setState(() {
                          age = value!;
                        });
                      },
                      onClick: (value) {
                        age = value;
                      },
                    ),
                    //Phone
                    RigsterButton(
                      titlle: KeyLang.phone.tr(),
                      icon: const Icon(
                        Icons.phone,
                      ),
                      bord: TextInputType.phone,
                      onsave: (value) {
                        setState(() {
                          phone = value!;
                        });
                      },
                      onEmpty: (value) =>
                          value!.length < 10 ? KeyLang.ephone.tr() : null,
                      onClick: (value) {
                        phone = value;
                      },
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
                        tittle: KeyLang.submit.tr(),
                        color: Colors.blue,
                        buttonPressed: buttonPressed,
                        onPressed: buttonPressed
                            ? null
                            : () {
                                final userId =
                                    FirebaseAuth.instance.currentUser!.uid;
                                if (formkey.currentState!.validate()) {
                                  FirebaseFirestore.instance
                                      .collection('request')
                                      .add({
                                    'name': name,
                                    'phone': phone,
                                    'age': age,
                                    'date': Timestamp.fromDate(
                                        DateTime.now().toLocal()),
                                    'typeTest': widget.tittle,
                                    'userId': userId
                                  }).then((value) {
                                    setState(() {
                                      buttonPressed = true;
                                      Fluttertoast.showToast(
                                          msg: KeyLang.requst.tr(),
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    });
                                    Future.delayed(const Duration(minutes: 30),
                                        () {
                                      setState(() {
                                        buttonPressed = false;
                                      });
                                    });
                                  });
                                }
                              })
                  ],
                ),
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
  Future<void> _goToThelake(Map<String, dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng))));
    _setMarker(LatLng(lat, lng));
  }
}






































































// class GeoLocatorWidget extends StatefulWidget {
//   static const String screenRoute = 'AfterTstsSccreen';
//   const GeoLocatorWidget({Key? key}) : super(key: key);
//   @override
//   _GeoLocatorWidgetState createState() => _GeoLocatorWidgetState();
// }

// class _GeoLocatorWidgetState extends State<GeoLocatorWidget> {
//   late StreamSubscription<Position> _streamSubscription;
//   String message = 'empty';

//   @override
//   void initState() {
//     super.initState();
//     _streamSubscription = Geolocator.getPositionStream(

//             //desiredAccuracy: LocationAccuracy.medium,
//             //distanceFilter: 500,
//             )
//         .listen(_onData, onError: _onError);
//   }

//   void _onData(Position position) {
//     ScaffoldState? _scaffoldKey = Scaffold.maybeOf(context);
//     if ((_scaffoldKey?.mounted ?? false)) _scaffoldKey!.hideCurrentSnackBar();
//     setState(() {
//       message =
//           'latitude: ${position.latitude}, longitude: ${position.longitude}';
//     });
//   }

//   void _onError(dynamic error) {
//     bool geoService = error is LocationServiceDisabledException ||
//         error is PermissionDeniedException;
//     ScaffoldState? _scaffoldKey = Scaffold.maybeOf(context);
//     if (!(_scaffoldKey?.mounted ?? false)) return;
//     _scaffoldKey!.hideCurrentSnackBar();
//     _scaffoldKey.showSnackBar(SnackBar(
//       content: Text('$error'),
//       duration: const Duration(minutes: 2),
//       action: geoService
//           ? SnackBarAction(
//               label: 'Change',
//               onPressed: () async {
//                 if (error is LocationServiceDisabledException) {
//                   bool locationEnabled =
//                       await Geolocator.isLocationServiceEnabled();
//                   if (!locationEnabled)
//                     await Geolocator.openLocationSettings();
//                   else
//                     setState(() {
//                       message = '''
//                       locationService is enabled but the error says 
//                       its of type LocationServiceDisabledException anyway :(
//                     ''';
//                     });
//                 } else
//                   await Geolocator.openAppSettings();
//               },
//             )
//           : null,
//     ));
//   }

//   @override
//   void dispose() {
//     _streamSubscription.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(message),
//     );
//   }
// }


// var locationmessage = '';
//   void getCurrentUser() async {
//     var possition = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     var lastPossition = await Geolocator.getLastKnownPosition();
//     // ignore: avoid_print
//     print(lastPossition);

//     setState(() {
//       locationmessage = "$possition.latitude , $possition.longitude";
//     });
//   }

//  Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Icon(
//               Icons.location_on,
//               size: 40,
//               color: Colors.blue,
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Text(
//               'Get User Location',
//               style: GoogleFonts.palanquin(
//                 fontSize: 20,
//                 color: Colors.amber[900],
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Text(locationmessage),
//             MaterialButton(
//               onPressed: () {
//                 getCurrentUser();
//               },
//               color: Colors.blue,
//               child: Text(
//                 'Get Current User',
//                 style: GoogleFonts.palanquin(color: Colors.white),
//               ),
//             )
//           ],
//         ),
//       ),
    