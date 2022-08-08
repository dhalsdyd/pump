import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:firebase_getx_boilerplate/app/core/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:firebase_getx_boilerplate/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();
  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();

  final List<LatLng> locationsList = [
    const LatLng(37.34195769242027, 126.83168100453923),
    const LatLng(37.342455499589924, 126.83009713274917),
    const LatLng(37.34163984380222, 126.82994097805991),
    const LatLng(37.342440830785264, 126.82929591096978),
    const LatLng(37.34329464253305, 126.83410720454255),
    const LatLng(37.340601553769936, 126.82848191121838),
    const LatLng(37.34034970769801, 126.82878717803764),
    const LatLng(37.33994323117728, 126.82808843663354),
    const LatLng(37.33975690111736, 126.83008628466244),
    const LatLng(37.34045575940381, 126.83365076472549),
  ];
  final List<String> titles = [
    "한국디지털미디어고등학교",
    "이마트24   ",
    "하늘미소",
    "와개공원",
    "전기차 충전소",
    "CU",
    "GS25",
    "복지 공원",
    "만남 공원",
    "꽃빛 공원",
  ];

  Set<Marker>? _markers = <Marker>{};
  BitmapDescriptor? myMarker;

  void setMarkerIcon() async {
    myMarker = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(20, 20)),
        'assets/images/placeholder.jpg');
    // myMarker = BitmapDescriptor.fromBytes(
    //     await getBytesFromAsset('assets/images/placeholder.jpg', 20));
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  void generateMarkers() {
    var localMarkers = <Marker>{};
    int i = 0;
    for (var location in locationsList) {
      localMarkers.add(
        Marker(
            markerId: MarkerId("$i"),
            onTap: () {
              //_draggableScrollableController.jumpTo(100);
              _showSheet();
            },
            infoWindow: InfoWindow(title: titles[i]),
            position: LatLng(location.latitude, location.longitude),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen)),
      );
      i++;
    }
    if (mounted) {
      setState(() {
        _markers = localMarkers;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  static const CameraPosition _dimigo = CameraPosition(
    target: LatLng(37.34195769242027, 126.83168100453923),
    zoom: 15.5,
  );

  void _showSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // set this to true
      builder: (_) {
        return DraggableScrollableSheet(
          expand: false,
          controller: _draggableScrollableController,
          initialChildSize: 0.25,
          minChildSize: 0.1,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: const BoxDecoration(
                  color: AppColorTheme.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  )),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            height: 5,
                            width: 100,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("이마트24 안산디지털고점", style: AppTextTheme.bold),
                            Text("경기도 안산시 단원구 와동 96-9번지 1층",
                                style: AppTextTheme.regularSmall),
                            SizedBox(height: 16),
                            Text("현재 거리에서 3분",
                                style: AppTextTheme.semiboldMain),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: FGBPTextButton(
                                radius: 12,
                                text: "지도 닫기",
                                onTap: () {
                                  Get.back();
                                },
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: FGBPTextButton(
                                radius: 12,
                                text: "바코드 인증",
                                onTap: () {
                                  Get.toNamed(Routes.barcodeScan);
                                },
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            GoogleMap(
              markers: _markers!,
              mapType: MapType.terrain,
              initialCameraPosition: _dimigo,
              onMapCreated: (GoogleMapController controller) async {
                generateMarkers();
                // String value = await DefaultAssetBundle.of(context)
                //     .loadString("assets/json/map_desing.json");
                // controller.setMapStyle(value);
                _controller.complete(controller);
              },
            ),
            // DraggableScrollableSheet(
            //   controller: _draggableScrollableController,
            //   initialChildSize: 0.15,
            //   minChildSize: 0.1,
            //   builder:
            //       (BuildContext context, ScrollController scrollController) {
            //     return Container(
            //       decoration: const BoxDecoration(
            //           color: AppColorTheme.white,
            //           borderRadius: BorderRadius.only(
            //             topLeft: Radius.circular(20.0),
            //             topRight: Radius.circular(20.0),
            //           )),
            //       child: SingleChildScrollView(
            //         controller: scrollController,
            //         child: Padding(
            //           padding: const EdgeInsets.all(22.0),
            //           child: Column(
            //               mainAxisSize: MainAxisSize.min,
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Center(
            //                   child: Container(
            //                     decoration: const BoxDecoration(
            //                         color: Colors.black,
            //                         borderRadius:
            //                             BorderRadius.all(Radius.circular(100))),
            //                     height: 5,
            //                     width: 100,
            //                   ),
            //                 ),
            //                 const SizedBox(height: 16),
            //                 Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: const [
            //                     Text("이마트24 안산디지털고점", style: AppTextTheme.bold),
            //                     Text("경기도 안산시 단원구 와동 96-9번지 1층",
            //                         style: AppTextTheme.regularSmall),
            //                     SizedBox(height: 16),
            //                     Text("현재 거리에서 3분",
            //                         style: AppTextTheme.semiboldMain),
            //                   ],
            //                 ),
            //                 const SizedBox(height: 16),
            //                 Row(
            //                   children: [
            //                     Expanded(
            //                       child: FGBPTextButton(
            //                         radius: 12,
            //                         text: "지도 닫기",
            //                         onTap: () {
            //                           Get.back();
            //                         },
            //                       ),
            //                     ),
            //                     const SizedBox(width: 24),
            //                     Expanded(
            //                       child: FGBPTextButton(
            //                         radius: 12,
            //                         text: "바코드 인증",
            //                         onTap: () {
            //                           Get.toNamed(Routes.barcodeScan);
            //                         },
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ]),
            //         ),
            //       ),
            //     );
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
