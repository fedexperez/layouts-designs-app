import 'package:flutter/material.dart';

class SliverListScreen extends StatelessWidget {
  const SliverListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          _MainScroll(),
          Positioned(
            bottom: -8,
            right: 0,
            child: _NewListButton(),
          )
        ],
      ),
    );
  }
}

class _NewListButton extends StatelessWidget {
  const _NewListButton();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      backgroundColor: const Color(0xFFED6762),
      minimumSize: Size(size.width * 0.9, size.height * 0.1),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
      ),
    );

    return ElevatedButton(
      style: raisedButtonStyle,
      onPressed: () {},
      child: const Text(
        'CREATE NEW LIST',
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 3),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  const _MainScroll();

  @override
  Widget build(BuildContext context) {
    final items = [
      const _ListItem(title: 'Orange', itemColor: Color(0xffF08F66)),
      const _ListItem(title: 'Family', itemColor: Color(0xffF2A38A)),
      const _ListItem(title: 'Subscriptions', itemColor: Color(0xffF7CDD5)),
      const _ListItem(title: 'Books', itemColor: Color(0xffFCEBAF)),
      const _ListItem(title: 'Orange', itemColor: Color(0xffF08F66)),
      const _ListItem(title: 'Family', itemColor: Color(0xffF2A38A)),
      const _ListItem(title: 'Subscriptions', itemColor: Color(0xffF7CDD5)),
      const _ListItem(title: 'Books', itemColor: Color(0xffFCEBAF)),
    ];

    final Size size = MediaQuery.of(context).size;

    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
              minHeigth: 210,
              maxHeigth: 230,
              child: Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  child: const _SliverTitle())),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          ...items,
          SizedBox(
            width: size.width,
            height: 100,
          )
        ]))
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SliverCustomHeaderDelegate(
      {required this.minHeigth, required this.maxHeigth, required this.child});

  final double minHeigth;
  final double maxHeigth;
  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => (maxHeigth);

  @override
  double get minExtent => (minHeigth);

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeigth != oldDelegate.maxHeigth ||
        minHeigth != oldDelegate.minHeigth ||
        child != oldDelegate.child;
  }
}

class _SliverTitle extends StatelessWidget {
  const _SliverTitle();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: const Text(
            'New',
            style: TextStyle(
              color: Color(0xFF532128),
              fontSize: 50,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            'List',
            style: TextStyle(
                color: Colors.red.shade900,
                fontSize: 50,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: const Color(0xFFF7CDD5),
                decorationThickness: 1.5),
          ),
        )
      ],
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    Key? key,
    required this.title,
    required this.itemColor,
  }) : super(key: key);

  final String title;
  final Color itemColor;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: itemColor, borderRadius: BorderRadius.circular(25)),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      width: size.width,
      height: size.height * 0.1,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }
}
