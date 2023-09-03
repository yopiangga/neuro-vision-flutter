part of '../screens.dart';

class MapHospitalScreen extends StatefulWidget {
  MapHospitalScreen({Key? key}) : super(key: key);

  @override
  State<MapHospitalScreen> createState() => _MapHospitalScreenState();
}

class _MapHospitalScreenState extends State<MapHospitalScreen> {
  final hospitalService = HospitalService();

  Position? currentPosition;

  @override
  void initState() {
    super.initState();
    initial();
  }

  Future<void> initial() async {
    currentPosition = await Helper.determinePosition();
    if (this.mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: hospitalService.getAllHospital(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          List<Hospital> hospitals = snapshot.data as List<Hospital>;

          hospitals = Helper()
              .sortPositionsByFewestDirections(currentPosition!, hospitals)
              .reversed
              .toList();
          return Stack(
            children: [
              _HospitalMap(
                hospital: hospitals,
                currentPosition: currentPosition,
              ),
              Positioned(
                  bottom: 40,
                  left: 0,
                  child: _HospitalList(
                    hospital: hospitals,
                  )),
              Positioned(
                top: 30,
                left: 20,
                child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close)),
              )
            ],
          );
        } else {
          return Text(snapshot.error.toString());
        }
      },
    ));
  }
}

class _HospitalMap extends StatefulWidget {
  final List<Hospital> hospital;
  final Position? currentPosition;
  const _HospitalMap({Key? key, this.currentPosition, required this.hospital})
      : super(key: key);

  @override
  State<_HospitalMap> createState() => _HospitalMapState();
}

class _HospitalMapState extends State<_HospitalMap> {
  final Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    _setMarker(widget.hospital, context);
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
          target: LatLng(widget.currentPosition?.latitude ?? -7.282356,
              widget.currentPosition?.longitude ?? 112.7927366),
          zoom: 14.0),
      markers: _markers,
    );
  }

  void _setMarker(List<Hospital> list, BuildContext context) {
    for (var e in list) {
      _markers.add(Marker(
        markerId: MarkerId("${e.geolocation.latitude}"),
        position: LatLng(e.geolocation.latitude, e.geolocation.longitude),
        infoWindow: InfoWindow(title: e.price.toString()),
        onTap: null,
      ));
    }
    setState(() {});
  }
}

class _HospitalList extends StatelessWidget {
  final List<Hospital> hospital;
  const _HospitalList({Key? key, required this.hospital}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hospital.length,
        itemBuilder: (BuildContext context, int index) {
          return _HospitalListItem(model: hospital[index]);
        },
      ),
    );
  }
}

class _HospitalListItem extends StatefulWidget {
  final Hospital model;
  const _HospitalListItem({Key? key, required this.model}) : super(key: key);

  @override
  State<_HospitalListItem> createState() => _HospitalListItemState();
}

class _HospitalListItemState extends State<_HospitalListItem> {
  Position? currentPosition;
  LatLng? targetLocation;
  double? distance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
    targetLocation = LatLng(
        widget.model.geolocation.latitude, widget.model.geolocation.longitude);
    distance = Helper().calculateDistance(
          currentPosition?.latitude ?? 0,
          currentPosition?.longitude ?? 0,
          targetLocation?.latitude ?? 0,
          targetLocation?.longitude ?? 0,
        ) /
        1000;
  }

  Future<void> initial() async {
    currentPosition = await Helper.determinePosition();
    if (this.mounted) setState(() {});
  }

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
              Image.network(widget.model.image[0]!,
                  height: 160, width: 270, fit: BoxFit.cover),
              const SizedBox(height: 4.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.model.address,
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 14)),
                    const SizedBox(height: 4.0),
                    Text(
                      widget.model.name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      maxLines: 1,
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(distance!.toStringAsFixed(2) + ' km',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
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
      name: 'RSU Haji Surabaya',
      address: 'Kota Pasuruan',
      price: 'Rp. 1000',
      rate: 4.5,
      position: const LatLng(-7.2830854, 112.7771886),
      thumbnail: 'https://rsuhaji.jatimprov.go.id/images/profil/profil.jpg'),
  HospitalModel(
      id: '2',
      name: 'Rumah Sakit Umum Daerah Haji Provinsi Jawa Timur',
      address: 'Kota Surabaya',
      price: 'Rp. 2000',
      rate: 4.5,
      position: const LatLng(-7.2606387, 112.7164591),
      thumbnail:
          'https://awsimages.detik.net.id/community/media/visual/2020/03/27/d912a216-e093-4871-90ad-dc832716c36b_43.jpeg?w=650&q=80'),
  HospitalModel(
      id: '3',
      name: 'RSUD Soedarsono Kota Pasuruan',
      address: 'Kota Surabaya',
      price: 'Rp. 1000',
      rate: 4.5,
      position: const LatLng(-7.2606387, 112.7164592),
      thumbnail:
          'https://awsimages.detik.net.id/community/media/visual/2020/03/27/d912a216-e093-4871-90ad-dc832716c36b_43.jpeg?w=650&q=80'),
];

class HospitalModel {
  final String? id;
  final String? name;
  final String? address;
  final String? price;
  final double? rate;
  final LatLng? position;
  final String? thumbnail;

  HospitalModel(
      {this.id,
      this.name,
      this.address,
      this.price,
      this.rate,
      this.position,
      this.thumbnail});
}
