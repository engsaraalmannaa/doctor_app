// import 'package:doctor_program/modules/pationts/data/model/consultations_model.dart';
// import 'package:doctor_program/modules/pationts/presentation/controllers/home/home_controller.dart';
// import 'package:doctor_program/screens/consultation.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// import '../const/const_colors.dart';

// class Container1 extends StatelessWidget {

//   const Container1({super.key, required this.model,required this.index, required this.isReplied});

//   final ConsultationModel model;
//   final int index;
//   final bool isReplied;
//   @override
//   Widget build(BuildContext context) {
//     return  Padding(
//       padding: EdgeInsets.only(
//           right: 1.vmin,
//           left: 5.vmin,
//           top: 1.vmin,
//           bottom: 1.vmin
//       ),
//       child: InkWell(
//         onTap: () {
//           final controller=Get.find<HomeController>();
//           controller.idConsltation=controller.data![index].id.toString();

//           Get.to(() =>
//             Consultation(model: model,)
//           );
//           //DetailsScreen(text: fullText,));
//           // Action
//         },
//         child: Card(
//            color: isReplied ? Colors.green[100] : Colors.white,
//           elevation: 4,
//           shape: RoundedRectangleBorder(
//               side: BorderSide(
//                 color:
//                  isReplied ? Colors.green[100] ?? Colors.green :  Colors.grey.shade100,
              
//                 width: 0.5,
//               )
//               ,borderRadius: BorderRadius.circular(5.vmin)
//           ),
//           borderOnForeground:true,
//           //color: Colors.white54,
//           child: Padding(
//             padding: EdgeInsets.only(
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 ListTile(
//                   title:
//                   Text(model.patient.fatherName,
//                     textDirection: TextDirection.rtl,
//                     style:
//                     TextStyle(color:Colors.indigo)
//                     ,),
//                   subtitle: Text(
//                     model.question,
//                     maxLines: 5,
//                     overflow: TextOverflow.ellipsis,
//                     textAlign: TextAlign.right,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 16.sp,
//                     ),
//                   ),
//                   trailing:
//                   CircleAvatar(
//                     backgroundColor: Colors.white54,
//                     radius: 5.5.vmin,
//                     child: Icon(
//                       Icons.person,
//                       color: Colors.indigo,
//                     ),
//                   ),
//                   ),
//                   if (isReplied)
//                     Padding(
//                           padding: EdgeInsets.only(top: 1.h),
//                           child: Align(
//                             alignment: Alignment.bottomLeft,
//                             child: Row(
//                               children: [
//                                 Text(
//                                   "تم الرد",
//                                   style: TextStyle(
//                                     color: Colors.green.shade800,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 15.sp,
//                                   ),
//                                 ),

//                                  CircleAvatar(
//                     backgroundColor: Colors.white54,
//                     radius: 5.5.vmin,
//                     child: Icon(
//                       Icons.person,
//                       color: Colors.indigo,
//                     ),
//                   ),
//                               ],
//                             ),
//                           ),
//                         ),
//                     ],
//                   ),
//           ))
                  
//   }
// }


 import 'package:doctor_program/modules/pationts/data/model/consultations_model.dart';
import 'package:doctor_program/modules/pationts/presentation/controllers/home/home_controller.dart';
import 'package:doctor_program/screens/consultation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../const/const_colors.dart';

class Container1 extends StatelessWidget {
  const Container1({
    super.key,
    required this.model,
    required this.index,
    required this.isReplied,
  });

  final ConsultationModel model;
  final int index;
  final bool isReplied;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.vmin, vertical: 1.vmin),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: ConstColors.darkBlue,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(5.vmin),
        ),
        borderOnForeground: true,
        color: Colors.white54,
        child: Padding(
          padding: EdgeInsets.all(2.vmin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  "استشارة ${index+1}",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: ConstColors.darkBlue,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                 
                  
                  "${model.createdAt?.split("T").first?? ""}\n""${model.question ?? '-'}",
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
                trailing: CircleAvatar(
                  backgroundColor: ConstColors.darkBlue,
                  child: IconButton(
                    onPressed: () {
                      controller.idConsltation = controller.data![index].id.toString();

                      Get.to(() => Consultation(model: model));
                    },
                    icon: Icon(Icons.remove_red_eye, color: Colors.white),
                  ),
                ),
              ),
              if (isReplied)
                Padding(
                  padding: EdgeInsets.only(right: 2.vmin, bottom: 1.vmin),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "تم الرد",
                      style: TextStyle(
                        color: Colors.green.shade800,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

