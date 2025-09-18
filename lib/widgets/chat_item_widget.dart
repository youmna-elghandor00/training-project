import 'package:flutter/material.dart';

class ChatItemWidget extends StatelessWidget {
  const ChatItemWidget({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.image,
  });

  final String name;
  final String message;
  final String time;
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

                const SizedBox(height: 6),

                Text(
                  message,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),

                const SizedBox(height: 6),

                Text(
                  "\$$time",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                  ),
                ),

                const SizedBox(height: 10),

                //
                // Image.network(
                //   image,
                //   height: 120,
                //   width: 120,
                //   fit: BoxFit.cover,
                // ),
              ],
            )
        )

      ],
    );
  }
}
