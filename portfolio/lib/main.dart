import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ExampleParallax(),
      ),
    );
  }
}

class ExampleParallax extends StatelessWidget {
  const ExampleParallax({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width < 600 ? 50 : 60, 30, 40, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      height:
                          MediaQuery.of(context).size.width < 600 ? 80 : 150,
                      width: MediaQuery.of(context).size.width < 600 ? 80 : 150,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width < 600
                                ? 50
                                : 120,
                            width: MediaQuery.of(context).size.width < 600
                                ? 50
                                : 120,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                                side: BorderSide(
                                    color: Colors.white,
                                    width:
                                        MediaQuery.of(context).size.width < 600
                                            ? 3
                                            : 4),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                18,
                                0,
                                18,
                                MediaQuery.of(context).size.width < 600
                                    ? 2
                                    : 5),
                            child: ClipRRect(
                              child: Image.asset('image/profile_blank.png'),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width < 600 ? 0 : 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Divyang Mistry',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width < 600
                                        ? 20
                                        : 40,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.5),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width < 600
                                ? 5
                                : 10,
                          ),
                          Text(
                            'Software Developer @ Techavidus',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width < 600
                                        ? 10
                                        : 14,
                                fontWeight: FontWeight.w100,
                                letterSpacing:
                                    MediaQuery.of(context).size.width < 600
                                        ? 1
                                        : 2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  child: MediaQuery.of(context).size.width < 900
                      ? Container(
                          child: Text(""),
                        )
                      : Container(child: DevelopingAppsAnimatedText()),
                  // Text(" ")
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(icon: Icon(Icons.mail), onPressed: () => {}),
                  IconButton(
                      icon: FaIcon(FontAwesomeIcons.github),
                      onPressed: () => {}),
                  IconButton(
                      icon: FaIcon(FontAwesomeIcons.instagram),
                      onPressed: () => {}),
                  IconButton(
                      icon: FaIcon(FontAwesomeIcons.facebook),
                      onPressed: () => {}),
                ],
              ),
            ),
          ),
          Stack(
            children: [
              Card(
                color: Colors.white,
                elevation: 10,
                margin: EdgeInsets.fromLTRB(
                    60,
                    MediaQuery.of(context).size.width < 600 ? 100 : 170,
                    40,
                    30),
                semanticContainer: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (final location in locations)
                          LocationListItem(
                            imageUrl: location.imageUrl,
                            name: location.name,
                            country: location.place,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              // Positioned.fill(
              //   child: DecoratedBox(
              //     decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //         colors: [
              //           Colors.transparent,
              //           Colors.black.withOpacity(0.7)
              //         ],
              //         begin: Alignment.topCenter,
              //         end: Alignment.bottomCenter,
              //         stops: [0.7, 1],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedTextKit(
                animatedTexts: [
                  FadeAnimatedText(
                      '\u00a9 Divyang Mistry - Made with ❤️ in Flutter.',
                      textStyle: TextStyle(fontSize: 12),
                      duration: Duration(seconds: 10))
                ],
                isRepeatingAnimation: true,
                repeatForever: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DevelopingAppsAnimatedText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Developing Apps in :',
            style: TextStyle(fontSize: 30),
          ),
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Flutter',
                cursor: '|',
                speed: Duration(milliseconds: 100),
                textStyle: TextStyle(fontSize: 20),
              ),
              TypewriterAnimatedText(
                'ReactJS',
                cursor: '|',
                speed: Duration(milliseconds: 100),
                textStyle: TextStyle(fontSize: 20),
              ),
              TypewriterAnimatedText(
                'Angular',
                cursor: '|',
                speed: Duration(milliseconds: 100),
                textStyle: TextStyle(fontSize: 20),
              ),
            ],
            isRepeatingAnimation: true,
            repeatForever: true,
          )
        ],
      ),
    );
  }
}

class LocationListItem extends StatelessWidget {
  LocationListItem({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.country,
  }) : super(key: key);

