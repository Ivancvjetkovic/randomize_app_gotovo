import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:randomize_app/authenticationRepository.dart';
import 'package:randomize_app/login_bloc/bloc_event.dart';
import 'dart:math' as math;

import 'package:randomize_app/mainScreen.dart';
import 'package:randomize_app/signInModelValidator.dart';

import 'login_bloc/bloc_bloc.dart';
import 'login_bloc/bloc_state.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

final IAuthenticationRepository authenticationRepository =
    AuthenticationRepository();
final SignInModelValidator signInModelValidator = SignInModelValidator();

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(
          authenticationRepository: authenticationRepository,
          signInModelValidator: signInModelValidator),
      child: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, signInstate) {
          if (signInstate.status == SignInStateStatus.submittingSuccess) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MainScreen()));
          }
        },
        builder: (context, signInstate) {
          return Scaffold(
            backgroundColor: Colors.teal,
            body: ListView(
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'images/signin.png',
                              width: 400,
                              height: 330,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, top: 250),
                          child: Column(
                            children: [
                              Transform.rotate(
                                angle: -math.pi / 19,
                                child: Container(
                                  color: Colors.lightBlue,
                                  height: 90,
                                  width: 180,
                                  child: Transform.rotate(
                                    angle: math.pi / 19,
                                    child: const Padding(
                                      padding: EdgeInsets.only(
                                          top: 30.0, left: 20.0),
                                      child: Text(
                                        'Sign in',
                                        style: TextStyle(fontSize: 40),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey,
                            ),
                            width: 300,
                            height: 50,
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              validator: (value) =>
                                  signInModelValidator.username(
                                signInstate.model.copyWith(
                                  username: value,
                                ),
                              ),
                              onChanged: (value) => context
                                  .read<SignInBloc>()
                                  .add(SignInUpdateEvent(
                                      model: signInstate.model
                                          .copyWith(username: value))),
                              decoration:
                                  const InputDecoration(hintText: 'Username'),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey,
                            ),
                            width: 300,
                            height: 50,
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              obscureText: true,
                              validator: (value) =>
                                  signInModelValidator.username(
                                signInstate.model.copyWith(
                                  password: value,
                                ),
                              ),
                              onChanged: (value) => context
                                  .read<SignInBloc>()
                                  .add(SignInUpdateEvent(
                                      model: signInstate.model
                                          .copyWith(password: value))),
                              decoration:
                                  const InputDecoration(hintText: 'Password'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 300,
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () {
                          context.read<SignInBloc>().add(SignInSubmitEvent());
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.lightBlue),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
