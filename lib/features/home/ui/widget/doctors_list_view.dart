import 'package:doctor_appointement_project/core/helpers/spacing.dart';
import 'package:doctor_appointement_project/core/theming/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 16.h),
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      "https://static.wikia.nocookie.net/five-world-war/images/6/64/Hisoka.jpg/revision/latest?cb=20190313114050",
                  // progressIndicatorBuilder: (context, url, downloadProgress) {
                  //   return Shimmer.fromColors(
                  //     baseColor: ColorsManager.lightGray,
                  //     highlightColor: Colors.white,
                  //     child: Container(
                  //       width: 110.w,
                  //       height: 120.h,
                  //       decoration: BoxDecoration(
                  //         shape: BoxShape.rectangle,
                  //         borderRadius: BorderRadius.circular(12.0),
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //   );
                  // },
                  imageBuilder: (context, imageProvider) => Container(
                    width: 110.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                horizontalSpace(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // doctorsModel?.name ??
                        'Name',
                        style: AppTextStyles.font18DarkBlueBold,
                        overflow: TextOverflow.ellipsis,
                      ),
                      verticalSpace(5),
                      Text(
                        // '${doctorsModel?.degree} | ${doctorsModel?.phone}',
                        'Degree | Phone',
                        style: AppTextStyles.font12GrayMedium,
                      ),
                      verticalSpace(5),
                      Text(
                        // doctorsModel?.email ??
                        'Email',
                        style: AppTextStyles.font12GrayMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
