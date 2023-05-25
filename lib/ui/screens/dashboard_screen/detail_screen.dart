part of '../screens.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key, required this.data});
  Hospital data;

  @override
  State<DetailScreen> createState() => _DetailScreenState(data: data);
}

class _DetailScreenState extends State<DetailScreen> {
  _DetailScreenState({required this.data});
  Hospital data;

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BannerImage(paddingTop: paddingTop, data: data),
            TittleHospital(data: data),
            HospitalAddress(data: data),
            Divider(),
            MapButton(data: data),
          ],
        ),
      ),
    );
  }
}

class MapButton extends StatelessWidget {
  MapButton({
    required this.data,
    super.key,
  });

  Hospital data;
  final Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    double lat = double.parse(data.geolocation['latitude']);
    double long = double.parse(data.geolocation['longitude']);
    _setMarkers(data, lat, long);
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            color: Colors.grey[200],
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(lat, long),
                zoom: 15,
              ),
              markers: _markers,
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PromiseScreen(data: data),
                ),
              );
            },
            child: LergeButton(content: "Create Promise"),
          )
        ],
      ),
    );
  }

  void _setMarkers(Hospital data, double lat, double long) {
    _markers.add(
      Marker(
        markerId: MarkerId(data.name),
        position: LatLng(lat, long),
        infoWindow: InfoWindow(
          title: data.name,
          snippet: data.address,
        ),
      ),
    );
  }
}

class HospitalAddress extends StatelessWidget {
  HospitalAddress({
    super.key,
    required this.data,
  });

  Hospital data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${data.service_hours} | ${data.telephone} (Emergency Call)",
            style: TextStyle(color: CustomColor.grey),
          ),
          SizedBox(height: 10),
          Text(
            data.address,
            style: TextStyle(color: CustomColor.grey),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class TittleHospital extends StatelessWidget {
  TittleHospital({
    super.key,
    required this.data,
  });

  Hospital data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 130,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              image: DecorationImage(
                image: NetworkImage(data.image[0]),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  data.name,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    Text(
                      " " + data.rating,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BannerImage extends StatelessWidget {
  BannerImage({
    super.key,
    required this.paddingTop,
    required this.data,
  });

  Hospital data;
  final double paddingTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: paddingTop + 20, left: 20, right: 20),
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey,
        image: DecorationImage(
          image: NetworkImage(data.image[1]),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          Text(
            "Hospital",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
