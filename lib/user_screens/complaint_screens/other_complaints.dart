import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../components/custom_textfield.dart';
import '../../components/save_button.dart';
import '../../core/color/color.dart';
import '../../core/enums/view_state.dart';
import 'complaints_provider.dart';

class OtherComplaints extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var mediaquery = MediaQuery.of(context).size;
    return Consumer<ComplaintProvider>(builder: (context, model, child) {
      print("??????????????????? : ${model.userID}");

      return  ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(
          color: PrimaryColor,
        ),
        inAsyncCall: model.state == ViewState.busy,
        child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  "Other Complaint Registration",
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
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Column(
                  children: [
                    Form(
                      key: model.formKey,
                      child: Flexible(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: mediaquery.height * .02),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              elevation: 2,
                              child: DropdownButtonFormField<String>(
                                value: model.selectedComplaint,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                items: model.complaintList.map((String name) {
                                  return DropdownMenuItem<String>(
                                    value: name,
                                    child: Text("  $name",style: Theme.of(context).textTheme.labelMedium,),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                    model.selectedComplaint = newValue!;
                                },
                              ),
                            ),


                              SizedBox(height: mediaquery.height * .02),

                              Row(
                                children: [
                                  const Text(
                                    '*',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('COMPLAINANT NAME',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium),
                                  const Expanded(child: SizedBox()),
                                  Text('شکایت کنندہ کا نام',
                                      style:
                                      Theme.of(context).textTheme.labelMedium)
                                ],
                              ),
                              // 2nd textfield

                              CustomTextField(
                                hintText: "eg:(Muhammmad Saleem)",
                                textInputAction: TextInputAction.next,
                                keyBoardType: TextInputType.name,
                                onChanged: (value) {
                                  model.complaintModel.userName =
                                      value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                },
                              ),
                              SizedBox(height: mediaquery.height * .02),

                              //3rd textfield

                              Row(
                                children: [
                                  const Text(
                                    '*',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'MOBILE NO',
                                    style: Theme.of(context).textTheme.labelMedium,

                                  ),
                                  const Expanded(child: SizedBox()),
                                  Text(
                                    'موبائل فون کانمبر',
                                    style: Theme.of(context).textTheme.labelMedium,

                                  )
                                ],
                              ),

                              CustomTextField(
                                hintText: "eg:03341965302",
                                textInputAction: TextInputAction.next,
                                keyBoardType: TextInputType.phone,
                                onChanged: (value) {
                                  model.complaintModel.userPhoneNo =
                                      value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your phone no.';
                                  }
                                },
                              ),

                              SizedBox(height: mediaquery.height * .02),

                              //4th
                              Row(
                                children: [
                                  const Text(
                                    '*',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    ' PLACE NAME',
                                    style: Theme.of(context).textTheme.labelMedium,

                                  ),
                                  const Expanded(child: SizedBox()),
                                  Text(
                                    'جگہ کا نام',
                                    style: Theme.of(context).textTheme.labelMedium,

                                  )
                                ],
                              ),

                              CustomTextField(
                                hintText: "Alshirawi Mohala",
                                textInputAction: TextInputAction.next,
                                keyBoardType: TextInputType.streetAddress,
                                onChanged: (value) {
                                  model.complaintModel.complaintLocation =
                                      value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your location';
                                  }
                                },
                              ),

                              SizedBox(height: mediaquery.height * .02),

                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    const Text(
                                      '*',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'COMPLAINT DETAILS',
                                      style:
                                      Theme.of(context).textTheme.labelMedium,
                                    ),
                                    const Expanded(child: SizedBox()),
                                    Text(
                                      'شکایت کی تفصیل',
                                      style:
                                      Theme.of(context).textTheme.labelMedium,
                                    )
                                  ],
                                ),
                              ),

                              CustomTextField(
                                hintText: "Complaint Description",
                                textInputAction: TextInputAction.done,
                                keyBoardType: TextInputType.text,
                                maxLine: 5,
                                onChanged: (value) {
                                  model.complaintModel.complaintDescription =
                                      value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter Description';
                                  }
                                },
                              ),

                              SizedBox(height: mediaquery.height * .02),

                              // this is (text headings) for image
                              Row(
                                children: [
                                  const Text(
                                    '*',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'SELECT AN IMAGE',
                                    style:
                                    Theme.of(context).textTheme.labelMedium,
                                  ),
                                  const Expanded(child: SizedBox()),
                                  Text(
                                    'ایک تصویر منتخب کریں۔',
                                    style:
                                    Theme.of(context).textTheme.labelMedium,
                                  )
                                ],
                              ),
                              SizedBox(height: mediaquery.height * .01),

                              GestureDetector(
                                onTap: () {
                                  model.pickImageFromGallery();
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
                                        Text(model.imageFile != null
                                            ? model.imageFile!.path
                                            .split('/')
                                            .last
                                            : 'Upload Complaint Image'),
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
                    Center(
                      child: InkWell(
                        onTap: () {
                          if (model.formKey.currentState!.validate()) {
                            print(">>>>>>>>>>>..1111");
                            print(model.selectedComplaint);
                            model.submitComplaint(context, model.selectedComplaint,);
                          }
                        },
                        child: SaveButton(
                          txt: "Submit",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          ),
      );
      }
    );
  }
}
