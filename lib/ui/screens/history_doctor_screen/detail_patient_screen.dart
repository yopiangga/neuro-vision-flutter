part of '../screens.dart';

class DetailPatient extends StatelessWidget {
  DetailPatient({super.key, required this.data});

  Promise data;

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                data.image_scan != ""
                    ? Container(
                        width: double.infinity,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey[700],
                          image: DecorationImage(
                            image: NetworkImage(data.image_scan),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(
                        width: double.infinity,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey[500],
                        ),
                        child: Center(
                          child: Text(
                            "No Image",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                IconButton(
                  padding: EdgeInsets.only(
                    left: 20,
                    top: 50,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            OutputStroke(promise: data),
            Divider(),
            DownloadOutput(image_path: data.image_scan),
            Divider(),
            NotePromise(data: data),
            SizedBox(height: 20),
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
