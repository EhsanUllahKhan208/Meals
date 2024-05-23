import 'package:flutter/material.dart';

enum Filter{
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}
class FilterScreen extends StatefulWidget {
  const FilterScreen({
    super.key,
    required this.currentFilters,
  });
final Map<Filter , bool> currentFilters;
  @override
  State<StatefulWidget> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
 var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegeterianFilterSet = false;
  var _veganFilterSet = false;
 @override
  void initState() {
    
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
  _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
   _veganFilterSet = widget.currentFilters[Filter.vegan]!;
    _vegeterianFilterSet = widget.currentFilters[Filter.vegetarian]!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
        ),
//         drawer: MainDrawer(onSelectScreen: (identifier){
//           Navigator.of(context).pop();
//           if(identifier == 'meals'){
// Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) =>const TabsScreen()))
//           }
//         }),
        body: PopScope(
  canPop: false,
  onPopInvoked: (bool didPop) {
    if(didPop) return;
    Navigator.of(context).pop({
      Filter.glutenFree: _glutenFreeFilterSet,
      Filter.lactoseFree: _lactoseFreeFilterSet,
      Filter.vegetarian: _vegeterianFilterSet,
      Filter.vegan: _veganFilterSet,
    });
  },
          child: Column(
            children: [
              SwitchListTile(
                value: _glutenFreeFilterSet,
                onChanged: (isChecked){
          setState(() {
            _glutenFreeFilterSet = isChecked;
          });
                },
                title: Text(
                  'Gluten-Free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                subtitle: Text(
                  'only Gluten-free meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                activeColor:Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left:34, right:22),
              ),
                SwitchListTile(
                value: _lactoseFreeFilterSet,
                onChanged: (isChecked){
          setState(() {
            _lactoseFreeFilterSet = isChecked;
          });
                },
                title: Text(
                  'Lactose-Free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                subtitle: Text(
                  'only lactose-free meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                activeColor:Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left:34, right:22),
              ),
               SwitchListTile(
                value: _vegeterianFilterSet,
                onChanged: (isChecked){
          setState(() {
            _vegeterianFilterSet = isChecked;
          });
                },
                title: Text(
                  'Vegeterian',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                subtitle: Text(
                  'only Vegeterian meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                activeColor:Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left:34, right:22),
              ),
               SwitchListTile(
                value: _veganFilterSet,
                onChanged: (isChecked){
          setState(() {
            _veganFilterSet = isChecked;
          });
                },
                title: Text(
                  'Vegan',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                subtitle: Text(
                  'only vegan meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                activeColor:Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left:34, right:22),
              ),
            ],
          ),
        ));
  }
}
