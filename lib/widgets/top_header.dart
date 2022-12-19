import 'package:flutter/material.dart';

class TopHeader extends StatelessWidget {
  const TopHeader({
    Key? key,
    this.principalBackgroundColor = const Color(0xFF526BF6),
    this.secondaryBackgroundColor = const Color(0xFF67ACF2),
    required this.backgroundIcon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final Color principalBackgroundColor;
  final Color secondaryBackgroundColor;
  final IconData backgroundIcon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.35,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                principalBackgroundColor,
                secondaryBackgroundColor,
              ]),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 5), blurRadius: 10)
          ]),
      child: _TopHeaderElements(
        backgroundIcon: backgroundIcon,
        subtitle: subtitle,
        title: title,
      ),
    );
  }
}

class _TopHeaderElements extends StatelessWidget {
  const _TopHeaderElements({
    Key? key,
    required this.backgroundIcon,
    required this.subtitle,
    required this.title,
  }) : super(key: key);

  final IconData backgroundIcon;
  final String subtitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: -60,
          top: -60,
          child: Icon(
            backgroundIcon,
            size: 250,
            color: Colors.white.withOpacity(0.1),
          ),
        ),
        Positioned(
            child: Column(
          children: [
            const SizedBox(width: double.infinity, height: 80),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.white, fontSize: 25),
            ),
            const SizedBox(height: 25),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Icon(
              backgroundIcon,
              color: Colors.white,
              size: 88,
            )
          ],
        ))
      ],
    );
  }
}
