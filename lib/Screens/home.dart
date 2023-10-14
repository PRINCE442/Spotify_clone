import 'package:flutter/material.dart';
import 'package:spotify_clone/Widgets/album_card.dart';
import 'package:spotify_clone/Widgets/song_card.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .6,
            decoration: const BoxDecoration(
              color: Color(0xFf1C7A74),
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(.9),
                    Colors.black.withOpacity(1),
                    Colors.black.withOpacity(1),
                    Colors.black.withOpacity(1),
                  ])),
              child: SafeArea(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recently Played',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const Row(
                          children: [
                            Icon(Icons.history),
                            SizedBox(
                              width: 16,
                            ),
                            Icon(Icons.settings),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        AlbumCard(
                          image: AssetImage('asset/images/Timeless.jpg'),
                          label: 'Timeless',
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        AlbumCard(
                          image: AssetImage('asset/images/Clb.png'),
                          label: 'Certified lover boy',
                          // ontap: () {}
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        AlbumCard(
                          image: AssetImage('asset/images/Getlayed.jpg'),
                          label: 'Get Layed',
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        AlbumCard(
                          image: AssetImage('asset/images/Twice.jpg'),
                          label: 'Twice as tall',
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        AlbumCard(
                          image: AssetImage('asset/images/Rave.jpeg'),
                          label: 'Rave & Roses',
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        AlbumCard(
                          image: AssetImage('asset/images/Morelove.png'),
                          label: 'Rave & Roses',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Good Evening',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        const Row(
                          children: [
                            RowAlbumCard(
                                image: AssetImage('asset/images/Barbie.png'),
                                label: 'Barbie World'),
                            SizedBox(
                              width: 16,
                            ),
                            RowAlbumCard(
                                image: AssetImage('asset/images/Eminem.jpg'),
                                label: 'Business'),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Row(
                          children: [
                            RowAlbumCard(
                                image: AssetImage('asset/images/Asake.jpeg'),
                                label: 'Dull'),
                            SizedBox(
                              width: 16,
                            ),
                            RowAlbumCard(
                                image: AssetImage('asset/images/Adele.png'),
                                label: 'Hello'),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Row(
                          children: [
                            RowAlbumCard(
                                image: AssetImage('asset/images/Culture.png'),
                                label: 'Stir Fry'),
                            SizedBox(
                              width: 16,
                            ),
                            RowAlbumCard(
                                image: AssetImage('asset/images/Travis.jpg'),
                                label: 'STARGAZING'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Based on your recent listening",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          children: [
                            SongCard(
                                image: AssetImage('asset/images/Rave.jpeg')),
                            SongCard(
                                image: AssetImage('asset/images/Eminem.jpg')),
                            SongCard(
                                image: AssetImage('asset/images/Timeless.jpg')),
                            SongCard(
                                image: AssetImage('asset/images/Travis.jpg')),
                            SongCard(
                                image: AssetImage('asset/images/Barbie.png')),
                            SongCard(
                                image: AssetImage('asset/images/Getlayed.jpg')),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Recommended radio",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          children: [
                            SongCard(
                              image: AssetImage("asset/images/Asake.jpeg"),
                            ),
                            SizedBox(width: 16),
                            SongCard(
                              image: AssetImage("asset/images/Morelove.png"),
                            ),
                            SizedBox(width: 16),
                            SongCard(
                              image: AssetImage("asset/images/Rave.jpeg"),
                            ),
                            SizedBox(width: 16),
                            SongCard(
                              image: AssetImage("asset/images/Clb.png"),
                            ),
                            SizedBox(width: 16),
                            SongCard(
                              image: AssetImage("asset/images/Eminem.jpg"),
                            ),
                            SizedBox(width: 16),
                            SongCard(
                              image: AssetImage("asset/images/Adele.png"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              )),
            ),
          )
        ],
      ),
    );
  }
}

class RowAlbumCard extends StatelessWidget {
  const RowAlbumCard({super.key, required this.image, required this.label});
  final String label;
  final AssetImage image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(4),
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Image(
              image: image,
              height: 48,
              width: 48,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 8),
            Text(label)
          ],
        ),
      ),
    );
  }
}
