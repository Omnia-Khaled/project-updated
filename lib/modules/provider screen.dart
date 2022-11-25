import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mymap/components/components.dart';
import 'package:mymap/cubit/cubit.dart';
import 'package:mymap/cubit/states.dart';

import 'mapScreen.dart';

class ProviderScreen extends StatelessWidget {
  var scaffoldKey2 = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationCubit, LocationStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LocationCubit.get(context);
        double mediaHeight = MediaQuery.of(context).size.height;
        double mediaWidth = MediaQuery.of(context).size.height;
        return Scaffold(
          key: scaffoldKey2,
          drawer: Drawer(
              child: Column(
            children: [
              const UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.teal),
                  accountName: Text('admin'),
                  accountEmail: Text('admin@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.pink,
                    child: Text(
                      'A',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),
                    ),
                  )),
              buildDrawerItem(cubit.screensByDrawer, cubit.drawerIcons, context),
              SizedBox(
                height: mediaHeight * 0.003,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MapScreen()));
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.teal)),
                    child: const Text('user mode')),
              )
            ],
          )),
          body: Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Container(
                height: mediaHeight,
                width: mediaWidth,
                child: GoogleMap(
                  mapType: MapType.normal,
                  zoomControlsEnabled: false,
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(30.033333, 31.233334),
                    zoom: 12.0,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    cubit.mapController = controller;
                  },
                  markers: cubit.markers,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: IconButton(
                    onPressed: ()
                    {
                      scaffoldKey2.currentState!.openDrawer();
                    },
                    icon: const Icon(Icons.menu)),
              ),

              //BottomSheet Services
              Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
                child: Center(
                  child: Column(
                    children: [
                      const Spacer(),
                      Container(
                        height: 50,
                        padding: const EdgeInsets.only(left: 5.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)),
                              backgroundColor: Colors.teal),
                          child: Row(
                            children: const [
                              Icon(Icons.arrow_upward_outlined),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Select the type of service',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Serif')),
                            ],
                          ),
                          onPressed: () {
                            showModalBottomSheet<void>(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0))),
                              context: context,
                              builder: (BuildContext context) =>
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Container(
                                            padding: const EdgeInsets.only(
                                                top: 15.0,
                                                bottom: 15.0,
                                                right: 20,
                                                left: 20),
                                            child: Row(
                                              children: [
                                                BackButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                const Text(
                                                    'Select the type of service',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w600,
                                                        fontFamily: 'Serif')),
                                              ],
                                            )),
                                        SizedBox(
                                          height: 350,
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                GridView.count(
                                                  shrinkWrap: true,
                                                  physics:
                                                  const NeverScrollableScrollPhysics(),
                                                  primary: false,
                                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                                  mainAxisSpacing: 5,
                                                  crossAxisSpacing: 5,
                                                  crossAxisCount: 2,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () => {
                                                        showModalBottomSheet<void>(
                                                          shape: const RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
                                                          context: context,
                                                          builder: (BuildContext context) =>
                                                              SizedBox(
                                                                height: 200,
                                                                child: Container(
                                                                  padding:
                                                                  const EdgeInsets.only(top: 15, right: 20, left: 20),
                                                                  child: Column(
                                                                    children: [
                                                                      Container(
                                                                        alignment:
                                                                        Alignment.topLeft,
                                                                        child:
                                                                        BackButton(
                                                                          onPressed: () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                        ),
                                                                      ), //back button
                                                                      const Text(
                                                                          'Tow Truck For Provider',
                                                                          style: TextStyle(
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontFamily: 'Serif')),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                        )
                                                      },
                                                      child: Card(
                                                        shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                20.0)),
                                                        color: Colors.white70,
                                                        child: Column(
                                                          children: const [
                                                            SizedBox(
                                                                width: 80,
                                                                height: 100,
                                                                child: Image(
                                                                  image: AssetImage(
                                                                      'assets/new-tow.png'),
                                                                )),
                                                            Text(
                                                              "Tow Truck",
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                                  fontFamily:
                                                                  'Serif'),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ), // Tow Truck
                                                    GestureDetector(
                                                      onTap: () => {
                                                        showModalBottomSheet<void>(
                                                          shape: const RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                      30.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                      30.0))),
                                                          context: context,
                                                          builder: (BuildContext
                                                          context) =>
                                                              SizedBox(
                                                                height: 200,
                                                                child: Container(
                                                                  padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 15,
                                                                      right: 20,
                                                                      left: 20),
                                                                  child: Column(
                                                                    children: [
                                                                      Container(
                                                                        alignment:
                                                                        Alignment
                                                                            .topLeft,
                                                                        child:
                                                                        BackButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(
                                                                                context);
                                                                          },
                                                                        ),
                                                                      ), //back button
                                                                      const Text(
                                                                          'Winch For Provider',
                                                                          style: TextStyle(
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontFamily: 'Serif')),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                        )
                                                      },
                                                      child: Card(
                                                          shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  20.0)),
                                                          color: Colors.white70,
                                                          child: Column(
                                                            children: const [
                                                              SizedBox(
                                                                  width: 80,
                                                                  height: 100,
                                                                  child: Image(
                                                                    image: AssetImage(
                                                                        'assets/new-win.png'),
                                                                  )),
                                                              Text(
                                                                "winch",
                                                                style: TextStyle(
                                                                    fontSize: 18,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                    fontFamily:
                                                                    'Serif'),
                                                              )
                                                            ],
                                                          )),
                                                    ), // Winch
                                                    GestureDetector(
                                                      onTap: () => {
                                                        showModalBottomSheet<void>(
                                                          shape: const RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                      30.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                      30.0))),
                                                          context: context,
                                                          builder: (BuildContext
                                                          context) =>
                                                              SizedBox(
                                                                height: 200,
                                                                child: Container(
                                                                  padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 15,
                                                                      right: 20,
                                                                      left: 20),
                                                                  child: Column(
                                                                    children: [
                                                                      Container(
                                                                        alignment:
                                                                        Alignment
                                                                            .topLeft,
                                                                        child:
                                                                        BackButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(
                                                                                context);
                                                                          },
                                                                        ),
                                                                      ), //back button
                                                                      const Text(
                                                                          'First Aid For Provider',
                                                                          style: TextStyle(
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontFamily: 'Serif')),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                        )
                                                      },
                                                      child: Card(
                                                          shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  20.0)),
                                                          color: Colors.white70,
                                                          child: Column(
                                                            children: const [
                                                              SizedBox(
                                                                  width: 80,
                                                                  height: 100,
                                                                  child:
                                                                  Image(
                                                                    image: AssetImage(
                                                                        'assets/first-aid-kit (1).png'),
                                                                  )),
                                                              Text(
                                                                "First Aid",
                                                                style: TextStyle(
                                                                    fontSize: 18,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                    fontFamily:
                                                                    'Serif'),
                                                              )
                                                            ],
                                                          )),
                                                    ), // first aid
                                                    GestureDetector(
                                                      onTap: () => {
                                                        showModalBottomSheet<void>(
                                                          shape: const RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                      30.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                      30.0))),
                                                          context: context,
                                                          builder: (BuildContext
                                                          context) =>
                                                              SizedBox(
                                                                height: 200,
                                                                child: Container(
                                                                  padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 15,
                                                                      right: 20,
                                                                      left: 20),
                                                                  child: Column(
                                                                    children: [
                                                                      Container(
                                                                        alignment:
                                                                        Alignment
                                                                            .topLeft,
                                                                        child:
                                                                        BackButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(
                                                                                context);
                                                                          },
                                                                        ),
                                                                      ), //back button
                                                                      const Text(
                                                                          'Fuel For Provider',
                                                                          style: TextStyle(
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontFamily: 'Serif')),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                        )
                                                      },
                                                      child: Card(
                                                          shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  20.0)),
                                                          color: Colors.white70,
                                                          child: Column(
                                                            children: const [
                                                              SizedBox(
                                                                  width: 80,
                                                                  height: 100,
                                                                  child:
                                                                  Image(
                                                                    image: AssetImage(
                                                                        'assets/fuel.png'),
                                                                  )),
                                                              Text(
                                                                "Fuel",
                                                                style: TextStyle(
                                                                    fontSize: 18,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                    fontFamily:
                                                                    'Serif'),
                                                              )
                                                            ],
                                                          )),
                                                    ), // fuel
                                                    GestureDetector(
                                                      onTap: () => {
                                                        showModalBottomSheet<void>(
                                                          shape: const RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                      30.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                      30.0))),
                                                          context: context,
                                                          builder: (BuildContext
                                                          context) =>
                                                              SizedBox(
                                                                height: 200,
                                                                child: Container(
                                                                  padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 15,
                                                                      right: 20,
                                                                      left: 20),
                                                                  child: Column(
                                                                    children: [
                                                                      Container(
                                                                        alignment:
                                                                        Alignment
                                                                            .topLeft,
                                                                        child:
                                                                        BackButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(
                                                                                context);
                                                                          },
                                                                        ),
                                                                      ), //back button
                                                                      const Text(
                                                                          'JumpStart For Provider',
                                                                          style: TextStyle(
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontFamily: 'Serif')),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                        )
                                                      },
                                                      child: Card(
                                                          shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  20.0)),
                                                          color: Colors.white70,
                                                          child: Column(
                                                            children: const [
                                                              SizedBox(
                                                                  width: 80,
                                                                  height: 100,
                                                                  child: Image(
                                                                    image: AssetImage(
                                                                        'assets/battery.png'),
                                                                  )),
                                                              Text(
                                                                "JumpStart",
                                                                style: TextStyle(
                                                                    fontSize: 18,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                    fontFamily:
                                                                    'Serif'),
                                                              )
                                                            ],
                                                          )),
                                                    ), // jumpstart
                                                    GestureDetector(
                                                      onTap: () => {
                                                        showModalBottomSheet<void>(
                                                          shape: const RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                      30.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                      30.0))),
                                                          context: context,
                                                          builder: (BuildContext
                                                          context) =>
                                                              SizedBox(
                                                                height: 200,
                                                                child: Container(
                                                                  padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 15,
                                                                      right: 20,
                                                                      left: 20),
                                                                  child: Column(
                                                                    children: [
                                                                      Container(
                                                                        alignment:
                                                                        Alignment
                                                                            .topLeft,
                                                                        child:
                                                                        BackButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(
                                                                                context);
                                                                          },
                                                                        ),
                                                                      ), //back button
                                                                      const Text(
                                                                          'Key Lockout For Provider',
                                                                          style: TextStyle(
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontFamily: 'Serif')),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                        )
                                                      },
                                                      child: Card(
                                                          shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  20.0)),
                                                          color: Colors.white70,
                                                          child: Column(
                                                            children: const [
                                                              SizedBox(
                                                                  width: 80,
                                                                  height: 100,
                                                                  child:
                                                                  Image(
                                                                    image: AssetImage(
                                                                        'assets/key.png'),
                                                                  )),
                                                              Text(
                                                                "Key Lockout",
                                                                style: TextStyle(
                                                                    fontSize: 18,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                    fontFamily:
                                                                    'Serif'),
                                                              )
                                                            ],
                                                          )),
                                                    ), // key lockout
                                                    GestureDetector(
                                                      onTap: () => {
                                                        showModalBottomSheet<void>(
                                                          shape: const RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                      30.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                      30.0))),
                                                          context: context,
                                                          builder: (BuildContext
                                                          context) =>
                                                              SizedBox(
                                                                height: 200,
                                                                child: Container(
                                                                  padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 15,
                                                                      right: 20,
                                                                      left: 20),
                                                                  child: Column(
                                                                    children: [
                                                                      Container(
                                                                        alignment:
                                                                        Alignment
                                                                            .topLeft,
                                                                        child:
                                                                        BackButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(
                                                                                context);
                                                                          },
                                                                        ),
                                                                      ), //back button
                                                                      const Text(
                                                                          'Tire Change For Provider',
                                                                          style: TextStyle(
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontFamily: 'Serif')),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                        )
                                                      },
                                                      child: Card(
                                                          shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  20.0)),
                                                          color: Colors.white70,
                                                          child: Column(
                                                            children: const [
                                                              SizedBox(
                                                                  width: 80,
                                                                  height: 100,
                                                                  child: Image(
                                                                    image: AssetImage(
                                                                        'assets/tire.png'),
                                                                  )),
                                                              Text(
                                                                "Tire Change",
                                                                style: TextStyle(
                                                                    fontSize: 18,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                    fontFamily:
                                                                    'Serif'),
                                                              )
                                                            ],
                                                          )),
                                                    ), //Tire Change
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
