import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyHomePage extends StatelessWidget {
  final controller = PageController();
  final currentPage = 0.obs;

  final List<String> images = [
    'https://picsum.photos/200/300',
    'https://picsum.photos/200/301',
    'https://picsum.photos/200/302',
    'https://picsum.photos/200/304'
  ];

  MyHomePage({super.key});

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void onDotClicked(int index) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smooth Page Indicator Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index) {
                return Image.network(images[index], fit: BoxFit.cover);
              },
              onPageChanged: onPageChanged,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            child: SmoothPageIndicator(
              controller: controller,
              count: images.length,
              onDotClicked: onDotClicked,
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.white,
                dotColor: Colors.red,
                dotWidth: 10.0,
                dotHeight: 10.0,
                expansionFactor: 4,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Obx(() {
            return Text(
              'Current Page: ${currentPage.value}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            );
          })
        ],
      ),
    );
  }
}
