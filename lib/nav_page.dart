import 'package:badges/badges.dart' as badges;
import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:shop/view/cart.dart';
import 'package:shop/view/favorite.dart';
import 'package:shop/view/home.dart';
import './model/import.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});
  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final Controller controller = Get.put(Controller());

  PersistentTabController tabcontroller =
      PersistentTabController(initialIndex: 0);

  List<Widget> buildScreens() {

    return const [
      Home(),
      Favorite(),
      Cart(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: "Home",
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: badges.Badge(
         badgeAnimation: const badges.BadgeAnimation.scale(),
          badgeContent: Obx(
            () => Text(
              controller.favoriteProductCount.value.toString(),
            ),
          ),
          child: const Icon(
            Icons.favorite_rounded,
          ),
        ),
        title: "Favorite",
      ),
      PersistentBottomNavBarItem(
        icon: badges.Badge(
          // animationType: BadgeAnimationType.scale,
          badgeContent: Obx(
            () => Text(
              controller.productQuantityCount.value.toString(),
            ),
          ),
          child: const Icon(
            Icons.shopping_cart_checkout_rounded,
            size: 30,
          ),
        ),
        title: "Cart",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PersistentTabView(
          context,
          controller: tabcontroller,
          screens: buildScreens(),
          items: navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.white,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          navBarHeight: kBottomNavigationBarHeight,
          hideNavigationBarWhenKeyboardShows: true,
          margin: const EdgeInsets.all(0.0),
          popActionScreens: PopActionScreensType.all,
          bottomScreenMargin: 0.0,
          decoration: NavBarDecoration(
            colorBehindNavBar: Colors.indigo,
            borderRadius: BorderRadius.circular(20.0),
          ),
          popAllScreensOnTapOfSelectedTab: true,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle:
              NavBarStyle.style3, // Choose the nav bar style with this property
        ),
      ),
    );
  }
}
