import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() {
  runApp(TarockApp());
}

class TarockApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: TarockHomePage(currentLocale: 'en'),
    );
  }
}

class TarockHomePage extends StatefulWidget {
  TarockHomePage({Key? key, required this.currentLocale}) : super(key: key);

  String currentLocale = 'en';
  int numOfPlayers = 3;

  @override
  _TarockHomePageState createState() => _TarockHomePageState();
}

class _TarockHomePageState extends State<TarockHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> languages = [
      DropdownMenuItem<String> (value: "en", child: Text ("English")),
      DropdownMenuItem<String> (value: "si", child: Text ("Slovensko"))
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of (context).appTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container (
                child: Text (S.of (context).currentLocaleLabel),
                margin: const EdgeInsets.all (5.0),
              ),
              Container (
                child: DropdownButton<String> (
                  value: widget.currentLocale,
                  onChanged: (String? newValue) {
                    setState(() {
                      widget.currentLocale = newValue!;
                      S.load (Locale (widget.currentLocale, ''));
                    });
                  },
                  items: languages,
                ),
                margin: const EdgeInsets.all (5.0),
              ),
            ]
          ),
          Row (
            children: <Widget>[
              Container (
                child: Text (S.of (context).appMessage),
                margin: const EdgeInsets.all (5.0),
              ),
              Container (
                child: Text ('$_counter'),
                margin: const EdgeInsets.all(5.0),
              ),
            ]
          ),
          Row(
            children: <Widget>[
              Container(
                child: Text (S.of(context).numOfPlayersLabel),
                margin: const EdgeInsets.all(5.0),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    ChoiceChip(
                      label: Text('3'),
                      selected: widget.numOfPlayers == 3,
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) widget.numOfPlayers = 3;
                        });
                      },
                      avatar: CircleAvatar(
                        backgroundColor: widget.numOfPlayers != 3 ? Colors.transparent : null,
                        child: widget.numOfPlayers == 3 ? Icon (Icons.check) : null,
                      ),
                    ),
                    ChoiceChip(
                      label: Text('4'),
                      selected: widget.numOfPlayers == 4,
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) widget.numOfPlayers = 4;
                        });
                      },
                      avatar: CircleAvatar(
                        backgroundColor: widget.numOfPlayers != 4 ? Colors.transparent : null,
                        child: widget.numOfPlayers == 4 ? Icon (Icons.check) : null,
                      ),
                    ),
                  ],
                ),
                margin: const EdgeInsets.all(5.0),
              )
            ]
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: S.of (context).incrementLabel,
        child: Icon(Icons.add),
      ),
    );
  }
}
