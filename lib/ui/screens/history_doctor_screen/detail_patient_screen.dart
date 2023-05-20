part of '../screens.dart';

class DetailPatient extends StatelessWidget {
  DetailPatient({super.key, required this.data});

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
              padding: EdgeInsets.all(20),
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
