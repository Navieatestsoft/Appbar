import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:singlepage/pages/doctor.dart';
import 'package:singlepage/pages/profile.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Custom Layout',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: CustomLayoutPage(),
    );
  }
}
class CustomLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(60),
        child: CustomAppBar(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GridViewScreen(),
              ImageSliderScreen(),
              GridViewScreen2(),

            ],
          ),
        ),
      ),
    );
  }
}
class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _isAnimation = false;
  bool _isBallanceShown = false;
  bool _isBallance = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 60,
        color: Colors.greenAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            logo(),
            const SizedBox(
              width: 80,
            ),
            Row(
              children: [
                InkWell(
                    onTap: changeState,
                    child: Container(
                        width: 170,
                        height: 38,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Stack(alignment: Alignment.center, children: [
                          AnimatedOpacity(
                              opacity: _isBallanceShown ? 1 : 0,
                              duration: const Duration(milliseconds: 500),
                              child: const Text('৳ 100000',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14))),

                          AnimatedOpacity(
                              opacity: _isBallance ? 1 : 0,
                              duration: const Duration(milliseconds: 300),
                              child: const Text('Tap here',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14))),

                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 1100),
                            left: _isAnimation == false ? 5 : 135,
                            curve: Curves.fastOutSlowIn,
                            child: Container(
                              height: 20,
                              width: 20,
                              // padding: const EdgeInsets.only(bottom: 4),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.circular(50)),
                              child: const FittedBox(
                                child: Text('৳',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17)
                                ),
                              ),
                            ),
                          ),
                        ])
                    )
                ),
              ],
            ),
          ],
        ),

      ),
    );
  }
  logo() =>
      SizedBox(width: 45, child: Image.asset('asset/images/safilogo.jpeg'));

  void changeState() async {
    _isAnimation = true;
    _isBallance = false;
    setState(() {});

    await Future.delayed(const Duration(milliseconds: 800),
            () => setState(() => _isBallanceShown = true));
    await Future.delayed(
        const Duration(seconds: 3), () => setState(() => _isBallanceShown = false));
    await Future.delayed(const Duration(milliseconds: 200),
            () => setState(() => _isAnimation = false));
    await Future.delayed(
        const Duration(milliseconds: 800), () => setState(() => _isBallance = true));
  }
}
class GridViewScreen extends StatefulWidget {
  const GridViewScreen({super.key});
  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}
class _GridViewScreenState extends State<GridViewScreen> {

  final List<Map<String, dynamic>> firstGridItems = [
    {
      'icon': Icons.home,
      'text': 'Home',
    },
    {
      'icon': Icons.search,
      'text': 'Search',
    },
    {
      'icon': Icons.settings,
      'text': 'Settings',
    },
    {
      'icon': Icons.favorite,
      'text': 'Favorite',
    },
    {
      'icon': Icons.shopping_cart,
      'text': 'Cart',
    },
    {
      'icon': Icons.person,
      'text': 'Profile',
    },
  ];



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1,
          ),
          itemCount: firstGridItems.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: const BoxDecoration(

                  color: Colors.greenAccent,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white70,
                        blurRadius: 5,
                      )
                    ]
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    firstGridItems[index]['icon'],
                    size: 48,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    firstGridItems[index]['text'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
class ImageSliderScreen extends StatefulWidget {
  const ImageSliderScreen({super.key});

  @override
  State<ImageSliderScreen> createState() => _ImageSliderScreenState();
}
class _ImageSliderScreenState extends State<ImageSliderScreen> {

  final List<String> images =[
    'asset/images/diagnostic.png',
    'asset/images/hospital.png',
  ];
  List<Widget> generateImagesTiles(){
    return images.map((element)=>ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Image.asset(element,
        fit: BoxFit.fitWidth,
      ),
    )).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          CarouselSlider(items: generateImagesTiles(),
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 19/7
              ),
          ),
        ],
      ),
    );
  }
}
class GridViewScreen2 extends StatefulWidget {
  const GridViewScreen2({super.key});

  @override
  State<GridViewScreen2> createState() => _GridViewScreen2State();
}

class _GridViewScreen2State extends State<GridViewScreen2> {

  final List<Map<String, dynamic>> secondGridItems = [
    {
      'icon': Icons.mail,
      'text': 'Mail',
    },
    {
      'icon': Icons.calendar_today,
      'text': 'Calendar',
    },
    {
      'icon': Icons.music_note,
      'text': 'Music',
    },
    {
      'icon': Icons.camera_alt,
      'text': 'Camera',
    },
    {
      'icon': Icons.note,
      'text': 'Notes',
    },
    {
      'icon': Icons.map,
      'text': 'Map',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1,
          ),
          itemCount: secondGridItems.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: const BoxDecoration(

                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white70,
                      blurRadius: 5,
                    )
                  ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    secondGridItems[index]['icon'],
                    size: 48,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    secondGridItems[index]['text'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
class Nav extends StatefulWidget {
  const Nav({super.key});
  @override
  State<Nav> createState() => _NavState();
}
class _NavState extends State<Nav> {
  final List<Widget> screens = [
    Doctor(),
    Profile(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Doctor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        elevation: 0,
        shape: const CircleBorder(
          side: BorderSide(color: Colors.white70,width:4.0,style: BorderStyle.solid),
        ),
        child: const Icon(Icons.shopping_cart),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen =
                              Doctor();
                        });
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.person_2_sharp,
                            color: Colors.green,
                          ),
                          Text(
                            'Doctor',
                            style: TextStyle(
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),

              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen =
                              Profile();
                        });
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.person,
                            color: Colors.green,
                          ),
                          Text(
                            'Profile',
                            style: TextStyle(
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
