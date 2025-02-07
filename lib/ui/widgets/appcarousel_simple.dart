import 'package:flutter/material.dart';

class AppCarouselSimple extends StatelessWidget {
  const AppCarouselSimple({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: CarouselView(
        itemExtent: 150,
        itemSnapping: true,
        elevation: 4,
        children: List.generate(10, (index) {
          return Container(
            color: Colors.grey,
            child: Image.network(
              'https://picsum.photos/200?random=$index',
              fit: BoxFit.cover,
            ),
          );
        }),
      ),
    );
  }

  // ? This is the weighted carousel
  // child: CarouselView.weighted(
  //   itemSnapping: true,
  //   elevation: 4,
  //   flexWeights: const [1, 7, 1],
  //   children: List.generate(10, (int index) {
  //     return Container(
  //       color: Colors.grey,
  //       child: Image.network(
  //         'https://picsum.photos/200?random=$index',
  //         fit: BoxFit.cover,
  //       ),
  //     );
  //   }),
  // ),
}
