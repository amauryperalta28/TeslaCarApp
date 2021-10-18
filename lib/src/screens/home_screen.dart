import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla_car_app/src/assets.dart';
import 'package:tesla_car_app/src/constants.dart';
import 'package:tesla_car_app/src/controllers/home_controller.dart';
import 'package:tesla_car_app/src/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _controller = new HomeController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, widget) {
          return SafeArea(
            child: Scaffold(
                bottomNavigationBar: TeslaCarBottomBarNavigation(
                  onTap: (index) {
                    _controller.setSelectedTab(index);
                  },
                  selectedTab: _controller.selectedTab,
                ),
                body: LayoutBuilder(
                  builder: (context, contrainst) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          vertical: contrainst.maxHeight * 0.05),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SvgPicture.asset(
                            Assets.car,
                            width: double.infinity,
                          ),
                          Positioned(
                            top: contrainst.maxHeight * 0.4,
                            left: 20,
                            child: DoorLock(
                              onTap: () {
                                _controller.updateRightDoorLock();
                              },
                              isLocked: _controller.isRightDoorLocked,
                            ),
                          ),
                          Positioned(
                            top: contrainst.maxHeight * 0.4,
                            right: 20,
                            child: DoorLock(
                              onTap: () {
                                _controller.updateLeftDoorLock();
                              },
                              isLocked: _controller.isLeftDoorLocked,
                            ),
                          ),
                          Positioned(
                            top: contrainst.maxHeight * 0.05,
                            child: DoorLock(
                              onTap: () {
                                _controller.updateBonnetLock();
                              },
                              isLocked: _controller.isBonnetLocked,
                            ),
                          ),
                          Positioned(
                            bottom: contrainst.maxHeight * 0.1,
                            child: DoorLock(
                              onTap: () {
                                _controller.updateTrunkLock();
                              },
                              isLocked: _controller.isTrunkLocked,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )),
          );
        });
  }
}

class TeslaCarBottomBarNavigation extends StatelessWidget {
  const TeslaCarBottomBarNavigation({
    Key? key,
    required this.selectedTab,
    required this.onTap,
  }) : super(key: key);

  final int selectedTab;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        currentIndex: selectedTab,
        onTap: onTap,
        items: List.generate(getIcons().length, (index) {
          return BottomNavigationBarItem(
            icon: SvgPicture.asset(
              getIcons()[index],
              color: index == selectedTab ? primaryColor : Colors.white54,
            ),
            label: '',
          );
        }));
  }

  List<String> getIcons() {
    return [
      'assets/icons/Lock.svg',
      'assets/icons/Charge.svg',
      'assets/icons/Temp.svg',
      'assets/icons/Tyre.svg',
    ];
  }
}
