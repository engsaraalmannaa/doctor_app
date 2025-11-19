// import 'package:flutter/material.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// import '../const/const_colors.dart';

// class NotificationCard extends StatefulWidget {
//   @override
//   NotificationCardState createState() => NotificationCardState();
// }

// class NotificationCardState extends State<NotificationCard> with SingleTickerProviderStateMixin {
//   bool isExpanded = false;

//   final String longText =
//       "هذا نص طويل جداً يحتوي على معلومات كثيرة. يتم قصه بالبداية وعرضه كاملاً عند الضغط على زر العين لرؤية التفاصيل كاملة. "
//       "يمكنك الآن قراءة المزيد من التفاصيل بعد توسيع الكارد.";

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:  EdgeInsets.only(
//         right: 1.vmin,
//         left: 5.vmin,
//         top: 1.vmin,
//         bottom: 1.vmin
//       ),
//       child: AnimatedSize(
//         duration: Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//         child: Card(
//           elevation: 4,
//           shape: RoundedRectangleBorder(
//             side: BorderSide(
//               color: ConstColors.darkBlue,
//               width: 0.5,
//             )
//                 ,borderRadius: BorderRadius.circular(5.vmin)
//           ),
//           borderOnForeground:true,
//           color: Colors.white54,
//           child: Padding(
//             padding: EdgeInsets.only(
//               top: 3.vmin,
//                 right:4.vmin,
//               left: 1.vmin
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Text(longText,
//                   maxLines: isExpanded ? null : 3,
//                   overflow: TextOverflow.visible,
//                   softWrap: true,),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: IconButton(
//                       onPressed: () {
//                         setState(() {
//                           isExpanded = !isExpanded;
//                         });
//                       },
//                       icon:
//                       CircleAvatar(
//                         backgroundColor: Colors.white54,
//                         radius: 5.5.vmin,
//                         child: Icon(
//                           isExpanded ? Icons.visibility_off : Icons.visibility,
//                         color: ConstColors.darkBlue,),
//                       )),

//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
