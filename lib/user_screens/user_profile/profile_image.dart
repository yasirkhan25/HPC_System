import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  File? selectedImage;
  String userName = '';
  String phoneNumber = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? 'User Name';
      phoneNumber = prefs.getString('phoneNumber') ?? 'Phone Number';
      String? imagePath = prefs.getString('userImage');
      if (imagePath != null) {
        selectedImage = File(imagePath);
      }
    });
  }

  Future<void> _saveUserImage(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userImage', path);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          backgroundColor: const Color.fromRGBO(31, 79, 143, 1.0),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: ClipOval(
                      child: selectedImage != null
                          ? Image.file(selectedImage!, fit: BoxFit.cover)
                          : Image.asset(
                        "asset/person.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: () {
                        showImagePickerOption(context);
                      },
                      icon: const Icon(Icons.add_a_photo,color: Colors.black,),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Name: ",
                    style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),
                  ),
                  Text(
                    userName,
                    style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Phone: ",
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
                  ),
                  Text(
                    phoneNumber,
                    style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 200,)
            ],
          ),
        ),
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: const Color.fromRGBO(31, 79, 143, 1.0),
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
                          Icon(Icons.image, size: 70),
                          Text("Gallery"),
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
                          Icon(Icons.camera_alt, size: 70),
                          Text("Camera"),
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
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
      _saveUserImage(pickedImage.path);
    }
  }

  Future<void> _pickImageFromCamera() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
      _saveUserImage(pickedImage.path);
    }
  }
}
