import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

class ProductItem extends StatelessWidget {
  final String name;
  final String price;
  final String regPrice;
  final double rating;
  final String imageUrl;

  ProductItem({
    required this.name,
    required this.price,
    required this.regPrice,
    required this.rating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290.h,
      child: Card(
        color: Colors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: double.infinity,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    ),
                    errorWidget: (context, url, error) => SvgPicture.asset(
                      'assets/images/logo.svg',
                      fit: BoxFit.contain,
                      width: double.infinity,
                    )),
              ),

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp),
                // overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                SizedBox(
                    width:10.w
                ),
                Text(
                  '৳ $regPrice',
                  style: TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration
                        .lineThrough,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                    width:10.w
                ),
                Text(
                  '৳ ${price}',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),


              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: RatingBar.builder(
                initialRating: rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 10.0,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  // No-op for display purposes
                },
              ),
            ),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}

