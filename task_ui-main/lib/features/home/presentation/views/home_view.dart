import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task/core/styles.dart';
import 'package:task/features/home/presentation/views/widgets/buttons.dart';
import 'package:task/features/home/presentation/views/widgets/cars_grid_view.dart';
import 'package:task/features/home/presentation/views/widgets/cars_model_story_list_view.dart';
import 'package:task/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:task/features/home/presentation/views/widgets/search_text_field.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isSwitched = false;
  void toggleSwitch(bool value) {
    setState(() {
      isSwitched = value;
      if (value) {
        Get.changeTheme(ThemeData.dark());
      } else {
        Get.changeTheme(ThemeData.light());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'dark mode',
              style: Styles.textStyle18,
            ),
            Switch(
              activeColor: Colors.green[700],
              value: isSwitched,
              onChanged: toggleSwitch,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: SvgPicture.asset(
                'assets/Icons/Home_menu.svg',
                height: 15,
              ),
            );
          },
        ),
        backgroundColor: const Color(0xff67687A),
        title: const CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
              child: CarsModelStoryListView(),
            ),
            SizedBox(
              width: double.infinity,
              height: 180,
              child: Image.asset(
                'assets/Image_6.png',
                fit: BoxFit.fill,
              ),
            ),
            const SearchTextField(),
            const Buttons(),
            const SizedBox(
              height: 30,
            ),
            const CarsGridView(),
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                fit: BoxFit.fill,
                'assets/Image_5.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
