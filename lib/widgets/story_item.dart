import 'package:flutter/material.dart';

class StoryItemWidget extends StatelessWidget {
  const StoryItemWidget({
    super.key,
    required this.name,
    required this.image,
  });

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(image),
            ),
          ],
        ),
        SizedBox(width: 10,),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name ,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
        )

      ],
    );
  }
}


// Widget buildChatItem() {
//   // horizontal list view
//   return Row(
//     children: [
//       CircleAvatar(
//         radius: 30.0,
//         backgroundImage: AssetImage('assets/images/image2.png'),
//       ),
//       SizedBox(height: 10),
//       Expanded(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Name", style: TextStyle(fontWeight: FontWeight.bold)),
//             Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     "descriptionmmmmmmmmmmmmmmmmmmmmmmmmmmmm",
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   child: Container(
//                     width: 7,
//                     height: 7,
//                     decoration: BoxDecoration(
//                       color: Colors.blue,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),
//                 Text("#price egy"),
//               ],
//             ),
//           ],
//         ),
//       ),
//     ],
//   );
// } // full row
//
// Widget buildStoryItem() {
//   return Container(
//     width: 50,
//     child: Column(
//       children: [
//         CircleAvatar(
//           radius: 30.0,
//           backgroundImage: AssetImage('assets/images/image2.png'),
//         ),
//         SizedBox(height: 6),
//         Text("Shoes", maxLines: 1, overflow: TextOverflow.ellipsis),
//       ],
//     ),
//   );
// } // circular image + text
// }

