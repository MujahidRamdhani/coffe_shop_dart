import 'package:coffe_shop_flutter/Pages/dashboard_fragments/home_fragment.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int indexMenu = 0;
  final menu = [
    {
      'icon': 'assets/ic_home_border.png',
      'icon_active': 'assets/ic_home_filled.png',
      'fragment': const HomeFragment(),
    },
    {
      'icon': 'assets/ic_heart_border.png',
      'icon_active': 'assets/ic_heart_border.png',
      'fragment': const Center(child: Text('Favorite')),
    },
    {
      'icon': 'assets/ic_bag_border.png',
      'icon_active': 'assets/ic_bag_border.png',
      'fragment': const Center(child: Text('Bag')),
    },
    {
      'icon': 'assets/ic_notification_border.png',
      'icon_active': 'assets/ic_notification_border.png',
      'fragment': const Center(child: Text('Notification')),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
          height: 60,
          child: Row(
            children: List.generate(menu.length, (index) {
              Map item = menu[index];
              bool isActive = indexMenu == index;
              return Column(
                children: [
                  ImageIcon(AssetImage(item[isActive? 'icon_active' : 'icon'],
                    ),
                  ),
                  if( isActive) const SizedBox(height: 6),
                  if( isActive) 
                    Container(
                      height: 5,
                      width: 10,
                      decoration: BoxDecoration(
                        color: const Color(0xffC67C4E),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                ]
              );
            }),
          )),
    );
  }
}
