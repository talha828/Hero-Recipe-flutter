import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_hero/provider_model/provider_model.dart';
import 'package:recipe_hero/screen/bottom_bar_navigation/bottom_bar_navigation.dart';
import 'package:recipe_hero/screen/dietary_preferences/dietary_preferences_screen.dart';
import 'package:recipe_hero/screen/favorites/favorite_screen.dart';
import 'package:recipe_hero/screen/favorites/favorites_screen2.dart';
import 'package:recipe_hero/screen/favorites/recipe_screen.dart';
import 'package:recipe_hero/screen/ingrediants/available_recipe_screen.dart';
import 'package:recipe_hero/screen/ingrediants/filters_screen.dart';
import 'package:recipe_hero/screen/ingrediants/ingredients.dart';
import 'package:recipe_hero/screen/ingrediants/sort_screen.dart';
import 'package:recipe_hero/screen/setting/about_screen.dart';
import 'package:recipe_hero/screen/setting/dietary_setting.dart';
import 'package:recipe_hero/screen/setting/measurement_preferences.dart';
import 'package:recipe_hero/screen/setting/setting_screen.dart';
import 'package:recipe_hero/splash_screen/indicator_screen/indicator_screens.dart';
import 'package:recipe_hero/splash_screen/indicator_screen/screen_indicator.dart';
import 'package:recipe_hero/splash_screen/spalsh_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<SelectItem>(
       create: (_)=>SelectItem(),
      ),
      ChangeNotifierProvider<AddIngredientList>(
        create: (_)=>AddIngredientList(),
      ),
      ChangeNotifierProvider<Sort>(
        create: (_)=>Sort(),
      ),
    ],
      child: MaterialApp(
       //home:AboutScreen(),

       //MeasurementSetting()
   home: SplashScreen(),
       //DietarySetting(),
        // home: BrowseScreen(),
          //home:StartingScreen(),
       // home: SettingScreen(),
       // home: BottomBarNavigation()
       // home: DietaryPreferencesScreen(),
      // home:FavoriteScreen(),
     // home: RecipeScreen(),
       //  home: AvailableScreen(),
      //  home:FiltersScreen(),
       // home: SortScreen(),
      ),);
  }
}
