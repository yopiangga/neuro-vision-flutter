part of '../screens.dart';

class ScanPromise {
  String name;
  String date;
  String time;
  String status;
  Hospitals hospitals;

  ScanPromise({
    required this.name,
    required this.date,
    required this.time,
    required this.status,
    required this.hospitals,
  });
}

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<ScanPromise> promise = [
    ScanPromise(
      name: "Alfian Prisma Yopiangga",
      date: "April 27, 2023",
      time: "06.00",
      status: "Pending",
      hospitals: hospitals[3],
    ),
    ScanPromise(
      name: "M Roy Farchan",
      date: "April 27, 2023",
      time: "06.00",
      status: "Pending",
      hospitals: hospitals[1],
    ),
    ScanPromise(
      name: "Arga Rafi I.M",
      date: "April 27, 2023",
      time: "06.00",
      status: "Pending",
      hospitals: hospitals[2],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("My Promise", style: darkTextFont),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: promise.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailHistoryPromise(
                    data: promise[index],
                  ),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    width: double.infinity,
                    height: 200,
                    color: Colors.grey[200],
                  ),
                  Text(
                    promise[index].date + " | " + promise[index].time,
                    style: TextStyle(
                      color: CustomColor.main,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          promise[index].hospitals.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Icon(Icons.arrow_outward_rounded),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    promise[index].hospitals.address,
                    style: TextStyle(
                      color: CustomColor.grey,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(34, 108, 78, 255),
                      borderRadius: BorderRadius.circular(50 / 2),
                    ),
                    child: Text(
                      promise[index].status,
                      style: TextStyle(color: CustomColor.main),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class EmptyHistory extends StatelessWidget {
  const EmptyHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/emptyicon.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            "No saved promise",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 300,
            child: Text(
              "Make an appointment with the doctor at the hospital, and I'll keep it here",
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 170,
            height: 50,
            decoration: BoxDecoration(
              color: CustomColor.main,
              borderRadius: BorderRadius.circular(50 / 2),
            ),
            child: Center(
              child: Text("Create New", style: whiteTextFont),
            ),
          ),
        ],
      ),
    );
  }
}
