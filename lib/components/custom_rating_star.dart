import 'package:flutter/material.dart';
import 'package:tt/core/utils/app_colors.dart';

class RatingStar extends StatefulWidget {
  final int starCount;
  final double rating;
  final int iconSize;
  final Function(double) onRatingChanged;

  RatingStar({
    this.starCount = 5,
    this.rating = 0.0,
    this.iconSize = 30,
    required this.onRatingChanged,
  });

  @override
  _RatingStarState createState() => _RatingStarState();
}

class _RatingStarState extends State<RatingStar> {
  late double currentRating;

  @override
  void initState() {
    super.initState();
    currentRating = widget.rating;
  }

  Widget buildStar(int index) {
    IconData icon;
    if (index >= currentRating) {
      icon = Icons.star_border;
    } else if (index > currentRating - 1 && index < currentRating) {
      icon = Icons.star_half;
    } else {
      icon = Icons.star;
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          currentRating = index + 1.0;
        });
        widget.onRatingChanged(currentRating);
      },
      child: Icon(
        icon,
        color: AppColors.starYellow,
        size: widget.iconSize.toDouble(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.starCount, (index) => buildStar(index)),
    );
  }
}
