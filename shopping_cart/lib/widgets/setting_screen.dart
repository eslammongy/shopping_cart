import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_cart/bloc/blocs.dart';
import 'package:shopping_cart/theme/app_theme.dart';
import 'package:shopping_cart/widgets/product_page.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  SharedPreferences sharedPreferences;

  int radioValue = 0;
  saveFavoriteTheme(int themeID) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("ThemeID", radioValue);
  }

  getFavoriteTheme() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      radioValue = sharedPreferences.getInt("ThemeID");
    });
  }

  final defultTheme = AppTheme.DefultLight;
  final blueTheme = AppTheme.BlueLight;
  final orangeTheme = AppTheme.OrangeDark;

  @override
  Widget build(BuildContext context) {
    getFavoriteTheme();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Shopping Card",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop(ProductHomePage());
                },
                icon: Icon(Icons.settings))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            SizedBox(
              height: 40,
            ),
            // RadioListTile(
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(20)),
            //   controlAffinity: ListTileControlAffinity.trailing,
            //   value: 0,
            //   groupValue: radioValue,
            //   onChanged: (value) {
            //     setState(() {
            //       radioValue = value;
            //       BlocProvider.of<ThemeBloc>(context)
            //           .add(ThemeChanged(appTheme: defultTheme));
            //     });
            //     saveFavoriteTheme(0);
            //   },
            //   title: Text("DefultTheme",
            //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            //   subtitle: Text("make app theme like default"),
            // ),
            RadioListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              controlAffinity: ListTileControlAffinity.trailing,
              value: 1,
              groupValue: radioValue,
              onChanged: (value) {
                setState(() {
                  radioValue = value;
                  BlocProvider.of<ThemeBloc>(context)
                      .add(ThemeChanged(appTheme: blueTheme));
                });
                saveFavoriteTheme(1);
              },
              title: Text("Light",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
              subtitle: Text("make app theme like blue light"),
            ),
            RadioListTile(
              value: 2,
              groupValue: radioValue,
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (value) {
                setState(() {
                  radioValue = value;
                  BlocProvider.of<ThemeBloc>(context)
                      .add(ThemeChanged(appTheme: orangeTheme));
                });
                saveFavoriteTheme(2);
              },
              title: Text("Darkt",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
              subtitle: Text("make app theme like orange dark"),
            ),
          ]),
        ));
  }
}
