import 'package:artbotic/controllers/home_controller.dart';
import 'package:artbotic/routes/routes.dart';
import 'package:artbotic/utils/app_const.dart';
import 'package:artbotic/view/create.dart';
import 'package:artbotic/view/my_creation.dart';
import 'package:artbotic/view/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../generated/l10n.dart';

class Landing extends StatelessWidget {
  Landing({super.key});

  final HomeController bottomNavVController = Get.put(HomeController());

  static final List<Widget> _views = <Widget>[
    Create(),
    const MyCreation(),
    Settings()
  ];

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final List<BottomNavigationBarItem> bottomNav = [
      BottomNavigationBarItem(
          icon: Image(
              image: const AssetImage(AppConsts.create),
              color: Theme.of(context).iconTheme.color,
              height: 22,
              width: 22),
          activeIcon: const Image(
              image: AssetImage(AppConsts.selectedCreate),
              height: 25,
              width: 25),
          tooltip: s.create,
          label: s.create),
      BottomNavigationBarItem(
          icon: Image(
            image: const AssetImage(AppConsts.gallery),
            height: 22,
            width: 22,
            color: Theme.of(context).iconTheme.color,
          ),
          activeIcon: const Image(
              image: AssetImage(AppConsts.selectedGallery),
              height: 25,
              width: 25),
          tooltip: s.myCreation,
          label: s.myCreation),
      BottomNavigationBarItem(
          icon: Image(
              image: const AssetImage(AppConsts.settings),
              height: 22,
              width: 22,
              color: Theme.of(context).iconTheme.color),
          activeIcon: const Image(
              image: AssetImage(AppConsts.selectedSettings),
              height: 25,
              width: 25),
          tooltip: s.settings,
          label: s.settings)
    ];

    return Obx(() {
      return Scaffold(
          appBar: AppBar(
              leadingWidth: 150,
              leading: const Image(image: AssetImage(AppConsts.textIcon)),
              actions: [
                InkWell(
                  onTap: () => navigatorKey.currentState!
                      .pushNamed(PageRoutes.purchases),
                  child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 18),
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).iconTheme.color!),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(children: [
                        const Image(
                            image: AssetImage(AppConsts.diamond),
                            width: 20,
                            height: 20),
                        Text(s.buy,
                            style: Theme.of(context).textTheme.bodySmall)
                      ])),
                ),
                const SizedBox(width: 12),
                Image(
                    color: Theme.of(context).iconTheme.color,
                    image: const AssetImage(AppConsts.instagram),
                    width: 20,
                    height: 20),
                const SizedBox(width: 12),
                Image(
                    color: Theme.of(context).iconTheme.color,
                    image: const AssetImage(AppConsts.discord),
                    width: 25,
                    height: 25),
                const SizedBox(width: 10)
              ]),
          bottomNavigationBar: BottomNavigationBar(
              items: bottomNav,
              currentIndex: bottomNavVController.selectedNavigationIndex.value,
              onTap: (index) =>
                  bottomNavVController.selectedNavigationIndex.value = index),
          body: IndexedStack(
              index: bottomNavVController.selectedNavigationIndex.value,
              children: _views));
    });
  }
}
