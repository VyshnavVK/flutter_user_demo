import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/UserDetails/user_details_events.dart';
import 'package:flutter_bloc_demo/blocs/UserDetails/user_details_states.dart';
import 'package:flutter_bloc_demo/blocs/app_blocs.dart';
import 'package:flutter_bloc_demo/models/UserDetailsModel.dart';

import '../repos/Repository.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    const String fillerText =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        " Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure"
        " dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat "
        "non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

    var screenSize = MediaQuery.maybeOf(context)!.size;
    return RepositoryProvider(
      create: (context) => Repository(),
      child: BlocProvider(
        create: (context) => UserDetailsBloc(
          RepositoryProvider.of<Repository>(context),
        )..add(UserDetailsLoadingEvent(id: id)),
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: const Text("User Details"),
          ),
          body: BlocBuilder<UserDetailsBloc, UserDetailsState>(
            builder: (context, state) {
              if (state is UserDetailsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is UserDetailsLoadedState) {
                UserDetailsModel? user = state.user;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Blur(
                            blur: 6.5,
                            blurColor: const Color.fromARGB(255, 0, 0, 0),
                            child: AspectRatio(
                              aspectRatio: 16 / 7,
                              child: Image(
                                fit: BoxFit.cover,
                                width: double.infinity,
                                image: NetworkImage(user.avatar!),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: screenSize.width * 0.2,
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.black38,
                                radius: screenSize.width * 0.18,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(user.avatar!),
                                  radius: screenSize.width * 0.15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          "${user.firstName} ${user.lastName}",
                          style:  TextStyle(
                              color: Colors.white, fontSize: screenSize.width*0.075),
                        ),
                      ),
                      Stack(
                        children: [
                           Center(
                             child: ClipRRect(
                               borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                               child: SizedBox(
                                 width: screenSize.width * 0.85 ,
                                 child: Blur(
                                  blur: 10,
                                  blurColor: Colors.black,
                                  child: AspectRatio(
                                    aspectRatio: 16 / 2,
                                    child: Image(
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      image: NetworkImage(user.avatar!),
                                    ),
                                  )
                          ),
                               ),
                             ),
                           ),
                          Center(
                            child: Positioned(
                              child: Text(
                                "Email: ${user.email}",
                                style:  TextStyle(
                                    color: Colors.white, fontSize: screenSize.width*0.05),
                              ),
                            ),
                          ),
                        ],
                      ),
                       Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                        child: Text(
                          fillerText,
                          style: TextStyle(color: Colors.grey,fontSize: screenSize.width*0.042),
                        ),
                      ),
                    ],
                  ),
                );
              }

              if (state is UserDetailsLoadingStateError) {
                return  const Center(
                  child: Center(
                    child: Text(
                      "Error Occurred!",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }

              return Container();
            },
          ),
        ),
      ),
    );
  }
}
