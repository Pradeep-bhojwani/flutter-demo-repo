import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final List<ProfileDetail> profileDetails = List.generate(
    15,
    (index) => ProfileDetail(
      detail: 'Nickname $index',
      subDetail: 'Sunny Bhojwani $index',
    ),
  );

  final ScrollController _scrollController = ScrollController();
  double _top = 50.0; // Initial top position of the container
  double _left = 0.0; // Initial left position of the container
  double _opacity = 1.0; // Initial opacity
  double _size = 90.0; // Initial size of the container
  bool _isContainerVisible = true; // Track the visibility of the container

  double _bottomTop = 0.0;
  double _bottomLeft = 0.0;
  double _bottomOpacity = 0.0;
  double _bottomSize = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    double scrollPosition = _scrollController.position.pixels;

    // Update visibility and properties based on scroll position
    setState(() {
      _isContainerVisible = scrollPosition < 120;
      _top = (50.0 - scrollPosition / 1.2).clamp(0.0, 50.0); // Move to top
      _left = (0.0 - scrollPosition / 1.2).clamp(-50.0, 0.0); // Move to left
      _opacity = (1.0 - scrollPosition / 120).clamp(0.0, 1.0); // Adjust opacity
      _size =
          (90.0 - scrollPosition / 1.2).clamp(30.0, 90.0); // Shrink the size

      // Reverse animation for the bottom container
      _bottomTop = (50.0 - scrollPosition / 1.2).clamp(0.0, 50.0);
      _bottomLeft = (0.0 - scrollPosition / 1.2).clamp(-50.0, 0.0);
      _bottomOpacity = (scrollPosition / 120).clamp(0.0, 1.0);
      _bottomSize = (scrollPosition / 1.2).clamp(0.0, 90.0);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 300),
                      top: _bottomTop,
                      left: _bottomLeft,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: _bottomOpacity,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: _bottomSize,
                          width: _bottomSize,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.purple,
                              width: 2.0,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: _bottomSize / 2,
                            backgroundImage: AssetImage(
                              'assets/image/wallpaper.jpg',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Pradeep bhojwani',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          Text(
                            'sunnybhojwani073@gmail.com',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[800],
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 20,
                      child: Image.asset(
                          '/Users/prismetric/Desktop/Flutter_Demo_Projects/Jillii_Hybrid/jilli/assets/image/menuDot.png'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (_isContainerVisible)
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              top: _top,
              left: _left,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 300),
                opacity: _opacity,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: _size,
                  width: _size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.purple,
                      width: 2.0,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: _size / 2,
                    backgroundImage: AssetImage(
                      'assets/image/wallpaper.jpg',
                    ),
                  ),
                ),
              ),
            ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 30),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: profileDetails.map((profileDetail) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profileDetail.detail,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              profileDetail.subDetail,
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            SizedBox(height: 15),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileDetail {
  final String detail;
  final String subDetail;

  ProfileDetail({required this.detail, required this.subDetail});
}
