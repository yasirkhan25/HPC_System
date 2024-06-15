import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/color/color.dart';
import 'all_complaints_provider.dart';

class ApprovedComplaintsDetail extends StatelessWidget {
  final ComplaintsIndex;
  const ApprovedComplaintsDetail({
    this.ComplaintsIndex,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<AllComplaintProvider>(builder: (context, model, _) {
        return Container(
          constraints: BoxConstraints.expand(),
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
                  padding: EdgeInsets.all(20.0),
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
                              child: Icon(
                                Icons.clear,
                                color: Colors.white,
                              )),
                        ],
                      ),
                      Text(
                        "HANGU PESCO\nCOMPLAINT DETAIL",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
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
                    physics: const BouncingScrollPhysics(),
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
                              width: size.width / 1.5,
                              child: Column(
                                children: [
                                  Text(
                                    "${model.approvedComplaints[ComplaintsIndex].complaintTitle}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Posted Date:   ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            "Complaint Location:   ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            "Complaint by:   ",
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${model.dataFormate(model.approvedComplaints[ComplaintsIndex].createdAt.toString())}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            "${model.approvedComplaints[ComplaintsIndex].complaintLocation}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            "${model.approvedComplaints[ComplaintsIndex].userName}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            "${model.approvedComplaints[ComplaintsIndex].userPhoneNo}",
                                            style: TextStyle(
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
                          SizedBox(
                            height: 20,
                          ),
                          complaintDescription(
                            complaintDes:
                                "${model.approvedComplaints[ComplaintsIndex].complaintDescription}",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Complaint Image",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          model.approvedComplaints[ComplaintsIndex]
                                      .complaintImage !=
                                  null
                              ? Container(
                                  height: 200,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.grey),
                                    image: DecorationImage(
                                        image: NetworkImage(model
                                            .approvedComplaints[ComplaintsIndex]
                                            .complaintImage
                                            .toString()) as ImageProvider,
                                        fit: BoxFit.fitWidth),
                                  ),
                                )
                              : Row(
                                  children: [
                                    Icon(
                                      Icons.image_outlined,
                                      size: 20,
                                    ),
                                    Text("  Image not uploaded"),
                                  ],
                                ),
                          SizedBox(height: 10),
                          Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Feedback ",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.feedback_outlined,
                                    size: 20,
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                "${model.approvedComplaints[ComplaintsIndex].feedBack ?? 'no feedback'}",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
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
                  child: Image.asset(
                    "asset/logo.png",
                    height: 90,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class PendingComplaintsDetail extends StatelessWidget {
  final ComplaintsIndex;
  const PendingComplaintsDetail({
    this.ComplaintsIndex,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<AllComplaintProvider>(builder: (context, model, _) {
        return Container(
          constraints: BoxConstraints.expand(),
          child: Stack(
            children: <Widget>[
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(color: PrimaryColor),
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
                              child: Icon(
                                Icons.clear,
                                color: Colors.white,
                              )),
                        ],
                      ),
                      Text(
                        "HANGU PESCO\nCOMPLAINT DETAIL",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
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
                    borderRadius: BorderRadius.only(
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
                          SizedBox(
                            height: 40,
                          ),
                          Center(
                            child: Container(
                              width: size.width / 1.5,
                              child: Column(
                                children: [
                                  Text(
                                    "${model.pendingComplaints[ComplaintsIndex].complaintTitle}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Posted Date:   ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            "Complaint Location:   ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            "Complaint by:   ",
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${model.dataFormate(model.pendingComplaints[ComplaintsIndex].createdAt.toString())}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            "${model.pendingComplaints[ComplaintsIndex].complaintLocation}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            "${model.pendingComplaints[ComplaintsIndex].userName}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            "${model.pendingComplaints[ComplaintsIndex].userPhoneNo}",
                                            style: TextStyle(
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
                          SizedBox(
                            height: 20,
                          ),
                          complaintDescription(
                            complaintDes:
                                "${model.pendingComplaints[ComplaintsIndex].complaintDescription}",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Complaint Image",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          model.pendingComplaints[ComplaintsIndex]
                                      .complaintImage !=
                                  null
                              ? Container(
                                  height: 200,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.grey),
                                    image: DecorationImage(
                                        image: NetworkImage(model
                                            .pendingComplaints[ComplaintsIndex]
                                            .complaintImage
                                            .toString()) as ImageProvider,
                                        fit: BoxFit.fitWidth),
                                  ),
                                )
                              : Container(
                                  height: 200,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.grey),
                                  ),
                                  child: Center(
                                      child:
                                          Text("Image not uploaded  by user!")),
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
                  child: Image.asset(
                    "asset/logo.png",
                    height: 90,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class RejectedComplaintsDetail extends StatelessWidget {
  final ComplaintsIndex;
  const RejectedComplaintsDetail({
    this.ComplaintsIndex,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<AllComplaintProvider>(builder: (context, model, _) {
        return Container(
          constraints: BoxConstraints.expand(),
          child: Stack(
            children: <Widget>[
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(color: PrimaryColor
                    // image: DecorationImage(
                    //     image: model.rejectComplaints[ComplaintsIndex].complaintImage != null
                    //         ? NetworkImage(
                    //         model.rejectComplaints[ComplaintsIndex].complaintImage.toString())
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
                              child: Icon(
                                Icons.clear,
                                color: Colors.white,
                              )),
                        ],
                      ),
                      Text(
                        "HANGU PESCO\nCOMPLAINT DETAIL",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
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
                    borderRadius: BorderRadius.only(
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
                          SizedBox(
                            height: 40,
                          ),
                          Center(
                            child: Container(
                              width: size.width / 1.5,
                              child: Column(
                                children: [
                                  Text(
                                    "${model.urgentPendingComplaints[ComplaintsIndex].complaintTitle}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Posted Date:   ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            "Complaint Location:   ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            "Complaint by:   ",
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${model.dataFormate(model.urgentPendingComplaints[ComplaintsIndex].createdAt.toString())}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            "${model.urgentPendingComplaints[ComplaintsIndex].complaintLocation}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            "${model.urgentPendingComplaints[ComplaintsIndex].userName}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            "${model.urgentPendingComplaints[ComplaintsIndex].userPhoneNo}",
                                            style: TextStyle(
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
                          SizedBox(
                            height: 20,
                          ),
                          complaintDescription(
                            complaintDes:
                                "${model.urgentPendingComplaints[ComplaintsIndex].complaintDescription}",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Complaint Image",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          model.rejectComplaints[ComplaintsIndex]
                                      .complaintImage !=
                                  null
                              ? Container(
                                  height: 200,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.grey),
                                    image: DecorationImage(
                                        image: NetworkImage(model
                                            .urgentPendingComplaints[
                                                ComplaintsIndex]
                                            .complaintImage
                                            .toString()) as ImageProvider,
                                        fit: BoxFit.fitWidth),
                                  ),
                                )
                              : Container(
                                  height: 200,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.grey),
                                  ),
                                  child: Center(
                                      child:
                                          Text("Image not uploaded  by user!")),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.13,
                left: MediaQuery.of(context).size.width * 0.5 - 45,
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "asset/logo.png",
                    height: 90,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class complaintDescription extends StatefulWidget {
  final String complaintDes;

  complaintDescription({required this.complaintDes});

  @override
  _complaintDescriptionState createState() => _complaintDescriptionState();
}

class _complaintDescriptionState extends State<complaintDescription> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Complaint Description",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Text(
            isExpanded
                ? widget.complaintDes
                : _truncateDescription(widget.complaintDes, 3),
            maxLines: isExpanded ? null : 3,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
        if (widget.complaintDes.split('\n').length > 3)
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(
              isExpanded ? 'See less' : 'See more',
              style: TextStyle(
                color: PrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }

  String _truncateDescription(String description, int maxLines) {
    final lines = description.split('\n');
    if (lines.length <= maxLines) {
      return description;
    }
    return lines.sublist(0, maxLines).join('\n');
  }
}
