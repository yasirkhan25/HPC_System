import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/color/color.dart';
import '../../complaint_screens/complaints_provider.dart';
import 'my_complaints_detail.dart';

class MyComplaints extends StatelessWidget {
  int? currentIndex;

  MyComplaints({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ComplaintProvider>(
        builder: (context, model, child) {
          Size size = MediaQuery.of(context).size;
          return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                "My Complaints",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              backgroundColor: PrimaryColor,
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.white)),
            ),
            body: model.isLoading? Container(
              height: size.height,
              width: size.width,
              child: Center(
                child: CircularProgressIndicator(
                  color: PrimaryColor,
                ),
              ),
            ): model.complaintRequests.isNotEmpty? Container(
              height: double.infinity,
              width: double.infinity,
              padding: EdgeInsets.only(top: 10),
              child: ListView.builder(
                itemCount: model.complaintRequests.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            );
                          },
                        );
                        Future.delayed(Duration(seconds: 1), () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MyComplaintsDetail(
                                    complaintsIndex: index,
                                  ),
                            ),
                          );
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 0.5,color: Colors.grey),
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
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Row(
                                children: [

                                  SizedBox(
                                    width: 12,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${model.complaintRequests[index].complaintTitle}",
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
                                            "Complaint Date: ",
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            "${model.dataFormate(model.complaintRequests[index].createdAt.toString())}",
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
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
                : Container(height: size.height,width: size.width,child: Center(child: Text("No Complaints...\n\n\n\n\n\n",style: TextStyle(fontSize: 16,color: PrimaryColor),)))

          ),
                    );
      }
    );
    ;
  }
}
