import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randomize_app/bloc/bloc_event.dart';
import 'package:randomize_app/mainScreen.dart';
import 'package:randomize_app/model.dart';

import 'bloc/bloc.dart';
import 'bloc/bloc_state.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  String? group = 'Grupa';
  String? priced = 'priced';

  List<String> names = [
    "education",
    "recreational",
    "social",
    "diy",
    "charity",
    "cooking",
    "relaxation",
    "music",
    "busywork"
  ];
  List<String> price = ['free', 'paid'];
  double _currentSliderValue = 0;
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocBuilder<RandomBloc, RandomState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40, left: 10),
                child: Text(
                  'Filters',
                  style: TextStyle(fontSize: 40),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'type',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Column(
                children: List.generate(
                  names.length,
                  (index) => Container(
                    height: 25,
                    child: RadioListTile(
                      visualDensity: const VisualDensity(vertical: -4),
                      dense: true,
                      contentPadding: const EdgeInsets.all(0),
                      title: Text(names[index]),
                      value: '${names[index]}',
                      groupValue: group,
                      onChanged: (String? value) {
                        setState(() {
                          group = value;
                        });
                        context.read<RandomBloc>().add(
                              RandomUpdateEvent(
                                model:
                                    state.filterModel?.copyWith(type: value) ??
                                        FilterModel(),
                              ),
                            );
                      },
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 10.0),
                child: Text('Accesibility'),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Slider(
                      value: _currentSliderValue,
                      max: 1,
                      min: 0,
                      divisions: 2,
                      label: _currentSliderValue.toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                        context.read<RandomBloc>().add(RandomUpdateEvent(
                            model: state.filterModel
                                    ?.copyWith(accessibility: value) ??
                                FilterModel()));
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Hard'),
                        Text('Normal'),
                        Text('Easy'),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 140),
                    child: Text(
                      'Participants',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      //obscureText: true,
                      keyboardType: TextInputType.number,
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Number of participants',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 210),
                    child: Text(
                      'Price',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: List.generate(
                        price.length,
                        (index) => Container(
                          height: 25,
                          child: RadioListTile(
                            visualDensity: const VisualDensity(vertical: -4),
                            dense: true,
                            contentPadding: const EdgeInsets.all(0),
                            title: Text(price[index]),
                            value: '',
                            groupValue: priced,
                            onChanged: (String? value) {
                              setState(() {
                                priced = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    child: OutlinedButton(
                      onPressed: () {
                        print(state.filterModel?.type);
                        print(state.filterModel?.accessibility);
                      },
                      child: const Text(
                        'Filter',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.blue),
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
