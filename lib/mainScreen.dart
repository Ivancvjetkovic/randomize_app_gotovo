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
        backgroundColor: Colors.teal,
        drawer: const NavBar(),
        appBar: AppBar(
          backgroundColor: Colors.teal,
          iconTheme: const IconThemeData(color: Colors.lightBlueAccent),
          elevation: 0,
        ),
        body: Center(
          child: BlocBuilder<RandomBloc, RandomState>(
            builder: (context, randomState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: const Text(
                      'What are we going to do today?',
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      context.read<RandomBloc>().add(RandomSubmitEvent());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[900],
                      foregroundColor: Colors.white,
                      elevation: 20,
                      shadowColor: Colors.teal[900],
                      side: const BorderSide(color: Colors.black, width: 1.5),
                    ),
                    child: const Text(
                      'Randomize an activity',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  () {
                    if (randomState.status == RandomStateStatus.loading) {
                      return CircularProgressIndicator(
                        color: Colors.grey,
                      );
                    }
                    return Text(
                      randomState.activityModel?.activity ?? 'My next activity',
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    );
                  }()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
