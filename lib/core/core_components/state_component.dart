// import 'package:flutter/material.dart';
// import '../data_state/data_state.dart';
// import '../data_state/data_status.dart';

// class StateComponent<T> extends StatelessWidget {

//   final DataState<T> state;
//   final Widget Function(BuildContext,T) onSuccess;
//   final Widget Function(BuildContext,String)? onFail;
//   final WidgetBuilder? onLoading;
//   final WidgetBuilder? onInit;

//   const StateComponent({
//     super.key,
//     required this.state,
//     required this.onSuccess,
//     this.onFail,
//     this.onLoading,
//     this.onInit
//   });

//   @override
//   Widget build(BuildContext context) {
//     switch(state.status){
//       case DataStatus.success :
//         return onSuccess(context,state.data!);
//       case DataStatus.fail:
//         return onFail?.call(context,state.message) ?? Center(
//           child: Text(state.message),
//         );
//       case DataStatus.loading:
//         return onLoading?.call(context) ?? const Center(
//           child: CircularProgressIndicator(
//             color: Colors.white,
//             strokeWidth: 5,
//           ),
//         );
//       case DataStatus.init:
//         return onInit?.call(context) ?? const Center(
//           child: CircularProgressIndicator(
//             color: Colors.white,
//             strokeWidth: 5,
//           ),
//         );
//     }
//   }
// }
