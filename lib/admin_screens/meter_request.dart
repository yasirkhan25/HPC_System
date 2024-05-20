import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../core/color/color.dart';
import '../core/enums/view_state.dart';
import 'all_complaints_provider.dart';
import 'complaints_detail.dart';

class GetMeterRequest extends StatelessWidget {
  int? currentIndex;

  GetMeterRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AllComplaintProvider>(
        builder: (context, model, child) {
          Size size = MediaQuery.of(context).size;
          return ModalProgressHUD(
            progressIndicator: CircularProgressIndicator(
              color: PrimaryColor,
            ),
            inAsyncCall: model.state == ViewState.busy,
            child: SafeArea(
              child: Scaffold(
                  appBar: AppBar(
                    title: Text(
                      "Meter Requests",
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
                  body: model.meterRequest.length != 0 ? SizedBox(
                    height: size.height,
                    child: ListView.builder(
                      itemCount: model.meterRequest.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),

                          child: InkWell(
                            onTap: () {
                              currentIndex = index;
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
                                    builder: (context) => MeterRequestDetail(
                                      RequestIndex: currentIndex,),
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
                                padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${model.meterRequest[index].meterTitle}",
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  "Posted Date: ",
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Text(
                                                  "${model.dataFormate(model.meterRequest[index].createdAt.toString())}",
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),

                                        Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,)

                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    // Padding(
                                    //   padding: EdgeInsets.only(left: size.width * 0.1,top: 10,bottom: 5,right: 10),
                                    //   child: Row(
                                    //     children: [
                                    //       Expanded(
                                    //         child: InkWell(
                                    //           onTap: () async {
                                    //             model.updateComplaintRequest(context,"approved",
                                    //                 model.complaintModel,
                                    //                 index);
                                    //
                                    //           },
                                    //           child: Container(
                                    //             padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                    //             decoration: BoxDecoration(
                                    //                 color: Colors.blue,
                                    //                 borderRadius: BorderRadius.circular(5)
                                    //             ),
                                    //             child: Center(child: Text("Confirm",style: TextStyle(color: Colors.white),)),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //       SizedBox(width: 10),
                                    //       Expanded(
                                    //         child: InkWell(
                                    //           onTap: () async {
                                    //             model.updateComplaintRequest(context,"rejected",
                                    //                 model.complaintModel,
                                    //                 index);
                                    //
                                    //           },
                                    //           child: Container(
                                    //             padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                    //             decoration: BoxDecoration(
                                    //                 color: Colors.white,
                                    //                 border: Border.all(width: 0.5,color: Colors.grey),
                                    //                 borderRadius: BorderRadius.circular(5)
                                    //             ),
                                    //             child: Center(child: Text("Delete",style: TextStyle(color: Colors.black),)),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                      : Container(height: size.height,width: size.width,child: Center(child: Text("No Request...\n\n\n\n\n\n",style: TextStyle(fontSize: 16,color: PrimaryColor),)))
              ),
            ),
          );
        }
    );
  }
}



class MeterRequestDetail extends StatelessWidget {
  final RequestIndex;
  const MeterRequestDetail({
    this.RequestIndex,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<AllComplaintProvider>(builder: (context, model, _) {
        return Container(
          constraints: const BoxConstraints.expand(),
          child: Stack(
            children: <Widget>[
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: PrimaryColor,
                  // image: DecorationImage(
                  //     image: model.approvedComplaints[ComplaintsIndex].complaintImage != null
                  //         ? NetworkImage(
                  //         model.approvedComplaints[ComplaintsIndex].complaintImage.toString())
                  //         : AssetImage('assets/pic.png') as ImageProvider,
                  //     fit: BoxFit.fitWidth),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(Icons.clear,color: Colors.white,)
                          ),
                        ],
                      ),
                      const Text("HANGU PESCO\nMETER REQUEST DETAIL",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 150,
                left: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height - 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: SingleChildScrollView(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Center(
                            child: Container(
                              width: size.width/1.5,
                              child: Column(
                                children: [
                                  Text(
                                    "${model.meterRequest[RequestIndex].meterTitle}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),

                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Posted Date:   ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),

                                          Text(
                                            "Location:   ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),

                                          Text(
                                            "Meter Request by:   ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),

                                          Text(
                                            "Phone no:   ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${model.dataFormate(model.meterRequest[RequestIndex].createdAt.toString())}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),

                                          Text(
                                            "${model.meterRequest[RequestIndex].meterLocation}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),

                                          Text(
                                            "${model.meterRequest[RequestIndex].userName}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),

                                          Text(
                                            "${model.meterRequest[RequestIndex].userPhoneNo}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 40,
                          ),
                          complaintDescription(
                            complaintDes:
                            "${model.meterRequest[RequestIndex].meterDescription}",
                          ),

                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              "Payment Receipt Image",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          model.meterRequest[RequestIndex].meterPaymentImage != null
                              ? Center(
                                child: Container(
                                                            height: 300,
                                                            width: size.width/1.8,
                                                            decoration: BoxDecoration(
                                border: Border.all(width: 1,color: Colors.grey),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        model.meterRequest[RequestIndex].meterPaymentImage.toString())
                                    as ImageProvider,
                                    fit: BoxFit.fitWidth),
                                                            ),
                                                          ),
                              ):
                          Center(
                            child: Container(
                              height: 300,
                              width: size.width/1.8,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1,color: Colors.grey),

                              ),
                              child: Center(child: Text("Image not uploaded  by user!")),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: MediaQuery.of(context).size.height *
                    0.13, // Adjust the vertical position as needed
                left: MediaQuery.of(context).size.width * 0.5 - 45,
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset("asset/logo.png",height: 90,),
                ),

              ),
            ],
          ),
        );
      }),
    );
  }
}
