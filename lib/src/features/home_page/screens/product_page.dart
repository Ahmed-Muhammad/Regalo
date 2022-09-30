import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regalo/src/features/home_page/controller/bloc/main_cubit.dart';

import '../../../core/constants/constants.dart';
import '../controller/bloc/main_state.dart';

class ProductPage extends StatelessWidget {
  ProductPage({Key? key}) : super(key: key);

  final List<String> sliderImages = [
    'assets/images/chocolate_slider1.jpg',
    'assets/images/chocolate_slider2.jpg',
    'assets/images/chocolate_slider3.jpg',
    'assets/images/chocolate_slider4.jpeg',
    'assets/images/Cake5.jpg',
    'assets/images/Cake8.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        var mainCubit = MainCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Stack(
              children: [
                const Positioned(
                  bottom: 50,
                  left: 0,
                  child: Image(
                    image: AssetImage(
                      'assets/images/new.png',
                    ),
                  ),
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SafeArea(
                        child: CarouselSlider(
                          options: CarouselOptions(
                              height: MediaQuery.of(context).size.height / 6,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlayAnimationDuration: const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal),
                          items: sliderImages.map((i) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(35),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.asset(
                                    i,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 25),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                InkWell(
                                    onTap: () {},
                                    child: const CircleAvatar(
                                        radius: 37,
                                        backgroundColor: primaryColor,
                                        child: CircleAvatar(
                                            radius: 35,
                                            child: ClipOval(
                                                child: Image(
                                                    height: 110,
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        'assets/images/chocolate_slider4.jpeg')))))),
                                const Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text('حلويات', style: TextStyle(color: secondaryColor)))
                              ],
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width / 10),
                            Column(
                              children: [
                                InkWell(
                                    onTap: () {},
                                    child: const CircleAvatar(
                                        radius: 37,
                                        backgroundColor: primaryColor,
                                        child: CircleAvatar(
                                            radius: 35,
                                            child: ClipOval(
                                                clipBehavior: Clip.antiAlias,
                                                child: Image(
                                                    height: 110,
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        'assets/images/chocolate_slider1.jpg')))))),
                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text('كيكات', style: TextStyle(color: secondaryColor)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      buildProducts(
                        name: 'كيكه',
                        description: 'شيكولاته بيضاء',
                        price: '120',
                          image: 'assets/images/Cake1.jpg'
                      ),
                      buildProducts(
                          name: 'كيكه',
                          description: 'شيكولاته بيضاء',
                          price: '120',
                          image: 'assets/images/Cake2.jpg'
                      ),
                      buildProducts(
                          name: 'كيكه',
                          description: 'شيكولاته',
                          price: '190',
                          image: 'assets/images/Cake3.jpg'
                      ),
                      buildProducts(
                          name: 'شيكولاته',
                          description: 'شيكولاته بيضاء',
                          price: '120',
                          image: 'assets/images/Cake4.jpg'
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildProducts({
    required String? description,
    required String? price,
    required String? name,
    required String? image,
  }) =>
      Padding(
        padding: const EdgeInsets.only(right: 0, top: 0, bottom: 5, left: 5),
        child: Card(
          shadowColor: secondaryColor,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
              width: 300,
              height: 110,
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5, top: 8, bottom: 8, left: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image(
                            width: 100,
                            height: 150,
                            fit: BoxFit.fill,
                            image: AssetImage(image!),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Positioned(
                          child: Image(
                            width: 30,
                            height: 35,
                            image: AssetImage('assets/images/card.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(name!),
                          Text(
                            price!,
                            style: const TextStyle(color: primaryColor),
                          ),
                          Text(description!),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ),
      );
}
