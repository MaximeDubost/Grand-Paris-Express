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
  /// Build the main page
  ///
  @override
  Widget build(BuildContext context) {
    // TextTheme textTheme = Theme.of(context).textTheme;
    double displayWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontFamily: "Parisine",
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: buildLineList(_data, displayWidth),
      bottomNavigationBar: buildBottomAppBar(displayWidth),
    );
  }

  ///
  /// Build the list of main metro lines
  ///
  Widget buildLineList(List<Line> lineList, double displayWidth) =>
      ListView.builder(
        itemCount: lineList.length,
        itemBuilder: (context, index) {
          final line = lineList[index];

          return Column(
            children: [
              TextButton(
                onPressed: () {},
                child: Container(
                  margin: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: Image.asset("assets/images/lines/metro/m.png"),
                      ),
                      Image.asset(line.icon),
                      line.terminusList.length <= 2
                          ? buildLineTitle20(line.terminusList)
                          : buildLineTitle16(line.terminusList)
                    ],
                  ),
                ),
              )
            ],
          );
        },
      );

  ///
  /// Build each title of the list of main metro lines (fontSize 20)
  ///
  Widget buildLineTitle20(List<String> terminusList) {
    List<Widget> titleList = [];
    for (String element in terminusList) {
      titleList.add(
        Text(
          element,
          style: const TextStyle(
            fontFamily: "Parisine",
            fontSize: 20,
            color: Color.fromRGBO(0, 0, 84, 1),
          ),
        ),
      );
    }
    return Container(
      height: 72,
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
  Widget buildLineTitle16(List<String> terminusList) {
    List<Widget> titleList = [];
    for (String element in terminusList) {
      titleList.add(
        Text(
          element,
          style: const TextStyle(
            fontFamily: "Parisine",
            fontSize: 16,
            color: Color.fromRGBO(0, 0, 84, 1),
          ),
        ),
      );
    }
    return Container(
      height: 72,
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
  Widget buildBottomAppBar(double displayWidth) {
    return Container(
      margin: EdgeInsets.all(displayWidth * .05),
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 16,
            ),
            color: colorPrimary,
            child: Text(
              _period.toStringAsFixed(0) == "2031"
                  ? "> 2030"
                  : _period.toStringAsFixed(0),
              style: const TextStyle(
                fontFamily: "Parisine",
                fontSize: 36,
                color: Colors.white,
              ),
            ),
          ),
          Slider.adaptive(
            activeColor: colorAccent,
            thumbColor: Colors.white,
            value: _period,
            onChanged: (newValue) {
              _changePeriod(newValue);
            },
            min: 2022.0,
            max: 2031.0,
          ),
        ],
      ),
    );
  }
}
