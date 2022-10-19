import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randomize_app/bloc/bloc_event.dart';
import 'package:randomize_app/http_service.dart';
import 'package:randomize_app/model.dart';

import 'bloc/bloc.dart';
import 'bloc/bloc_state.dart';
import 'drawer.dart';

HttpService httpService = HttpService();

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RandomBloc(randomRepository: httpService),
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: const NavBar(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.grey),
          elevation: 0,
        ),
        body: Center(
          child: BlocBuilder<RandomBloc, RandomState>(
            builder: (context, randomState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'What are we going to do today?',
                    style: TextStyle(fontSize: 25),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      context.read<RandomBloc>().add(RandomSubmitEvent());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      foregroundColor: Colors.black,
                      elevation: 20,
                      shadowColor: Colors.lightBlue,
                      side: const BorderSide(color: Colors.black, width: 1.5),
                    ),
                    child: const Text(
                      'Randomize an activity',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Text( 
                    randomState.activityModel?.activity ?? 
                    'Learn a new recipe',
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
