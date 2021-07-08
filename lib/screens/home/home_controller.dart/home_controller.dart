import 'package:flutter/widgets.dart';
import 'package:indaband_app/models/home_model.dart';
import 'package:indaband_app/screens/home/repository/home_repository.dart';

import 'home_state.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  List<HomeModel>? home;

  final repository = HomeRepository();

  void getHome() async {
    state = HomeState.loading;

    home = await repository.getHome();
    state = HomeState.success;
  }
}
