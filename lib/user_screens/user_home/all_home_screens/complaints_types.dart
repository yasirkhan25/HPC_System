import 'package:flutter/material.dart';
import 'package:hangu_pesco_complaints_system/components/uihelper.dart';
import 'package:hangu_pesco_complaints_system/core/color/color.dart';
import 'package:hangu_pesco_complaints_system/user_screens/complaint_screens/bill_complaints.dart';
import 'package:hangu_pesco_complaints_system/user_screens/complaint_screens/theft_complaints.dart';
import 'package:hangu_pesco_complaints_system/user_screens/complaint_screens/other_complaints.dart';

import '../../complaint_screens/meter_request.dart';

class ComplaintsTypes extends StatelessWidget {
  String? userID;
   ComplaintsTypes({super.key,required this.userID});

  @override
  Widget build(BuildContext context) {
    print("User ID on Complaint Type Screen is : $userID");
    var mediaquery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "HPCS",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          backgroundColor: PrimaryColor,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 1 text for  Bottun  bill complaints

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Text(
                      "Post Bill Complaint",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(31, 79, 143, 1.0)),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      "بلوں سے متعلق شکایت",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(31, 79, 143, 1.0)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                // height: 10,
                height: mediaquery.height * .01,
              ),
              //1  button stats here
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  child: UiHelper.customButton(()async {
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

                    await Future.delayed(
                        Duration(seconds: 1));

                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BillComplaint(),
                      ),
                    );
                  }, "Bill Complaint"),
                ),
              ),

              SizedBox(
                // height: 30,
                height: mediaquery.height * .04,
              ),

              // 2 Button"Post theft complaint",

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Text(
                      "Post theft complaint",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(31, 79, 143, 1.0)),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      "بجلی چوری کی شکایت",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(31, 79, 143, 1.0)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                // height: 10,
                height: mediaquery.height * .01,
              ),
              // 2   button starts for theft complaints
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  child: UiHelper.customButton(() async {
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

                    await Future.delayed(
                        Duration(seconds: 1));

                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  TheftComplaint(),
                      ),
                    );
                  }, " Theft Reporting"),
                ),
              ),

              SizedBox(
                // height: 30,
                height: mediaquery.height * .04,
              ),

              //  text writting for other complaints button 3
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Text(
                      "Post other complaints",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(31, 79, 143, 1.0)),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      "    دوسری شکایتیں",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(31, 79, 143, 1.0)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                // height: 10,
                height: mediaquery.height * .01,
              ),

              // 3 buttons starts for Other Complaints
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  child: UiHelper.customButton(() async {
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

                    await Future.delayed(
                        Duration(seconds: 1));

                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  OtherComplaints(),
                      ),
                    );
                  }, "Other Compliant"),
                ),
              )  ,


              SizedBox(
                // height: 30,
                height: mediaquery.height * .04,
              ),

              //  text writting for other complaints button 3
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Text(
                      "Meter Request",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(31, 79, 143, 1.0)),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      "میٹر کی درخواست",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(31, 79, 143, 1.0)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                // height: 10,
                height: mediaquery.height * .01,
              ),
              // 3 buttons starts for Other Complaints
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  child: UiHelper.customButton(() async {
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

                    await Future.delayed(
                        Duration(seconds: 1));

                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  MeterRequest(),
                      ),
                    );
                  }, "Meter Request"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