  final String imageUrl;
  final String name;
  final String country;
  final GlobalKey _backgroundImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: AspectRatio(
        aspectRatio: 16 / 6,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              _buildParallaxBackground(context),
              _buildGradient(),
              _buildTitleAndSubtitle(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Flow(
      delegate: ParallaxFlowDelegate(
        scrollable: Scrollable.of(context)!,
        listItemContext: context,
        backgroundImageKey: _backgroundImageKey,
      ),
      children: [
        Image.asset(
          imageUrl,
          key: _backgroundImageKey,
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.6, 0.95],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndSubtitle(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width < 600 ? 40 : 300,
              fontWeight: FontWeight.w200,
              letterSpacing: -40,
            ),
          ),
          Text(
            country,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      width: constraints.maxWidth,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    // Calculate the position of this list item within the viewport.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
        listItemBox.size.centerLeft(Offset.zero),
        ancestor: scrollableBox);

    // Determine the percent position of this list item within the
    // scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
        (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);

    // Calculate the vertical alignment of the background
    // based on the scroll percent.
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final listItemSize = context.size;
    final childRect =
        verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

    // Paint the background.
    context.paintChild(
      0,
      transform:
          Transform.translate(offset: Offset(0.0, childRect.top)).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}

class Parallax extends SingleChildRenderObjectWidget {
  Parallax({
    required Widget background,
  }) : super(child: background);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderParallax(scrollable: Scrollable.of(context)!);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderParallax renderObject) {
    renderObject.scrollable = Scrollable.of(context)!;
  }
}

class ParallaxParentData extends ContainerBoxParentData<RenderBox> {}

class RenderParallax extends RenderBox
    with RenderObjectWithChildMixin<RenderBox>, RenderProxyBoxMixin {
  RenderParallax({
    required ScrollableState scrollable,
  }) : _scrollable = scrollable;

  ScrollableState _scrollable;

  ScrollableState get scrollable => _scrollable;

  set scrollable(ScrollableState value) {
    if (value != _scrollable) {
      if (attached) {
        _scrollable.position.removeListener(markNeedsLayout);
      }
      _scrollable = value;
      if (attached) {
        _scrollable.position.addListener(markNeedsLayout);
      }
    }
  }

  @override
  void attach(covariant PipelineOwner owner) {
    super.attach(owner);
    _scrollable.position.addListener(markNeedsLayout);
  }

  @override
  void detach() {
    _scrollable.position.removeListener(markNeedsLayout);
    super.detach();
  }

  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! ParallaxParentData) {
      child.parentData = ParallaxParentData();
    }
  }

  @override
  void performLayout() {
    size = constraints.biggest;

    // Force the background to take up all available width
    // and then scale its height based on the image's aspect ratio.
    final background = child!;
    final backgroundImageConstraints =
        BoxConstraints.tightFor(width: size.width);
    background.layout(backgroundImageConstraints, parentUsesSize: true);

    // Set the background's local offset, which is zero.
    (background.parentData as ParallaxParentData).offset = Offset.zero;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // Get the size of the scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;

    // Calculate the global position of this list item.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final backgroundOffset =
        localToGlobal(size.centerLeft(Offset.zero), ancestor: scrollableBox);

    // Determine the percent position of this list item within the
    // scrollable area.
    final scrollFraction =
        (backgroundOffset.dy / viewportDimension).clamp(0.0, 1.0);

    // Calculate the vertical alignment of the background
    // based on the scroll percent.
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final background = child!;
    final backgroundSize = background.size;
    final listItemSize = size;
    final childRect =
        verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

    // Paint the background.
    context.paintChild(
        background,
        (background.parentData as ParallaxParentData).offset +
            offset +
            Offset(0.0, childRect.top));
  }
}

class Location {
  const Location({
    required this.name,
    required this.place,
    required this.imageUrl,
  });

  final String name;
  final String place;
  final String imageUrl;
}

const urlPrefix =
    'https://flutter.dev/docs/cookbook/img-files/effects/parallax';
const locations = [
  Location(
    name: 'Objective',
    place: 'i want to reach',
    imageUrl: 'image/pexels-skitterphoto-15812.jpg',
  ),
  Location(
    name: 'Education',
    place: 'the world want\'s me to know',
    imageUrl: 'image/pexels-pixabay-159711.jpg',
  ),
  Location(
    name: 'Experience',
    place: 'that i got from this world ',
    imageUrl: 'image/pexels-kevin-ku-577585.jpg',
  ),
  Location(
    name: 'Achievements',
    place: 'some small acknowledgement that i made till date',
    imageUrl: 'image/pexels-anna-shvets-5218003.jpg',
  ),
  Location(
    name: 'Socializing',
    place: '... for when i am not around you',
    imageUrl: 'image/pexels-mike-1178683.jpg',
  ),
];
