// this is a COMPONENT of IMAGE selecting for all the complaints screens
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class PickImage extends StatefulWidget {
  const PickImage({
    super.key,
  });

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          selectedImage != null
              ? Image.file(
                  selectedImage!,
                  width: double.infinity,
                  // height: 300, // height of image we selected from Gallery or Camera
                  height: mediaquery.height * .3,
                  fit: BoxFit.fill,
                )
              : Container(
                  width: mediaquery.width * 1,
                  height: mediaquery.height * .28,
                  // width: double.infinity,
                  // height: 200, // height of pictures show initialy on screen
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black.withOpacity(0.1),
                        width: 1.0, // Border width
                      ),
                      color: Colors.black.withOpacity(0.1)),
                  child: const Icon(Icons.image_search,
                      color: Color.fromRGBO(31, 79, 143, 1.0), size: 60),
                ),
          Positioned(
            bottom: -0,
            left: MediaQuery.of(context).size.width * 0.83, //300
            child: IconButton(
              onPressed: () {
                showImagePickerOption(context);
              },
              icon: const Icon(
                Icons.add_a_photo,
                size: 30,
                color: Color.fromRGBO(31, 79, 143, 1.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: const Color.fromARGB(255, 145, 181, 224),
      // backgroundColor: Colors.transparent,
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4.5,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => _pickImageFromGallery(),
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 60,
                            color: Color.fromRGBO(31, 79, 143, 1.0),
                          ),
                          Text(
                            "Gallery",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () => _pickImageFromCamera(),
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 60,
                            color: Color.fromRGBO(31, 79, 143, 1.0),
                          ),
                          Text(
                            "Camera",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }
  }

  Future<void> _pickImageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }
  }
}
