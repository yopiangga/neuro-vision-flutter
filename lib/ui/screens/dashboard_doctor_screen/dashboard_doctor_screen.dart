part of '../screens.dart';

class DashboardDoctorScreen extends StatefulWidget {
  const DashboardDoctorScreen({super.key});

  @override
  State<DashboardDoctorScreen> createState() => _DashboardDoctorScreenState();
}

class _DashboardDoctorScreenState extends State<DashboardDoctorScreen> {
  // int _selectedIndex = 0;
  PatientService patientService = PatientService();

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: FutureBuilder(
          future: patientService.getPatient(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: EdgeInsets.only(top: paddingTop),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TopBarWidget(),
                    Divider(),

                    //================================================================ Banner =================================================================
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xffE7E7FF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Statistical classification of stroke patients",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Total patients",
                            style: TextStyle(fontSize: 10),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "${snapshot.data.length}",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              StrokeType(
                                percentage: "30%",
                                content: "Normal",
                                color: CustomColor.main,
                              ),
                              StrokeType(
                                percentage: "40%",
                                content: "Ischemic",
                                color: Colors.amber,
                              ),
                              StrokeType(
                                percentage: "30%",
                                content: "Hemorrhagic",
                                color: Color(0xffC5341B),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    //================================================================ end of Banner =================================================================

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.7,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total Patient",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "April 24, 2023",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.person_outline, size: 15),
                                        SizedBox(width: 5),
                                        Text(
                                          "2,985",
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 60,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: CustomColor.main,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "+ 12,43%",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
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
  //             title: "Overview",
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
  //             title: "Daily",
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
  //             title: "Weekly",
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
  //             title: "Monthly",
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

class StrokeType extends StatelessWidget {
  const StrokeType({
    super.key,
    required this.color,
    required this.content,
    required this.percentage,
  });

  final Color color;
  final String content;
  final String percentage;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Column(
        children: [
          Text(
            percentage,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Container(
            height: 30,
            color: color,
            child: Center(
              child: Text(
                content,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
