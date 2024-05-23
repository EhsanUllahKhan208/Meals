import 'package:flutter/material.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/screens/categories.dart';
import 'package:meal/screens/filters.dart';
import 'package:meal/screens/meals.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/widgets/main_drawer.dart';

const kinitialFilters = {
    Filter.glutenFree: false,
   Filter.lactoseFree: false,
    Filter.vegetarian: false,
     Filter.vegan: false,
};

class TabsScreen extends StatefulWidget{
  const TabsScreen ({super.key});
 @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  } 
}

class _TabsScreenState extends State<TabsScreen>{
int _selectedPageIndex = 0;
final List<Meal> _favouriteMeals = [];
Map<Filter, bool> _selectedFilters = kinitialFilters;
void _showInfoMessage(String message){
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content:Text(message),),);
}
void _toggleMealFavouriteStatus (Meal meal){
  final isExisting = _favouriteMeals.contains(meal);
if(isExisting){
  setState(() {
     _favouriteMeals.remove(meal);
    
  });
  _showInfoMessage('meal is no longer favorite');
}else{
  setState(() {
    _favouriteMeals.add(meal);
    _showInfoMessage('marked as a favorite');
  });
  
}
}

void _selectPage(int index){
  setState(() {
    _selectedPageIndex = index;
  });
}
void _setscreen(String identifier)async{
   Navigator.of(context).pop();
if(identifier == 'filters'){
 
     final result =   await Navigator.of(context).push<Map<Filter , bool>>(MaterialPageRoute(builder: (ctx) =>  FilterScreen(currentFilters: _selectedFilters,),),);
setState(() {
  _selectedFilters = result ?? kinitialFilters;
});

}
}

@override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal){
      if(_selectedFilters [Filter.glutenFree]! && !meal.isGlutenFree){
return false;
      }
       if(_selectedFilters [Filter.lactoseFree]! && !meal.isLactoseFree){
return false;
      }
       if(_selectedFilters [Filter.vegan]! && !meal.isVegan){
return false;
      } if(_selectedFilters [Filter.vegetarian]! && !meal.isVegetarian){
return false;
      }
      return true;
    }).toList();
Widget activepage =  CategoriesScreeen(onToggleFavorite: _toggleMealFavouriteStatus,
availableMeals: availableMeals,
);
var activepageTitle = 'Categories';
if(_selectedPageIndex==1){
  activepage= MealsScreen( 
    meals: _favouriteMeals,
    onToggleFavorite: _toggleMealFavouriteStatus ,);
  
  activepageTitle = 'Your Favourites';
}

    return Scaffold(
      appBar: AppBar(
        title: Text(activepageTitle),
      ),
      drawer:  MainDrawer(onSelectScreen: _setscreen ,),
      body:activepage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.set_meal),label:'Categories',),
           BottomNavigationBarItem(icon: Icon(Icons.star),label:'Favourite')
        ],
      ),
    );
  }
}