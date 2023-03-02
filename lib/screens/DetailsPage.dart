import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

import '../models/UserModel.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    const String fillerText =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

    var screenSize = MediaQuery.maybeOf(context)!.size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("${user.firstName} ${user.lastName}"),
      ),
      body: SingleChildScrollView(
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
                      )),
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
                      )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "${user.firstName} ${user.lastName}",
                style: const TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Text(
                  fillerText,
                  style: TextStyle(color: Colors.grey),
                )),

          ],
        ),
      ),
    );
  }

}
