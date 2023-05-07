part of '../screens.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key, required this.data});
  var data;

  @override
  State<DetailScreen> createState() => _DetailScreenState(data: data);
}

class _DetailScreenState extends State<DetailScreen> {
  _DetailScreenState({required this.data});
  var data;

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BannerImage(paddingTop: paddingTop),
          TittleHospital(data: data),
          HospitalAddress(data: data),
          Divider(),
          MapButton(),
        ],
      ),
    );
  }
}

class MapButton extends StatelessWidget {
  const MapButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            color: Colors.grey[200],
          ),
          SizedBox(height: 15),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PromiseScreen(),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: CustomColor.main,
                borderRadius: BorderRadius.circular(50 / 2),
              ),
              child: Center(
                child: Text(
                  "Create promise",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HospitalAddress extends StatelessWidget {
  const HospitalAddress({
    super.key,
    required this.data,
  });

  final data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.info,
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

  var data;

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
            color: Colors.grey[200],
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
  const BannerImage({
    super.key,
    required this.paddingTop,
  });

  final double paddingTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: paddingTop + 20, left: 20, right: 20),
      height: 250,
      width: double.infinity,
      color: Colors.grey,
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
