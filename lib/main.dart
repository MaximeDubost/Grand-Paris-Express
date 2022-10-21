import 'package:flutter/material.dart';
import 'package:grand_paris_express/features/main/data/data_sources/data.dart';
import 'package:grand_paris_express/features/main/domain/entities/line.dart';
import 'package:grand_paris_express/theme/theme_constants.dart';
import 'package:grand_paris_express/theme/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    _themeManager.removeListener(() {});
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(() {});
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grand Paris Express',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      home: const MyHomePage(title: 'Grand Paris Express'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _period = 2031;
  List<Line> _data = Data.beyond2030;

  ///
  /// Build the main page
  ///
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double displayWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: buildAppBar(textTheme),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 20),
          buildLargeTitle("Lignes du réseau", textTheme),
          const SizedBox(height: 4),
          buildNetworkLineList(_data, displayWidth, textTheme),
          buildDivider(),
          const SizedBox(height: 4),
          buildLargeTitle("Réseaux connexes", textTheme),
          buildMetroList(textTheme),
          buildRERTransilienList(textTheme),
          buildTramwayList(textTheme, _period),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(displayWidth, textTheme),
    );
  }

  ///
  /// Change period of time (between 2022 and 2030+)
  ///
  void _changePeriod(double period) {
    setState(() {
      _period = period;
      switch (_period.toStringAsFixed(0)) {
        case "2022":
          _data = Data.in2022;
          break;
        case "2023":
          _data = Data.in2023;
          break;
        case "2024":
          _data = Data.in2024;
          break;
        case "2025":
          _data = Data.in2025;
          break;
        case "2026":
          _data = Data.in2026;
          break;
        case "2027":
          _data = Data.in2027;
          break;
        case "2028":
          _data = Data.in2028;
          break;
        case "2029":
          _data = Data.in2029;
          break;
        case "2030":
          _data = Data.in2030;
          break;
        default:
          _data = Data.beyond2030;
      }
    });
  }

  ///
  /// Build a divider
  ///
  Divider buildDivider() {
    return const Divider(height: 16, indent: 75, endIndent: 75, thickness: 1);
  }

  ///
  /// Build the app bar of the main page
  ///
  AppBar buildAppBar(TextTheme textTheme) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
      ),
      centerTitle: true,
      title: Text(widget.title, style: textTheme.titleMedium),
      backgroundColor: Colors.white,
    );
  }

  ///
  /// Build a large title
  ///
  Widget buildLargeTitle(String title, TextTheme textTheme) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(title, style: textTheme.titleLarge),
    );
  }

  ///
  /// Build the list of main metro lines
  ///
  ListView buildNetworkLineList(
    List<Line> lineList,
    double displayWidth,
    TextTheme textTheme,
  ) =>
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: lineList.length,
        itemBuilder: (context, index) {
          final line = lineList[index];

          return TextButton(
            onPressed: () {}, // TODO : Go to detail page
            child: Container(
              margin: const EdgeInsets.fromLTRB(24, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child: Image.asset("assets/images/lines/metro/m.png"),
                  ),
                  SizedBox(
                    height: 40,
                    child: Image.asset(line.icon),
                  ),
                  line.terminusList.length <= 2
                      ? buildLineTitle(line.terminusList, textTheme)
                      : buildLineTitleManySections(
                          line.terminusList, textTheme),
                ],
              ),
            ),
          );
        },
      );

  ///
  /// Build each title of the list of main metro lines (fontSize 20)
  ///
  Container buildLineTitle(List<String> terminusList, TextTheme textTheme) {
    List<Widget> titleList = [];
    for (String element in terminusList) {
      titleList.add(Text(element, style: textTheme.labelMedium));
    }
    return Container(
      height: 64,
      margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: titleList,
      ),
    );
  }

  ///
  /// Build each title of the list of main metro lines (fontSize 20)
  ///
  Container buildLineTitleManySections(
    List<String> terminusList,
    TextTheme textTheme,
  ) {
    List<Widget> titleList = [];
    for (String element in terminusList) {
      titleList.add(Text(element, style: textTheme.labelSmall));
    }
    return Container(
      height: 64,
      margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: titleList,
      ),
    );
  }

  ///
  /// Build bottom app bar with period and slider
  ///
  Container buildBottomNavigationBar(double displayWidth, TextTheme textTheme) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.25), blurRadius: 8),
        ],
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildPeriodDisplay(textTheme),
          buildSlider(displayWidth),
        ],
      ),
    );
  }

  ///
  /// Build the display of the period
  ///
  Widget buildPeriodDisplay(TextTheme textTheme) {
    return Container(
      width: 110,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 4),
      color: colorPrimary,
      child: Text(
        _period.toStringAsFixed(0) == "2031"
            ? "> 2030"
            : _period.toStringAsFixed(0),
        textAlign: TextAlign.center,
        style: textTheme.labelLarge,
      ),
    );
  }

  ///
  /// Build period slider
  ///
  Widget buildSlider(double displayWidth) {
    return SizedBox(
      width: displayWidth * .9,
      child: Slider.adaptive(
        activeColor: colorAccent,
        thumbColor: Colors.white,
        value: _period,
        min: 2022.0,
        max: 2031.0,
        onChanged: (newValue) {
          _changePeriod(newValue);
        },
      ),
    );
  }

  ///
  /// Build the list of the secondary metro lines
  ///
  Container buildRelatedNetworkList(List<String> imageAssetList) {
    List<Widget> children = [];
    for (var imageAsset in imageAssetList) {
      children.add(
        SizedBox(
          height: 50,
          child: IconButton(
            splashRadius: 24,
            onPressed: () {},
            icon: Image.asset(imageAsset),
          ),
        ),
      );
    }
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      height: 100,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 7,
        children: children,
      ),
    );
  }

  ///
  /// Build the related metro network
  ///
  Column buildMetroList(TextTheme textTheme) {
    var metroList = [
      "assets/images/lines/metro/1.png",
      "assets/images/lines/metro/2.png",
      "assets/images/lines/metro/3.png",
      "assets/images/lines/metro/3bis.png",
      "assets/images/lines/metro/4.png",
      "assets/images/lines/metro/5.png",
      "assets/images/lines/metro/6.png",
      "assets/images/lines/metro/7.png",
      "assets/images/lines/metro/7bis.png",
      "assets/images/lines/metro/8.png",
      "assets/images/lines/metro/9.png",
      "assets/images/lines/metro/10.png",
      "assets/images/lines/metro/12.png",
      "assets/images/lines/metro/13.png",
    ];

    return Column(
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(24, 0, 8, 0),
              child: Text("Métro", style: textTheme.titleSmall),
            ),
            SizedBox(
              height: 24,
              child: Image.asset("assets/images/lines/metro/m.png"),
            ),
          ],
        ),
        const SizedBox(height: 4),
        buildRelatedNetworkList(metroList),
      ],
    );
  }

  ///
  /// Build the RER and Transilien related network
  ///
  Widget buildRERTransilienList(TextTheme textTheme) {
    var rerTransilienList = [
      "assets/images/lines/rer/a.png",
      "assets/images/lines/rer/b.png",
      "assets/images/lines/rer/c.png",
      "assets/images/lines/rer/d.png",
      "assets/images/lines/rer/e.png",
      "assets/images/lines/transilien/h.png",
      "assets/images/lines/transilien/j.png",
      "assets/images/lines/transilien/k.png",
      "assets/images/lines/transilien/l.png",
      "assets/images/lines/transilien/n.png",
      "assets/images/lines/transilien/p.png",
      "assets/images/lines/transilien/r.png",
      "assets/images/lines/transilien/u.png",
    ];

    return Column(
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(24, 0, 8, 0),
              child: Text("RER et Transiliens", style: textTheme.titleSmall),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
              height: 24,
              child: Image.asset("assets/images/lines/rer/rer.png"),
            ),
            SizedBox(
              height: 24,
              child:
                  Image.asset("assets/images/lines/transilien/transilien.png"),
            ),
          ],
        ),
        const SizedBox(height: 4),
        buildRelatedNetworkList(rerTransilienList),
      ],
    );
  }

  ///
  /// Build the tramway related network
  ///
  Widget buildTramwayList(TextTheme textTheme, double period) {
    var tramwayList = [
      "assets/images/lines/tramway/t1.png",
      "assets/images/lines/tramway/t2.png",
      "assets/images/lines/tramway/t3a.png",
      "assets/images/lines/tramway/t3b.png",
      "assets/images/lines/tramway/t4.png",
      "assets/images/lines/tramway/t5.png",
      "assets/images/lines/tramway/t6.png",
      "assets/images/lines/tramway/t7.png",
      "assets/images/lines/tramway/t8.png",
      "assets/images/lines/tramway/t9.png",
    ];
    if (period.toStringAsFixed(0) == "2022") {
      tramwayList.addAll([
        "assets/images/lines/tramway/t11.png",
        "assets/images/lines/tramway/t13.png",
      ]);
    } else {
      tramwayList.addAll([
        "assets/images/lines/tramway/t10.png",
        "assets/images/lines/tramway/t11.png",
        "assets/images/lines/tramway/t12.png",
        "assets/images/lines/tramway/t13.png",
      ]);
    }

    return Column(
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(24, 0, 8, 0),
              child: Text("Tramways", style: textTheme.titleSmall),
            ),
            SizedBox(
              height: 24,
              child: Image.asset("assets/images/lines/tramway/t.png"),
            ),
          ],
        ),
        const SizedBox(height: 4),
        buildRelatedNetworkList(tramwayList),
      ],
    );
  }
}
