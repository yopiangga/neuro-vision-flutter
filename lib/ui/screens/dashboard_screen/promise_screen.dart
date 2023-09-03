part of '../screens.dart';

class PromiseScreen extends StatefulWidget {
  PromiseScreen({required this.data, super.key});
  Hospital data;

  @override
  State<PromiseScreen> createState() => _PromiseScreenState(hospital: data);
}

class _PromiseScreenState extends State<PromiseScreen> {
  _PromiseScreenState({required this.hospital});
  Hospital hospital;

  String selectedDoctor = "";
  String date = "";
  String time = "";
  String? email = "";
  String name = "";
  String placeBirth = "";
  String dateBirth = "";
  String nik = "";

  TextEditingController dateValueController = TextEditingController();
  TextEditingController timeValueController = TextEditingController();
  TextEditingController dateBirthValueController = TextEditingController();

  PromiseService promiseService = PromiseService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email = promiseService.getEmail();
  }

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    List<dynamic> doctors = hospital.doctors;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: paddingTop + 20, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  Text(
                    "Create Promise",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
              SizedBox(height: 30),

              //================================================================ DOCTOR
              // Text(
              //   "Doctor",
              //   style: TextStyle(fontSize: 18),
              // ),
              // SizedBox(height: 10),
              // InputDecorator(
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     contentPadding: EdgeInsets.symmetric(horizontal: 10),
              //     suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
              //   ),
              //   child: DropdownButton(
              //     icon: SizedBox(),
              //     underline: SizedBox(),
              //     value: selectedDoctor.isEmpty ? null : selectedDoctor,
              //     items: doctors.map((doctor) {
              //       return DropdownMenuItem(
              //         value: doctor['fullname'],
              //         child: Text(doctor['fullname']),
              //       );
              //     }).toList(),
              //     onChanged: (value) {
              //       setState(() {
              //         selectedDoctor = value.toString();
              //       });
              //     },
              //   ),
              // ),
              // SizedBox(height: 20),

              //================================================================ DATE & TIME
              // Text(
              //   "Time",
              //   style: TextStyle(fontSize: 18),
              // ),
              // SizedBox(height: 10),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 10),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     border: Border.all(color: Colors.grey),
              //   ),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: TextField(
              //           decoration: InputDecoration(
              //             border: InputBorder.none,
              //             hintText: "Date",
              //           ),
              //           onTap: () async {
              //             DateTime? pickedDate = await showDatePicker(
              //               context: context,
              //               initialDate: DateTime.now(),
              //               firstDate: DateTime.now(),
              //               lastDate: DateTime(2100),
              //             );
              //             if (pickedDate != null) {
              //               setState(() {
              //                 date = pickedDate.toString();
              //                 dateValueController.text = date.substring(0, 10);
              //               });
              //             }
              //           },
              //           controller: dateValueController,
              //         ),
              //       ),
              //       Container(
              //         margin: EdgeInsets.only(right: 10),
              //         height: 30,
              //         width: 1,
              //         color: Colors.grey,
              //       ),
              //       Expanded(
              //         child: TextField(
              //           decoration: InputDecoration(
              //             border: InputBorder.none,
              //             hintText: "  Time",
              //           ),
              //           onTap: () async {
              //             TimeOfDay? pickedTime = await showTimePicker(
              //               context: context,
              //               initialTime: TimeOfDay.now(),
              //             );
              //             if (pickedTime != null) {
              //               setState(() {
              //                 time = pickedTime.toString();
              //                 timeValueController.text = time.substring(10, 15);
              //               });
              //             }
              //           },
              //           controller: timeValueController,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 20),

              //================================================================ EMAIL
              Text(
                "Email",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: InputBorder.none,
                  ),
                  //beri default value
                  controller: TextEditingController(text: email),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),

              //================================================================ NAME
              Text(
                "Name",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Name",
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),

              //================================================================ PLACE/DATE OF BIRTH
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Place of Birth",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.7,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Place of Birth",
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            setState(() {
                              placeBirth = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date of Birth",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.16,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Date",
                          ),
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                            );
                            if (pickedDate != null) {
                              setState(() {
                                dateBirth = pickedDate.toString();
                                dateBirthValueController.text =
                                    dateBirth.substring(0, 10);
                              });
                            }
                          },
                          controller: dateBirthValueController,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),

              //================================================================ NIK
              Text(
                "NIK",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "NIK",
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      nik = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 200),

              //================================================================ BUTTON
              InkWell(
                onTap: () {
                  Patient patient = Patient(
                    email: email!,
                    fullname: name,
                    pob: placeBirth,
                    dob: dateBirthValueController.text,
                    nik: nik,
                  );
                  String time =
                      "${dateValueController.text} ${timeValueController.text}:00";

                  promiseService
                      .createPromise(hospital, patient, time, selectedDoctor)
                      .then((value) {
                    if (value) {
                      print("Promise Created");
                      Navigator.pushReplacementNamed(
                          context, '/promise_success');
                    } else {
                      print("Promise Failed");
                    }
                  });
                },
                child: LergeButton(content: "Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
