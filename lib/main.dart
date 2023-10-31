import 'package:bloc_vs_future/bloc/image_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ImageBloc(),
          )
        ],
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ImageBloc>().add(GetImage());
    return Scaffold(
      body: BlocConsumer<ImageBloc, ImageState>(
        listener: (context, state) {
          if (state is Offline) {
            ScaffoldMessenger.of(context)
                .showSnackBar(new SnackBar(content: Text('No Internet')));
          } else if (state is Success) {
            ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
              content: Text('Thanks You ALl to learn FLutter Bloc'),
              backgroundColor: Colors.green,
            ));
          }
        },
        builder: (context, state) {
          if (state is Error) {
            return Center(
              child: Text('Error'),
            );
          } else if (state is Success) {
            return ListView.builder(
              itemCount: state.images.length,
              itemBuilder: (context, index) => ListTile(
                subtitle: Text(state.images[index].url),
                leading: CircleAvatar(
                    child: Image.network(state.images[index].thumbnailUrl)),
                title: Text(state.images[index].title),
              ),
            );
          } else if (state is Offline) {
            return Center(
              child: Text('No Internet'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
