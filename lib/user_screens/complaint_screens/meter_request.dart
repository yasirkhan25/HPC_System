import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../components/custom_textfield.dart';
import '../../components/save_button.dart';
import '../../core/color/color.dart';
import '../../core/enums/view_state.dart';
import 'complaints_provider.dart';

class MeterRequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Consumer<ComplaintProvider>(
      builder: (context, model, child) {
        return ModalProgressHUD(
          progressIndicator: CircularProgressIndicator(
            color: PrimaryColor,
          ),
          inAsyncCall: model.state == ViewState.busy,
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  "Electricity Meter Request",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                backgroundColor: PrimaryColor,
                centerTitle: true,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Form(
                      key: model.formKey,
                      child: Flexible(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  const Text(
                                    '*',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Please enter the details for your electricity meter request.",
                                      style: Theme.of(context).textTheme.labelMedium,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                // height: 30,
                                height: mediaquery.height * .04,
                              ),

                              //  text writting for other complaints button 3
                              Row(
                                children: [
                                  Text(
                                    "Meter Number",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(31, 79, 143, 1.0)),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Text(
                                    "میٹر نمبر",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(31, 79, 143, 1.0)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                // height: 10,
                                height: mediaquery.height * .01,
                              ),

                              // Meter Number TextField
                              CustomTextField(
                                hintText: "Meter Number",
                                textInputAction: TextInputAction.next,
                                keyBoardType: TextInputType.number,
                                onChanged: (value) {
                                  model.meterRequestModel.meterNo = value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter meter number.';
                                  }
                                },
                              ),

                              SizedBox(
                                // height: 30,
                                height: mediaquery.height * .04,
                              ),

                              //  text writting for other complaints button 3
                              const Row(
                                children: [
                                  Text(
                                    "Applicant Name",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(31, 79, 143, 1.0)),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Text(
                                    " درخواست گزار کا نام",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(31, 79, 143, 1.0)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                // height: 10,
                                height: mediaquery.height * .01,
                              ),

                              // Applicant Name TextField
                              CustomTextField(
                                hintText: "Applicant Name",
                                textInputAction: TextInputAction.next,
                                keyBoardType: TextInputType.name,
                                onChanged: (value) {
                                  model.meterRequestModel.userName = value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter applicant name';
                                  }
                                },
                              ),

                              SizedBox(
                                // height: 30,
                                height: mediaquery.height * .04,
                              ),

                              //  text writting for other complaints button 3
                              const Row(
                                children: [
                                  Text(
                                    "Mobile Number",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(31, 79, 143, 1.0)),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Text(
                                    " موبائل فون کانمبر",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(31, 79, 143, 1.0)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                // height: 10,
                                height: mediaquery.height * .01,
                              ),

                              // Mobile Number TextField
                              CustomTextField(
                                hintText: "Mobile Number",
                                textInputAction: TextInputAction.next,
                                keyBoardType: TextInputType.phone,
                                onChanged: (value) {
                                  model.meterRequestModel.userPhoneNo = value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter mobile number';
                                  }
                                },
                              ),

                              SizedBox(
                                // height: 10,
                                height: mediaquery.height * .01,
                              ),
                              const Row(
                                children: [
                                  Text(
                                    "Applicant Address",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(31, 79, 143, 1.0)),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Text(
                                    " درخواست گزار کا پتہ",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(31, 79, 143, 1.0)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                // height: 10,
                                height: mediaquery.height * .01,
                              ),

                              // Address TextField
                              CustomTextField(
                                hintText: "Applicant Address",
                                textInputAction: TextInputAction.next,
                                keyBoardType: TextInputType.streetAddress,
                                onChanged: (value) {
                                  model.meterRequestModel.meterLocation = value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter address';
                                  }
                                },
                              ),
                              SizedBox(height: mediaquery.height * .02),




                              SizedBox(
                                // height: 10,
                                height: mediaquery.height * .01,
                              ),
                              const Row(
                                children: [
                                  Text(
                                    "Description",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(31, 79, 143, 1.0)),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Text(
                                    " تفصیل",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(31, 79, 143, 1.0)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                // height: 10,
                                height: mediaquery.height * .01,
                              ),
                              // Address TextField
                              CustomTextField(
                                hintText: "Description",
                                textInputAction: TextInputAction.done,
                                keyBoardType: TextInputType.text,
                                maxLine: 5,
                                onChanged: (value) {
                                  model.meterRequestModel.meterDescription = value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter description';
                                  }
                                },
                              ),

                              SizedBox(height: mediaquery.height * .02),
                              GestureDetector(
                                onTap: () {
                                  model.pickPaymentImageFromGallery();
                                },
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
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
                                        horizontal: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(model.receiptImageFile != null
                                            ? model.receiptImageFile!.path
                                            .split('/')
                                            .last
                                            : 'Upload Payment receipt'),
                                        Icon(
                                          Icons.upload,
                                          color: PrimaryColor,
                                          size: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: mediaquery.height * .03),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Submit Button
                    Center(
                      child: InkWell(
                        onTap: () {
                          if (model.formKey.currentState!.validate()) {
                            print(">>>>>>>>>>>..1111");
                            model.submitMeterRequest(context);
                          }
                        },
                        child: SaveButton(
                          txt: "Submit",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
