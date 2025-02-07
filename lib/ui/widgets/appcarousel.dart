import 'package:assignment/api/gen/watchmode_api.models.swagger.dart';
import 'package:flutter/material.dart';
import '../appui.dart';

class _InternalValues {
  static const double containerSize = 210;
  static const double carouselSize = 150;
  static const double spaceBetweenCards = 3;
  static const double imgSize = 40;
  static const double borderRadius = 10;
}

class AppCarousel extends StatelessWidget {
  const AppCarousel({
    super.key,
    required this.carouselTitle,
    required this.items,
    required this.onPressed,
  });

  final String carouselTitle;
  final List<SourceSummary> items;
  final void Function(SourceSummary item) onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: _InternalValues.containerSize,
      child: Container(
        margin: const EdgeInsets.only(left: Paddings.horizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCarouselTitle(),
            _buildCarousel(),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselTitle() {
    return Text(
      carouselTitle,
      style: const TextStyle(
        color: AppColors.textColor,
        fontSize: AppFontSize.h1,
      ),
    );
  }

  Widget _buildCarousel() {
    return Expanded(
      child: CarouselView(
        backgroundColor: const Color.fromARGB(0, 110, 99, 99),
        itemExtent: _InternalValues.carouselSize,
        shrinkExtent: _InternalValues.carouselSize,
        children: items.map((item) {
          return Material(
            color: const Color.fromARGB(0, 110, 99, 99),
            child: InkWell(
              onTap: () {
                //print('Carousel item tapped: ${item.name}');
                onPressed(item);
              },
              child: _buildCarouselItem(item),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCarouselItem(SourceSummary item) {
    return Container(
      margin: _buildCarouselItemMargin(),
      decoration: _buildCarouselItemBoxDecoration(),
      child: SizedBox(
        height: _InternalValues.carouselSize,
        width: _InternalValues.carouselSize,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildImage(item),
            const SizedBox(height: 10),
            _buildItemTitle(item),
          ],
        ),
      ),
    );
  }

  EdgeInsets _buildCarouselItemMargin() {
    return const EdgeInsets.fromLTRB(
      0,
      Paddings.vertical,
      _InternalValues.spaceBetweenCards,
      Paddings.vertical,
    );
  }

  BoxDecoration _buildCarouselItemBoxDecoration() {
    return BoxDecoration(
      color: AppColors.baseBgColor,
      border: Border.all(
        color: AppColors.sidelineColor,
      ),
      borderRadius: BorderRadius.circular(_InternalValues.borderRadius),
    );
  }

  Widget _buildImage(SourceSummary item) {
    return Image(
      image: NetworkImage(item.logo100px),
      width: _InternalValues.imgSize,
      height: _InternalValues.imgSize,
    );
  }

  Widget _buildItemTitle(SourceSummary item) {
    return Flexible(
      child: Text(
        item.name,
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: AppColors.textColor,
          fontSize: AppFontSize.h3,
        ),
      ),
    );
  }
}
