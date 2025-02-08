import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_constants.dart';

// class ShimmerWidgets {
//   Widget jobCard() {
//     return SizedBox(
//       height: 237,
//       child: ListView.builder(
//           primary: false,
//           shrinkWrap: true,
//           scrollDirection: Axis.horizontal,
//           itemCount: 2,
//           itemBuilder: (BuildContext context, int index) {
//             return Padding(
//               padding: const EdgeInsets.only(right: 12, bottom: 2),
//               child: Container(
//                 width: 204,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: AppColor.white,
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.grey.withOpacity(.3),
//                         spreadRadius: .1,
//                         blurRadius: .15,
//                         offset: const Offset(0.0, 0.75)),
//                   ],
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(18),
//                   child: ShimmerBase(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                             height: 38,
//                             width: 38,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: Colors.white,
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(6.0),
//                               child: Image.asset(""),
//                             )),
//                         myWidgets.gapH(12),
//                         Container(
//                           height: 18,
//                           color: Colors.white,
//                           width: 150,
//                         ),
//                         myWidgets.gapH12(),
//                         Container(
//                           height: 10,
//                           color: Colors.white,
//                           width: 70,
//                         ),
//                         myWidgets.gapH12(),
//                         Container(
//                           height: 16,
//                           color: Colors.white,
//                           width: 120,
//                         ),
//                         myWidgets.gapH12(),
//                         Container(
//                           height: 20,
//                           color: Colors.white,
//                           width: 140,
//                         ),
//                         myWidgets.gapH12(),
//                         Row(
//                           children: [
//                             Container(
//                               height: 15,
//                               color: Colors.white,
//                               width: 90,
//                             ),
//                             myWidgets.gapW12(),
//                             Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(6),
//                                 color: AppColor.primaryColor,
//                               ),
//                               child: const Center(
//                                 child: Padding(
//                                   padding: EdgeInsets.all(8.0),
//                                   child: Text(
//                                     "Apply",
//                                   ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           }),
//     );
//   }
// }