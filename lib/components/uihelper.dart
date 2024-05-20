import 'package:flutter/material.dart';

class UiHelper {
  static Widget customTextField(TextEditingController controller, String text,
      IconData iconData, bool toHide,
      {TextInputType keyboard = TextInputType.name}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: TextField(
        keyboardType: keyboard,
        controller: controller,
        obscureText: toHide,
        style: const TextStyle(
          color: Color.fromRGBO(31, 79, 143, 1.0),
        ),
        cursorColor: const Color.fromRGBO(31, 79, 143, 1.0),
        decoration: InputDecoration(
          
          hintText: text,
          hintStyle: const TextStyle(color: Color.fromRGBO(31, 79, 143, 1.0)),
          prefixIcon: Icon(
            iconData,
            color: const Color.fromRGBO(31, 79, 143, 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: Color.fromRGBO(31, 79, 143, 1.0),
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: Color.fromRGBO(31, 79, 143, 1.0),
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }

  static customButton(VoidCallback voidCallback, String text) {
    return SizedBox(
      // width: 300,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            voidCallback();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(31, 79, 143, 1.0),
              elevation: 3,
              shadowColor: const Color.fromRGBO(31, 79, 143, 1.0)),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          )),
    );
  }
}
