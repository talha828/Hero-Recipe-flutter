
import 'package:flutter/cupertino.dart';

class SelectItem extends ChangeNotifier{
  List<String> preferences=['Alcohol Free' ,'Egg Free','Fish Free','Gluten Free','Lactose Free','Peanut Free','Pork Free','Shellfesh ','Sog Free','Sugar Free','Tree Nut Free','Vegan','Vegetarian','Vegetarian'];
  List<String> selectediteam =[];

  additem(String str){
       selectediteam.add(str);
       notifyListeners();
  }
  removeitem(String str){
    selectediteam.removeWhere((element) => element == str);
  }

}

class AddIngredientList extends ChangeNotifier{
  List<String>  iteam =[
    'Truffles','Sweet peppers','Papayas', "Raspberries", "Caviar", "White beans", 'Wremini mushrooms', 'Spinach', 'Shard', 'Goji berry', 'pinto beans', 'couscous', ' mascarpone',
    'lemon juice', 'pistachios', 'anchovy paste', ' pears', 'strawberries', 'duck', 'vinegar', 'prunes', 'asiago cheese', ' flax seed', 'scallops', 'pea beans', ' beef', 'rice', 'radishes',
    'buttermilk', 'nectarines', 'raisins', ' mint', ' tortillas', 'cheddar cheese', 'coffee', 'broccoli raab', 'English muffins', 'shallots', 'cashew nut', ' hazelnuts', 'blue cheese', 'tarragon', 'arugula', 'sardines', 'applesauce', 'paprika', ' haddock', 'cornmeal', 'colby cheese', 'okra','eggs','wine vinegar',' sunflower seeds','apple pie spice','pomegranates','mozzarella','snow peas',' brunoise',' half-and-half','white chocolate',' wine','pork','jicama','fennel seeds', 'bacon grease', 'corn', 'raw sugar', 'rose water', 'chives', 'sweet potatoes', 'breadcrumbs', 'salt', 'brandy', 'oregano', ' french fries', "baking powder", "cilantro",

  ];
  List<String> selectedIngredient=[];
  additem(String str){
    selectedIngredient.add(str);
    notifyListeners();
  }
  removeitem(String str){
    selectedIngredient.removeWhere((element) => element == str);
    notifyListeners();
  }

}
class Sort extends ChangeNotifier{
  List<String> item = [
    'Relevance',
    'Popularity',
    'Date Added',
    'Average Review',
    'Name'
  ];
  String dropdownvalue = 'Date Added';
  sortOrder(String str){
    dropdownvalue=str;
    notifyListeners();
  }

}