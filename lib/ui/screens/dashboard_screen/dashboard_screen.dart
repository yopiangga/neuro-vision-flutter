part of '../screens.dart';

class DashboardUserScreen extends StatefulWidget {
  const DashboardUserScreen({super.key});

  @override
  State<DashboardUserScreen> createState() => _DashboardUserScreenState();
}

class _DashboardUserScreenState extends State<DashboardUserScreen> {
  int _selectedIndex = 0;
  HospitalService hospitalService = HospitalService();

  Position? currentPosition;

  @override
  void initState() {
    super.initState();
    initial();
  }

  Future<void> initial() async {
    currentPosition = await Helper.determinePosition();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.map_outlined),
        onPressed: () => Navigator.pushNamed(context, '/patient/hospital-map'),
      ),
      body: Builder(
        builder: (context) {
          if (currentPosition == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return FutureBuilder(
              future: hospitalService.getAllHospital(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator()
                  );
                }
                if (!snapshot.hasData) {
                  return Center(child: Text("Data not found"));
                } else {
                  List<Hospital> hospitals = snapshot.data as List<Hospital>;

                  hospitals = Helper().sortPositionsByFewestDirections(currentPosition!, hospitals).reversed.toList();
                  return Padding(
                    padding: EdgeInsets.only(top: paddingTop),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TopBarWidget(),
                          Divider(),
                          // _buildButtonQuery(),

                          //================================================================ Banner =================================================================
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return DetailScreen(
                                      data: hospitals[0],
                                    );
                                  },
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 180,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      image: DecorationImage(
                                        image: NetworkImage(hospitals[0].image[0]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    hospitals[0].name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    hospitals[0].address,
                                    style: TextStyle(
                                      color: CustomColor.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "${hospitals[0].service_hours} | ${hospitals[0].telephone} (Emergency Call)",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: CustomColor.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //================================================================ end of Banner =================================================================

                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: hospitals.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding:
                                EdgeInsets.only(left: 20, right: 20, bottom: 30),
                                width: double.infinity,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return DetailScreen(
                                            data: hospitals[index],
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 70,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                hospitals[index].image[0]),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              hospitals[index].name,
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              // overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              hospitals[index].address,
                                              style: TextStyle(
                                                color: CustomColor.grey,
                                                fontSize: 13,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              "Rp. ${hospitals[index].price}",
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: CustomColor.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }

  // Widget _buildButtonQuery() {
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     child: Row(
  //       children: [
  //         SizedBox(
  //           width: 20,
  //         ),
  //         InkWell(
  //           onTap: () {
  //             setState(() {
  //               _selectedIndex = 0;
  //             });
  //           },
  //           child: ButtonQuery(
  //             index: 0,
  //             selectedIndex: _selectedIndex,
  //             title: "Nearest",
  //           ),
  //         ),
  //         SizedBox(
  //           width: 10,
  //         ),
  //         InkWell(
  //           onTap: () {
  //             setState(() {
  //               _selectedIndex = 1;
  //             });
  //           },
  //           child: ButtonQuery(
  //             index: 1,
  //             selectedIndex: _selectedIndex,
  //             title: "Surabaya",
  //           ),
  //         ),
  //         SizedBox(
  //           width: 10,
  //         ),
  //         InkWell(
  //           onTap: () {
  //             setState(() {
  //               _selectedIndex = 2;
  //             });
  //           },
  //           child: ButtonQuery(
  //             index: 2,
  //             selectedIndex: _selectedIndex,
  //             title: "Sidoarjo",
  //           ),
  //         ),
  //         SizedBox(
  //           width: 10,
  //         ),
  //         InkWell(
  //           onTap: () {
  //             setState(() {
  //               _selectedIndex = 3;
  //             });
  //           },
  //           child: ButtonQuery(
  //             index: 3,
  //             selectedIndex: _selectedIndex,
  //             title: "Gresik",
  //           ),
  //         ),
  //         SizedBox(
  //           width: 10,
  //         ),
  //         InkWell(
  //           onTap: () {
  //             setState(() {
  //               _selectedIndex = 4;
  //             });
  //           },
  //           child: ButtonQuery(
  //             index: 4,
  //             selectedIndex: _selectedIndex,
  //             title: "Mojokerto",
  //           ),
  //         ),
  //         SizedBox(
  //           width: 10,
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good morning",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                DateFormat('EEEE, d MMMM yyyy').format(DateTime.now()),
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(
                Icons.sunny,
                color: Colors.amber,
              ),
              SizedBox(height: 5),
              Text(
                "Surabaya",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
