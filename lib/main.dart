import 'package:flutter/material.dart';

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
              // GridViewScreen(),
              // ImageSliderScreen(),
              // GridViewScreen2(),

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
