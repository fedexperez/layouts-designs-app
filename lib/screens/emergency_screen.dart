import 'package:animate_do/animate_do.dart';
import 'package:emergency_layout/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = <TileButton>[
      const TileButton(
        tileIcon: Icons.car_crash,
        emergencyType: 'Motor Accident',
        tileColorLeft: Color(0xff6989F5),
        tileColorRigth: Color(0xff906EF5),
        onPress: null,
      ),
      const TileButton(
        tileIcon: Icons.add_rounded,
        emergencyType: 'Medical Emergency',
        tileColorLeft: Color(0xff66A9F2),
        tileColorRigth: Color(0xff536CF6),
        onPress: null,
      ),
      const TileButton(
        tileIcon: Icons.sports_kabaddi,
        emergencyType: 'Theft / Harrasement',
        tileColorLeft: Color(0xffF2D572),
        tileColorRigth: Color(0xffE06AA3),
        onPress: null,
      ),
      const TileButton(
        tileIcon: Icons.emoji_events,
        emergencyType: 'Awards',
        tileColorLeft: Color(0xff317183),
        tileColorRigth: Color(0xff46997D),
        onPress: null,
      ),
      const TileButton(
        tileIcon: Icons.car_crash,
        emergencyType: 'Motor Accident',
        tileColorLeft: Color(0xff6989F5),
        tileColorRigth: Color(0xff906EF5),
        onPress: null,
      ),
      const TileButton(
        tileIcon: Icons.add_rounded,
        emergencyType: 'Medical Emergency',
        tileColorLeft: Color(0xff66A9F2),
        tileColorRigth: Color(0xff536CF6),
        onPress: null,
      ),
      const TileButton(
        tileIcon: Icons.sports_kabaddi,
        emergencyType: 'Theft / Harrasement',
        tileColorLeft: Color(0xffF2D572),
        tileColorRigth: Color(0xffE06AA3),
        onPress: null,
      ),
      const TileButton(
        tileIcon: Icons.emoji_events,
        emergencyType: 'Awards',
        tileColorLeft: Color(0xff317183),
        tileColorRigth: Color(0xff46997D),
        onPress: null,
      ),
    ];

    List<Widget> tileList = items
        .map((element) => FadeInLeft(
              duration: const Duration(milliseconds: 350),
              child: TileButton(
                tileIcon: element.tileIcon,
                emergencyType: element.emergencyType,
                tileColorLeft: element.tileColorLeft,
                tileColorRigth: element.tileColorRigth,
                onPress: element.onPress,
              ),
            ))
        .toList();

    return Scaffold(
      body: Column(
        children: [
          const _Header(),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                ...tileList,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        const TopHeader(
          backgroundIcon: Icons.local_hospital_outlined,
          subtitle: 'You requested',
          title: 'Medical Atention',
        ),
        Align(
            alignment: Alignment.topRight,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                RawMaterialButton(
                  onPressed: () {},
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
