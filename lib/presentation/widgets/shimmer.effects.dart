import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffects {
  static loadShimmer({required BuildContext context}) {
    return Shimmer.fromColors(
      child: ListView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 16.0),
            child: Container(
              height: 250,
              width: 170,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20.0),
                ),
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.shade400,
                  width: 3.1,
                ),
              ),
            ),
          );
        },
      ),
      baseColor: Colors.grey.shade100,
      highlightColor: Colors.grey.shade600,
    );
  }
}
