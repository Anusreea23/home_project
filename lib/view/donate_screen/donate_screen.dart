import 'package:flutter/material.dart';
import 'package:home_project/view/donate_screen/donation_details_screen.dart';

class DonateScreen extends StatefulWidget {
  const DonateScreen({super.key});

  @override
  State<DonateScreen> createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  List<Widget> cards = [
    CardFb1(
        text: "Goods Donation",
        imageUrl:
            "https://images.pexels.com/photos/7156193/pexels-photo-7156193.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
        subtitle: "Not as duty,but as a privilege.",
        onPressed: () {}),
    CardFb1(
        text: "Monitory Donation",
        imageUrl:
            "https://images.pexels.com/photos/2988232/pexels-photo-2988232.jpeg?auto=compress&cs=tinysrgb&w=600",
        subtitle: "its not how much we give,its how much love we put",
        onPressed: () {}),
    CardFb1(
        text: "Watch and Deposit",
        imageUrl:
            "https://images.pexels.com/photos/5077068/pexels-photo-5077068.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
        subtitle: "Watch ads and donate",
        onPressed: () {})
  ];

  final double carouselItemMargin = 16;

  late PageController _pageController;
  int _position = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: .5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffe8e6df),
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Center(
            child: Text(
              "Select Category",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          leading: Icon(
            Icons.home,
            size: 28,
            color: Colors.white,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert_outlined,
                  color: Colors.white,
                ))
          ],
        ),
        body: PageView.builder(
            controller: _pageController,
            itemCount: cards.length,
            onPageChanged: (int position) {
              setState(() {
                _position = position;
              });
            },
            itemBuilder: (BuildContext context, int position) {
              return imageSlider(position);
            }));
  }

  Widget imageSlider(int position) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, widget) {
        return Container(
          margin: EdgeInsets.all(carouselItemMargin),
          child: Center(child: widget),
        );
      },
      child: Container(
        child: cards[position],
      ),
    );
  }
}

class CardFb1 extends StatelessWidget {
  final String text;
  final String imageUrl;
  final String subtitle;
  final Function() onPressed;

  const CardFb1(
      {required this.text,
      required this.imageUrl,
      required this.subtitle,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 250,
        height: 230,
        padding: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.5),
          boxShadow: [
            BoxShadow(
                offset: const Offset(10, 20),
                blurRadius: 10,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.05)),
          ],
        ),
        child: Column(
          children: [
            Image.network(imageUrl, height: 90, fit: BoxFit.contain),
            const Spacer(),
            Text(text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
            const SizedBox(
              height: 5,
            ),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 12),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
