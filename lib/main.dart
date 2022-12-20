import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _idDayWeek = 'sec';

  @override
  Widget build(BuildContext context) {
    final dayOfWeekMeals = meals
        .where((meal) =>
            meal.idDayWeek.any((idDayWeek) => idDayWeek == _idDayWeek))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: dayOfWeekMeals.length,
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 0,
                  margin: (index == dayOfWeekMeals.length - 1)
                      ? const EdgeInsets.only(bottom: 0, left: 20, right: 20)
                      : const EdgeInsets.only(left: 20, right: 20),
                  child: ClipRRect(
                    borderRadius: (index == 0)
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          )
                        : (index == dayOfWeekMeals.length - 1)
                            ? const BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              )
                            : BorderRadius.circular(0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(dayOfWeekMeals[index].description),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SemanaButton(
                'Monday',
                onPressed: () => setState(() => _idDayWeek = 'sec'),
                selected: _idDayWeek == 'sec',
              ),
              SemanaButton(
                'Tuesday',
                onPressed: () => setState(() => _idDayWeek = '3rd'),
                selected: _idDayWeek == '3rd',
              ),
              SemanaButton(
                'Wednesday',
                onPressed: () => setState(() => _idDayWeek = '4th'),
                selected: _idDayWeek == '4th',
              ),
              SemanaButton(
                'Thursday',
                onPressed: () => setState(() => _idDayWeek = '5th'),
                selected: _idDayWeek == '5th',
              ),
              SemanaButton(
                'Friday',
                onPressed: () => setState(() => _idDayWeek = '6th'),
                selected: _idDayWeek == '6th',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SemanaButton extends StatelessWidget {
  final String text;
  final bool? selected;
  final VoidCallback onPressed;
  const SemanaButton(
    this.text, {
    Key? key,
    required this.onPressed,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        '$text \n____________',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 11,
          color:
              selected == true ? Theme.of(context).colorScheme.primary : null,
          fontWeight: selected == true ? FontWeight.bold : null,
        ),
      ),
    );
  }
}

class Meal {
  final String id;
  final String description;
  final List<String> ingredients;
  final List<String> idDayWeek;
  final String imageUrl;

  const Meal({
    required this.id,
    required this.description,
    required this.ingredients,
    required this.idDayWeek,
    required this.imageUrl,
  });
}

var id = 0;

final meals = [
  Meal(
    id: '${++id}',
    description: 'Fish  and Chips',
    ingredients: [],
    idDayWeek: ['sec'],
    imageUrl: '',
  ),
  Meal(
    id: '${++id}',
    description: 'Hamburger',
    ingredients: [],
    idDayWeek: ['6th'],
    imageUrl: '',
  ),
  Meal(
    id: '${++id}',
    description: 'Eggs and Sausage',
    ingredients: [],
    idDayWeek: ['sec'],
    imageUrl: '',
  ),
  Meal(
    id: '${++id}',
    description: 'Pizza',
    ingredients: [],
    idDayWeek: ['sec'],
    imageUrl: '',
  ),
  Meal(
    id: '${++id}',
    description: 'Fried Chicken',
    ingredients: [],
    idDayWeek: ['sec'],
    imageUrl: '',
  ),
  Meal(
    id: '${++id}',
    description: 'Pancakes and muffins',
    ingredients: [],
    idDayWeek: ['sec', '3rd', '4th', '5th', '6th'],
    imageUrl: '',
  ),
  Meal(
    id: '${++id}',
    description: 'Salad Buffet',
    ingredients: [],
    idDayWeek: ['sec', '3rd', '4th', '5th', '6th'],
    imageUrl: '',
  ),
];
