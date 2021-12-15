import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';

// ignore: unused_import
import 'package:mokhtabary/Language/generated/key-lang.dart';

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
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: const LatLng(30.194933, 35.737234),
    zoom: 14.4746,
  );

  late List<Marker> marker = [
    const Marker(
      markerId: MarkerId('Your Location'),
      infoWindow: InfoWindow(title: 'Medd Lap'),
      position: LatLng(30.1957514, 35.7360254),
    ),
    const Marker(
      markerId: MarkerId(' Location 2 '),
      infoWindow: InfoWindow(title: 'Medd Lap'),
      position: LatLng(30.585164, 36.238414),
    ),
    const Marker(
      markerId: MarkerId(' Location  3'),
      infoWindow: InfoWindow(title: 'Medd Lap'),
      position: LatLng(35.00778, 36.83113),
    ), //35.00778 , 36.83113
  ];
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _location;
  @override
  void initState() {
    super.initState();
    checklocation();
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
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: marker.toSet(),
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
        //
        // _location = await location.getLocation();
        // print(' Location' +
        //     _location.latitude.toString() +
        //     " " +
        //     _location.longitude.toString());
        location.onLocationChanged.listen((LocationData currentLocation) {
          print(' Location' +
              currentLocation.latitude.toString() +
              " " +
              currentLocation.longitude.toString());
          // Use current location
        });
        //
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
    