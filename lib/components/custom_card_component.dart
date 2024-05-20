// import 'package:flutter/material.dart';

// class MyCard extends StatelessWidget {
//   final String imagePath;
//   final String text;
//   final VoidCallback onTap;

//   const MyCard({
//     required this.imagePath,
//     required this.text,
//     required this.onTap,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var mediaquery=MediaQuery.of(context).size;

    
//     return InkWell(
//       onTap: onTap,
//       child: SizedBox(
//         // alignment: Alignment.center,
//         // height: 170,
//         // width: 150,
//         height: mediaquery.height*0.23,
//         width: mediaquery.width*0.37,

//         child: Card(
//           elevation: 6,
//           shadowColor: const Color.fromRGBO(31, 79, 143, 1.0),
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(20)),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 imagePath,
//                 // height: 80,
//                 // width: 80,
//                 height: mediaquery.height*0.1,
//                   width: mediaquery.width*0.2,
//               ),
//               // const SizedBox(
//               //   height: 10,
//               // ),
//               Text(textAlign: TextAlign.center,
//                 text,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Color.fromRGBO(31, 79, 143, 1.0),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onTap;

  const MyCard({
    required this.imagePath,
    required this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: size.height * 0.18,
        width: size.width <= 600 ? size.width * 0.45 : size.width * 0.3, // Adjust width for larger screens
        child: Card(
          elevation: 6,
          shadowColor: const Color.fromRGBO(31, 79, 143, 1.0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                height: size.height * 0.1, // Adjust image height based on card height
                width: size.width * 0.2, // Adjust image width based on card width
              ),
              const SizedBox(height: 8.0),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(31, 79, 143, 1.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
