import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_and_shop_app/shared/cubit/AppCubit.dart';
import 'package:social_and_shop_app/shared/cubit/AppStates.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      builder: (ctx, state) {
        return Scaffold(
          
        );
      },
      listener: (ctx, state) {},
    );
  }
}
 