import 'package:flutter/material.dart';
import 'package:spotify_clone/Screens/album_view.dart';

class AlbumCard extends StatelessWidget {
  const AlbumCard(
      {super.key,
      required this.image,
      required this.label,
      // required this.ontap,
      this.size = 120});
  final ImageProvider image;
  final String label;
  //final Function ontap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            (MaterialPageRoute(
                builder: (context) => AlbumView(
                      image: image,
                    ))));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: image,
            width: size,
            height: size,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(label),
        ],
      ),
    );
  }
}
