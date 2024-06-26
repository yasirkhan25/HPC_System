import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/color/color.dart';
import 'all_complaints_provider.dart';
import 'complaints_detail.dart';

class ApprovedComplaints extends StatelessWidget {
  int? currentIndex;

  ApprovedComplaints({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AllComplaintProvider>(builder: (context, model, child) {
      Size size = MediaQuery.of(context).size;
      return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Approved Complaints",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              backgroundColor: const Color.fromRGBO(31, 79, 143, 1.0),
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.white)),
            ),
            body: model.approvedComplaints.length != 0
                ? SizedBox(
                    height: size.height,
                    child: ListView.builder(
                      itemCount: model.approvedComplaints.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: InkWell(
                            onTap: () {
                              currentIndex = index;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ApprovedComplaintsDetail(
                                        ComplaintsIndex: currentIndex,
                                      ),
                                ),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 0.5, color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 3,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 20),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${model.approvedComplaints[index].complaintTitle}",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Posted Date: ",
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Text(
                                                  "${model.dataFormate(model.approvedComplaints[index].createdAt.toString())}",
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              "Complaint Approved",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Container(
                    height: size.height,
                    width: size.width,
                    child: Center(
                        child: Text(
                      "No Complaints...\n\n\n\n\n\n",
                      style: TextStyle(fontSize: 16, color: PrimaryColor),
                    )))),
      );
    });
  }
}
