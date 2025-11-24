import 'package:flutter/material.dart';
import 'package:flutter_application_3/features/barbari/data/datasource/barbari_data.dart';
import 'package:flutter_application_3/features/barbari/data/repository/barbari_repository_impl.dart';
import 'package:flutter_application_3/features/barbari/domain/usecase/get-barbari-list.dart';
import 'package:flutter_application_3/features/barbari/presentation/bloc/barbari_bloc.dart';
import 'package:flutter_application_3/features/barbari/presentation/pages/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final repository = BarbariRepositoryImpl(datasource: BarbariData());
  final getBarbariList = GetBarbariList(repository: repository);

  runApp(MyApp(getBarbariList: getBarbariList));
}

class MyApp extends StatelessWidget {
  final GetBarbariList getBarbariList;

  const MyApp({super.key, required this.getBarbariList});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BarbariBloc(getBarbariList),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily: 'IranSans',
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16),
      bodyMedium: TextStyle(fontSize: 14),
      displayLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 18),
    ),
        ),
        home: Home(),
      ),
    );
  }
}
