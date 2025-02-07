import 'package:assignment/api/gen/watchmode_api.models.swagger.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../appui.dart';

class _InternalValues {
  static const double containerSize = 210;
  static const double carouselSize = 155;
  static const double spaceBetweenCards = 10;
  static const double imgSize = 40;
  static const double borderRadius = 10;
}

class AppCarouselSlider extends StatelessWidget {
  const AppCarouselSlider({
    super.key,
    required this.carouselTitle,
    required this.items,
    required this.onPressed,
  });

  final String carouselTitle;
  final List<SourceSummary> items;
  final void Function(SourceSummary item) onPressed;

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

  Widget _buildCarouselItem(SourceSummary item) {
    return Builder(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            print('Carousel item tapped: ${item.name}');
            onPressed(item);
          },
          child: Container(
            width: _InternalValues.carouselSize,
            margin: _buildCarouselItemMargin(),
            decoration: _buildCarouselItemBoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildImage(item),
                  const SizedBox(height: 10),
                  _buildItemTitle(item),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCarousel(BuildContext context) {
    return Expanded(
      child: CarouselSlider(
        options: CarouselOptions(
          height: _InternalValues.carouselSize,
          viewportFraction:
              _InternalValues.carouselSize / MediaQuery.of(context).size.width,
          enableInfiniteScroll: false,
          padEnds: false,
        ),
        items: items
            .map(
              _buildCarouselItem,
            )
            .toList(),
      ),
    );
  }

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
            Text(
              carouselTitle,
              style: const TextStyle(
                color: AppColors.textColor,
                fontSize: AppFontSize.h1,
              ),
            ),
            _buildCarousel(context),
          ],
        ),
      ),
    );
  }
}
