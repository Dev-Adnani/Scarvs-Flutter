import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffects {
  static final Color _shimmerColor = Colors.grey[200]!;
  static final Color _shimmerColorDark = Colors.grey[500]!;
  static const double _spaceHeight = 10;

  static loadShimmer({required BuildContext context}) {
    return Shimmer.fromColors(
      child: ListView.builder(
        physics: const ScrollPhysics(),
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
      baseColor: _shimmerColor,
      highlightColor: _shimmerColorDark,
    );
  }

  static buildCategoryShimmer({required BuildContext context}) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      primary: false,
      childAspectRatio: 5 / 8,
      shrinkWrap: true,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      crossAxisCount: 2,
      children: List.generate(8, (index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
          color: Colors.white,
          child: Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: Colors.grey.shade100,
            period: const Duration(milliseconds: 1000),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Container(
                    width:
                        (((MediaQuery.of(context).size.width) - 24) / 2 - 12),
                    height:
                        (((MediaQuery.of(context).size.width) - 24) / 2 - 12),
                    color: _shimmerColor,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: _shimmerColor,
                        ),
                        height: 12,
                      ),
                      const SizedBox(
                        height: _spaceHeight,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: _shimmerColor,
                        ),
                        height: 12,
                      ),
                      const SizedBox(
                        height: _spaceHeight,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
