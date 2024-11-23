import 'package:doctor_appointement_project/features/home/data/models/specialization_response_model.dart';
import 'package:doctor_appointement_project/features/home/ui/widget/doctors_specilaity_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  const DoctorsSpecialityListView({
    super.key,
    required this.specializationList,
  });
  final List<SpecializationsData?>? specializationList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializationList!.length,
        itemBuilder: (context, index) {
          return DoctorsSpecilaityListViewItem(
            index: index,
            specializationsData: specializationList![index]!,
          );
        },
      ),
    );
  }
}
