import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapHospitalScreen extends StatelessWidget {
  const MapHospitalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          _HospitalMap(),
          Positioned(
            bottom: 40,
            left: 0,
            child: _HospitalList()
          ),
          Positioned(
            top: 30,
              left: 20,
              child: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.close)
              ),
          )

        ],
      ),
    );
  }
}

class _HospitalMap extends StatefulWidget {
  const _HospitalMap({Key? key}) : super(key: key);

  @override
  State<_HospitalMap> createState() => _HospitalMapState();
}

class _HospitalMapState extends State<_HospitalMap> {

  final Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    _setMarker(dummyHospital, context);
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: const CameraPosition(
          target: LatLng(-7.282356, 112.7927366),
          zoom: 14.0
      ),
      markers: _markers,
    );

  }

  void _setMarker(List<HospitalModel> list, BuildContext context) {
    for (var e in list) {
      _markers.add(Marker(
          markerId: MarkerId("${e.position!.latitude}"),
          position: LatLng(e.position!.latitude, e.position!.longitude),
          infoWindow: InfoWindow(title: e.price.toString()),
          onTap: null,
      ));
    }
    setState(() {});
  }

}

class _HospitalList extends StatelessWidget {
  const _HospitalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dummyHospital.length,
        itemBuilder: (BuildContext context, int index) {
          return _HospitalListItem(model: dummyHospital[index]);
        },
      ),
    );
  }
}

class _HospitalListItem extends StatelessWidget {
  final HospitalModel model;
  const _HospitalListItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          width: 270,
          height: 260,
          child: Column(
            children: [
              Image.network(model.thumbnail!, height: 160, width:270,fit: BoxFit.cover),
              const SizedBox(height: 4.0),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.address!, style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 14)),
                    const SizedBox(height: 4.0),
                    Text(model.name!, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 16), maxLines: 1,),
                    const SizedBox(height: 4.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(model.price!,style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500)),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow),
                            Text(model.rate.toString(), style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

final dummyHospital = [
  HospitalModel(
      id: '1',
      name: 'RSUD Soedarsono Kota Pasuruan',
      address: 'Kota Pasuruan',
      price: 'Rp. 1000',
      rate: 4.5,
      position: const LatLng(-7.6636086, 112.8971409),
      thumbnail: 'https://awsimages.detik.net.id/community/media/visual/2020/03/27/d912a216-e093-4871-90ad-dc832716c36b_43.jpeg?w=650&q=80'
  ),
  HospitalModel(
      id: '2',
      name: 'Rumah Sakit Umum Daerah Haji Provinsi Jawa Timur',
      address: 'Kota Surabaya',
      price: 'Rp. 2000',
      rate: 4.5,
      position: const LatLng(-7.2606387, 112.7164591),
    thumbnail: 'https://awsimages.detik.net.id/community/media/visual/2020/03/27/d912a216-e093-4871-90ad-dc832716c36b_43.jpeg?w=650&q=80'
  ),
  HospitalModel(
      id: '3',
      name: 'RSUD Soedarsono Kota Pasuruan',
      address: 'Kota Surabaya',
      price: 'Rp. 1000',
      rate: 4.5,
      position: const LatLng(-7.2606387,112.7164592),
    thumbnail: 'https://awsimages.detik.net.id/community/media/visual/2020/03/27/d912a216-e093-4871-90ad-dc832716c36b_43.jpeg?w=650&q=80'
  ),
];

class HospitalModel {
  final String? id;
  final String? name;
  final String? address;
  final String? price;
  final double? rate;
  final LatLng? position;
  final String? thumbnail;

  HospitalModel({this.id, this.name, this.address, this.price, this.rate, this.position, this.thumbnail});
}

