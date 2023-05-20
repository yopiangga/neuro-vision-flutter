part of '../screens.dart';

class DetailHistoryPromise extends StatelessWidget {
  DetailHistoryPromise({super.key, required this.data});

  var data;

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: paddingTop + 10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              padding: EdgeInsets.only(left: 20),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            OutputStroke(),
            Divider(),
            DownloadOutput(),
            Divider(),
            NotePromise(data: data),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: LergeButton(content: "Back"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotePromise extends StatelessWidget {
  const NotePromise({
    super.key,
    required this.data,
  });

  final data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Doctor"),
              Text("dr. Slamet Sukma Djaja, Sp.PD"),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Place"),
              Text(data.hospitals.name),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Patient"),
              Text(data.name),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Time"),
              Text(data.date + " | " + data.time),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Note"),
              Text(
                "-",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DownloadOutput extends StatelessWidget {
  const DownloadOutput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Text(
              "Download",
              style: TextStyle(
                color: CustomColor.main,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(width: 5),
          Text(
            "image CT Scan result",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class OutputStroke extends StatelessWidget {
  OutputStroke({
    super.key,
  });

  bool isUser = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Result CT Scan",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Stroke Ischemic",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "AI Prediction",
            style: TextStyle(
              fontSize: 15,
              color: CustomColor.grey,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Stroke Ischemic",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Diagnosis by Doctor",
                    style: TextStyle(
                      fontSize: 15,
                      color: CustomColor.grey,
                    ),
                  ),
                ],
              ),
              if (!isUser)
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50 / 2),
                      border: Border.all(color: CustomColor.main, width: 1),
                    ),
                    child: Center(
                      child: Text(
                        "Edit",
                        style: TextStyle(color: CustomColor.main),
                      ),
                    ),
                  ),
                )
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
