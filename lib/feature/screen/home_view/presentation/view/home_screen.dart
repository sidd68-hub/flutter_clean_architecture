import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/feature/screen/home_view/presentation/bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              print("The State is ${state.user}");
              return (state.isLoading == true)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: state.user?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Text("Hello ${state.user?[index].firstName}");
                      });
            },
          )),
    );
  }
}
