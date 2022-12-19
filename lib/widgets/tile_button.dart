import 'package:flutter/material.dart';

class TileButton extends StatelessWidget {
  const TileButton({
    super.key,
    required this.emergencyType,
    required this.tileIcon,
    this.tileColorLeft = Colors.grey,
    this.tileColorRigth = Colors.blueGrey,
    required this.onPress,
  });

  final String emergencyType;
  final IconData tileIcon;
  final Color tileColorLeft;
  final Color tileColorRigth;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        height: 100,
        margin: const EdgeInsets.all(10),
        child: Stack(alignment: AlignmentDirectional.center, children: [
          _TileBackground(
            emergencyType: emergencyType,
            tileIcon: tileIcon,
            tileColorLeft: tileColorLeft,
            tileColorRigth: tileColorRigth,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Icon(
                    tileIcon,
                    color: Colors.white,
                    size: 40,
                  )),
              Expanded(
                child: Text(
                  emergencyType,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 30,
                  ))
            ],
          )
        ]),
      ),
    );
  }
}

class _TileBackground extends StatelessWidget {
  const _TileBackground({
    Key? key,
    required this.emergencyType,
    required this.tileIcon,
    required this.tileColorLeft,
    required this.tileColorRigth,
  }) : super(key: key);

  final String emergencyType;
  final IconData tileIcon;
  final Color tileColorLeft;
  final Color tileColorRigth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(4, 6),
                blurRadius: 10)
          ],
          gradient: LinearGradient(colors: [tileColorLeft, tileColorRigth])),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: Icon(
                tileIcon,
                color: Colors.white24,
                size: 150,
              ),
            )
          ],
        ),
      ),
    );
  }
}
