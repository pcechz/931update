// import 'package:creditswitch/utils/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:form_validator/form_validator.dart';

// Widget _entryField(BuildContext context, String title, TextEditingController _controller,
//       {bool isPassword = false, bool hidePassword = false}) {
//     return Container(
//       margin: EdgeInsets.fromLTRB(0, 0, 35.0, 0),
//       height: 71,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             title,
//             style: TextStyle(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 11,
//                 color: fa_color_primary),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           TextFormField(
//             obscureText: isPassword && hidePassword,
//             obscuringCharacter: "*",
//             controller: _controller,
//             validator: ValidationBuilder().minLength(5).maxLength(50).build(),
//             style: TextStyle(color: Color.fromRGBO(299, 299, 299, 1)),
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               fillColor: Colors.grey[50],
//               filled: true,
//               suffixIcon: isPassword
//                   ? IconButton(
//                       onPressed: () {
//                           hidePassword = !hidePassword;
                        
//                       },
//                       color: Color.fromRGBO(299, 299, 299, 1),
//                       icon: Icon(hidePassword
//                           ? Icons.visibility_off
//                           : Icons.visibility),
//                     )
//                   : Visibility(
//                       child:
//                           IconButton(onPressed: () {}, icon: Icon(Icons.clear)),
//                       visible: false,
//                     ),
//             ),
//           )
//         ],
//       ),
//     );
//   }