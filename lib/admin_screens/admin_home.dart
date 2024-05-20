import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hangu_pesco_complaints_system/admin_screens/pending_compliants.dart';
import 'package:hangu_pesco_complaints_system/admin_screens/rejected_complaints.dart';
import 'package:hangu_pesco_complaints_system/components/custom_card_component.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/color/color.dart';
import '../user_screens/authentication/signin_screen/signin_screen.dart';
import '../user_screens/complaint_screens/meter_request.dart';
import 'approved_complaints.dart';
import 'meter_request.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  void _signOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userID');

    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SigninScreen()),
    );
  }
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Home",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          backgroundColor: const Color.fromRGBO(31, 79, 143, 1.0),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app,color: Colors.white,),
              onPressed: () => _signOut(context),
            ),
          ],
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              // height: 250,
              height: mediaquery.height * .31,

              child: Stack(children: [
                // 1st container
                Container(
                  // height: 100,
                  height: mediaquery.height * .1,

                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(31, 79, 143, 1.0),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 15,
                  right: 15,
                  // 1st container
                  child: Container(
                    // height: 200,
                    height: mediaquery.height * 0.25,

                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Card(
                        elevation: 6,
                        child: Image.asset(
                          "asset/logo.png",
                        )),
                  ),
                )
              ]),
            ),

            const Text(
              "Hangu PESCO Complaints System",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color.fromRGBO(31, 79, 143, 1.0),
              ),
            ),

            //1st row that consists of 2 custom cards/buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyCard(
                  imagePath: "asset/pending_complaints.png",
                  text: "Pending\nComplaints",
                  onTap: () async {
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
                        builder: (context) =>  PendingComplaints(),
                      ),
                    );
                  },
                ),

                // 2nd component for My Complaints
                MyCard(
                  imagePath: "asset/accepted_complaints.png",
                  text: "Accepted\nComplaints",
                  onTap: ()async {
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
                        builder: (context) => ApprovedComplaints(),
                      ),
                    );
                  },
                ),
              ],
            ),

            SizedBox(height: mediaquery.height * .02),

            // 2nd row is started here
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //3rd component for About us
                MyCard(
                  imagePath: "asset/rejected_complaints.png",
                  text: "Emergency\nComplaints!!!",
                  onTap: () async {
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
                        builder: (context) =>  RejectedComplaints(),
                      ),
                    );
                  },
                ),

                MyCard(
                  imagePath: "asset/accepted_complaints.png",
                  text: "Meter\nRequest",
                  onTap: ()async {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const Center(
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
                        builder: (context) => GetMeterRequest(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
