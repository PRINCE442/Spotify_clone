import 'package:flutter/material.dart';
import 'package:spotify_clone/Widgets/album_card.dart';

class AlbumView extends StatefulWidget {
  const AlbumView({super.key, required this.image});

  final ImageProvider image;

  @override
  State<AlbumView> createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  late ScrollController scrollController;
  double imageSize = 0;
  double initialSize = 240;
  double containerHeight = 500;
  double containerInitialHeight = 500;
  double imageOpacity = 1;
  bool showTopBar = false;

  @override
  void initState() {
    imageSize = initialSize;
    scrollController = ScrollController()
      ..addListener(() {
        imageSize = initialSize - scrollController.offset;
        if (containerHeight < 0) {
          containerHeight = 0;
        }
        imageOpacity = imageSize / initialSize;
        if (scrollController.offset > 224) {
          showTopBar = true;
        } else {
          showTopBar = false;
        }
        print(scrollController.offset);
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cardSize = MediaQuery.of(context).size.width / 2 - 32;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: containerHeight,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          color: Colors.pink,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Opacity(
                opacity: imageOpacity.clamp(0.0, 1.0),
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(0, 20),
                      blurRadius: 32.0,
                      spreadRadius: 16.0,
                    ),
                  ]),
                  child: Image(
                    image: widget.image,
                    width: imageSize,
                    height: imageSize,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.0),
                        Colors.black.withOpacity(1.0),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Column(
                      children: [
                        SizedBox(height: initialSize + 32),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              const Row(
                                children: [
                                  Image(
                                    image: AssetImage('asset/images/logo.png'),
                                    width: 32.0,
                                    height: 32.0,
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Text('Spotify'),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                '1,888,126 likes 5h 3m',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.favorite),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Icon(Icons.more_horiz)
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  color: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
                      const SizedBox(height: 32),
                      Text(
                        "You might also like",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AlbumCard(
                              image: const AssetImage('asset/images/Clb.png'),
                              label: 'Certified Lover Boy',
                              size: cardSize,
                            ),
                            AlbumCard(
                              image:
                                  const AssetImage('asset/images/Goddid.png'),
                              label: 'God Did',
                              size: cardSize,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          child: SizedBox(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              color: showTopBar
                  ? const Color(0xFFC61855).withOpacity(1)
                  : const Color(0xFFC61855).withOpacity(0),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: SafeArea(
                child: SizedBox(
                  height: 40.0,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: 0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.keyboard_arrow_left,
                            size: 38,
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: showTopBar ? 1 : 0,
                        duration: const Duration(milliseconds: 250),
                        child: Text(
                          'Ophealia',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom:
                            80 - containerHeight.clamp(120.0, double.infinity),
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff14D860),
                              ),
                              child: const Icon(
                                Icons.play_arrow,
                                size: 38.0,
                              ),
                            ),
                            Container(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: const Icon(
                                Icons.shuffle,
                                size: 14.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
