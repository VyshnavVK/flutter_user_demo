
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/app_blocs.dart';
import 'package:flutter_bloc_demo/blocs/User/user_events.dart';
import 'package:flutter_bloc_demo/blocs/User/user_states.dart';
import 'package:flutter_bloc_demo/models/UserModel.dart';
import 'package:flutter_bloc_demo/repos/Repository.dart';
import 'package:flutter_bloc_demo/screens/DetailsPage.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc User Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: RepositoryProvider(
        create: (context) => Repository(),
        child:  MyHomePage1(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserListBloc(
        RepositoryProvider.of<Repository>(context),
      )..add(UserLoadingEvent()),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text("Users List"),
        ),
        body: BlocBuilder<UserListBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserLoadedState) {
              List<UserModel> list = state.users;
              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailsPage(id: list[index].id!),
                            ),
                          );
                        },
                        child: Card(
                          color: Colors.white10,
                          elevation: 4,
                          margin:  const EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            title: Text(
                              "${list[index].firstName} ${list[index].lastName}",
                              style: const TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              list[index].email!,
                              style: const TextStyle(color: Colors.white),
                            ),
                            trailing: CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  NetworkImage(list[index].avatar!),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }

            if (state is UserLoadingStateError) {
              return const Center(
                child: Center(child: Text("Error Occurred!",style: TextStyle(color: Colors.white),)),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class MyHomePage1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>  Home();
}

class Home extends State<MyHomePage1>{
  List<UserModel> list = [];
  Future<void> getUserList() async {
    list.addAll(await Repository().getUser(1));
    setState(() {
      list;
    });

  }


  @override
  void initState() {
    getUserList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

   return Scaffold(
       backgroundColor: Colors.black,
       appBar: AppBar(
         title: const Text("Users List"),
       ),
       body: ListView.builder(
           itemCount: list.length,
           itemBuilder: (_, index) {
             return Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10),
               child: InkWell(
                 onTap: () {
                   Navigator.of(context).push(
                     MaterialPageRoute(
                       builder: (context) =>
                           DetailsPage(id: list[index].id!),
                     ),
                   );
                 },
                 child: Card(
                   color: Colors.white10,
                   elevation: 4,
                   margin:  const EdgeInsets.symmetric(vertical: 5),
                   child: ListTile(
                     title: Text(
                       "${list[index].firstName} ${list[index].lastName}",
                       style: const TextStyle(color: Colors.white),
                     ),
                     subtitle: Text(
                       list[index].email!,
                       style: const TextStyle(color: Colors.white),
                     ),
                     trailing: CircleAvatar(
                       radius: 30,
                       backgroundImage:
                       NetworkImage(list[index].avatar!),
                     ),
                   ),
                 ),
               ),
             );
           }));
  }
}




