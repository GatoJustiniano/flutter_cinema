import 'package:flutter/material.dart';
import 'package:flutter_app_cinema/config/helpers/human_formats.dart';

class InfoRatingMovie extends StatelessWidget {
  final double? voteAverage;
  final double? popularity;

  const InfoRatingMovie({super.key, this.voteAverage, this.popularity});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return Row(
      children: [
        Icon(Icons.star_half_outlined, color: Colors.yellow.shade800),
        const SizedBox(width: 3),
        Text(HumanFormats.numberWith2decimal(voteAverage!),
            style:
                textStyles.bodyMedium?.copyWith(color: Colors.yellow.shade800)),
        const Spacer(),
        Text(HumanFormats.number(popularity!), style: textStyles.bodySmall),
      ],
    );
  }
}
