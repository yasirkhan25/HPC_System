import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../core/color/color.dart';
import '../core/enums/view_state.dart';
import 'all_complaints_provider.dart';
import 'complaints_detail.dart';

class RejectedComplaints extends StatelessWidget {
  int? currentIndex;
  RejectedComplaints({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AllComplaintProvider>(builder: (context, model, child) {
      Size size = MediaQuery.of(context).size;

      // Sort the urgentPendingComplaints list to show "pending" items at the top
      List sortedComplaints = model.urgentPendingComplaints..sort((a, b) {
        if (a.complaintStatus == "pending" && b.complaintStatus != "pending") {
          return -1;
        } else if (a.complaintStatus != "pending" && b.complaintStatus == "pending") {
          return 1;
        } else {
          return 0;
        }
      });

      return SafeArea(
        child: ModalProgressHUD(
          progressIndicator: CircularProgressIndicator(
            color: PrimaryColor,
          ),
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
              appBar: AppBar(
                title: Text(
                  "Emergency Complaints",
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
              body: sortedComplaints.isNotEmpty
                  ? SizedBox(
                height: size.height,
                child: ListView.builder(
                  itemCount: sortedComplaints.length,
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
                                  RejectedComplaintsDetail(
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
                                vertical: 12.0, horizontal: 20),
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
                                          "${sortedComplaints[index].complaintTitle}",
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
                                              "${model.dataFormate(sortedComplaints[index].createdAt.toString())}",
                                              style: TextStyle(
                                                fontSize: 11,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                sortedComplaints[index]
                                    .complaintStatus ==
                                    "approved"
                                    ? Text(
                                  "Complaint Accepted",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                                    : sortedComplaints[index]
                                    .complaintStatus ==
                                    "rejected"
                                    ? Text(
                                  "Complaint Rejected",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                      fontWeight:
                                      FontWeight.bold),
                                )
                                    : Padding(
                                  padding: EdgeInsets.only(
                                      left: size.width * 0.1,
                                      top: 10,
                                      bottom: 5,
                                      right: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () async {
                                            print(
                                                "///////////////");
                                            model.updateUrgentComplaintRequest(
                                                context,
                                                "approved",
                                                model
                                                    .complaintModel,
                                                index);
                                          },
                                          child: Container(
                                            padding: EdgeInsets
                                                .symmetric(
                                                horizontal:
                                                10,
                                                vertical:
                                                10),
                                            decoration: BoxDecoration(
                                                color:
                                                Colors.blue,
                                                borderRadius:
                                                BorderRadius
                                                    .circular(
                                                    5)),
                                            child: Center(
                                                child: Text(
                                                  "Confirm",
                                                  style: TextStyle(
                                                      color: Colors
                                                          .white),
                                                )),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () async {
                                            model.updateUrgentComplaintRequest(
                                                context,
                                                "rejected",
                                                model
                                                    .complaintModel,
                                                index);
                                          },
                                          child: Container(
                                            padding: EdgeInsets
                                                .symmetric(
                                                horizontal:
                                                10,
                                                vertical:
                                                10),
                                            decoration: BoxDecoration(
                                                color: Colors
                                                    .white,
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors
                                                        .grey),
                                                borderRadius:
                                                BorderRadius
                                                    .circular(
                                                    5)),
                                            child: Center(
                                                child: Text(
                                                  "Delete",
                                                  style: TextStyle(
                                                      color: Colors
                                                          .black),
                                                )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
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
        ),
      );
    });
  }
}
