import 'package:flutter/material.dart';
import 'package:recipe_app/widgets/nav_bar.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  final _fontFamily = 'JosefinSans';

  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      // 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      'https://assets.mixkit.co/videos/preview/mixkit-person-adding-grated-carrot-to-a-recipe-32504-large.mp4',
    );
    // 1- https://assets.mixkit.co/videos/preview/mixkit-top-view-of-woman-making-cookies-from-recipe-on-tablet-15805-large.mp4
    // 2- https://assets.mixkit.co/videos/preview/mixkit-beating-eggs-2691-large.mp4
    // 3- https://assets.mixkit.co/videos/preview/mixkit-keto-diet-meat-and-vegetables-recipe-intro-5621-large.mp4
    // _controller = VideoPlayerController.asset(
    //   'assets/videos/video9.mp4',
    // );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus.unfocus(); //to unfocus textfield
        FocusScope.of(context).requestFocus(FocusNode()); //to hide keyboard
      },
      child: Scaffold(
        bottomNavigationBar: NavBar(),
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, ',
                style: TextStyle(
                  fontFamily: _fontFamily,
                  fontSize: 28,
                  color: Colors.black,
                ),
              ),
              SizedBox(),
              Text(
                'Husna Javed',
                style: TextStyle(
                  fontFamily: _fontFamily,
                  fontSize: 36,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                width: 50,
              ),
            ],
          ),
          actions: [
            Container(
              width: 75,
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/dp3.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Container(
                  height: 45,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      primaryColor: Colors.green,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 2,
                          ),
                        ),
                        hintText: 'Find Recipes',
                        prefixIcon: Icon(
                          Icons.search,
                          size: 35,
                        ),
                        suffixIcon: Icon(
                          Icons.filter_list,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black87.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 12.0,
                            offset: Offset(0, 7),
                          ),
                        ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: FutureBuilder(
                        future: _initializeVideoPlayerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.none &&
                              snapshot.hasData == null) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: FloatingActionButton(
                        shape: CircleBorder(
                          side: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            if (_controller.value.isPlaying) {
                              _controller.pause();
                            } else {
                              _controller.play();
                            }
                          });
                        },
                        child: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              _suggestions('Popular Recipes 😄', _fontFamily),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _recipeCard('Samosa', '30 Min', 'assets/recipes/samosa.jpg',
                        _fontFamily),
                    _recipeCard('Pasta', '40 Min', 'assets/recipes/pasta.jpg',
                        _fontFamily),
                    _recipeCard('Grilled Chicken', '25 Min', 'assets/recipes/grilledChicken.jpg',
                        _fontFamily),
                    _recipeCard('Macroni', '25 Min', 'assets/recipes/macroni.jpg',
                        _fontFamily),
                  ],
                ),
              ),
              _suggestions('Recommended', _fontFamily),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _suggestions(text, _fontFamily) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 15.0,
      vertical: 12.0,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontFamily: _fontFamily,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Text(
              'View All',
              style: TextStyle(
                fontFamily: _fontFamily,
                fontSize: 17,
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.green,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _recipeCard(title, cookTime, imageAddress, _fontFamily) {
  return Container(
    margin: const EdgeInsets.only(left: 15),
    height: 200,
    width: 170,
    child: Card(
      color: Colors.pink[50],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 105,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  imageAddress,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              top: 2.0,
            ),
            child: Text(
              title,
              // textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                fontFamily: _fontFamily,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 12.0),
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                ),
                child: Text(
                  cookTime,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: _fontFamily,
                    fontSize: 17,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 12.0,
                ),
                child: Icon(Icons.bookmark_add_outlined),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
