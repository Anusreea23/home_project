import 'package:flutter/material.dart';
import 'package:home_project/view/account_screen/account_screen.dart';
import 'package:home_project/view/celebration_screen/celebration_screen.dart';
import 'package:home_project/view/donate_screen/donate_screen.dart';
import 'package:home_project/view/dream_screen/dream_screen.dart';
import 'package:home_project/view/main_page/main_page_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  int currentIndex = 0;
  final List<Widget> children = [
    DonateScreen(),
    DreamScreen(),
    CelebrationScreen(),
    AccountScreen(),
  ];
  void onTapped(int index) {
    if (index == 2) ;
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => MainPageViewmodel(),
        builder: (context, viewModel, child) => Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.pink,
                iconSize: 22,
                unselectedItemColor: Colors.black,
                selectedItemColor: Colors.pink,
                showUnselectedLabels: true,
                onTap: (value) {
                  viewModel.onBottomnavTapped(value);
                },
                currentIndex: viewModel.currentIndex,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.favorite_border,
                        size: 25,
                      ),
                      label: "Donate"),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.diversity_1,
                        size: 25,
                      ),
                      label: "Dreams"),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.celebration_outlined,
                        size: 25,
                      ),
                      label: "Celebrations"),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person,
                        size: 25,
                      ),
                      label: "Account"),
                ],
              ),
              body: children[viewModel.currentIndex],
            ));
  }
}
