part of '../screens.dart';

class HistoryDoctorScreen extends StatefulWidget {
  const HistoryDoctorScreen({super.key});

  @override
  State<HistoryDoctorScreen> createState() => _HistoryDoctorScreenState();
}

class _HistoryDoctorScreenState extends State<HistoryDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Patients", style: darkTextFont),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return SearchPatients();
                },
              );
            },
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
      ),
      // body: EmptySection(
      //   title: "Patient Empty",
      //   content: "There is no patient data in the application yet",
      // ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HospitalPatient(),
                ),
              );
            },
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 2.5, horizontal: 20),
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(50 / 2),
                ),
              ),
              title: Text("User Name"),
              subtitle: Text("User Condition"),
            ),
          );
        },
      ),
    );
  }
}

class SearchPatients extends StatelessWidget {
  const SearchPatients({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SearchBar(),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 2.5, horizontal: 20),
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(50 / 2),
                    ),
                  ),
                  title: Text("User Name"),
                  subtitle: Text("User Condition"),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 4,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Color(0xffF2F4F5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.grey),
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(fontSize: 17),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
