import 'package:doctor_appointement_project/features/home/data/models/specialization_response_model.dart';
import 'package:doctor_appointement_project/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_appointement_project/features/home/ui/widget/specializations_list/specilaity_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityListView extends StatefulWidget {
  const SpecialityListView({
    super.key,
    required this.specializationList,
  });
  final List<SpecializationsData?>? specializationList;

  @override
  State<SpecialityListView> createState() => _SpecialityListViewState();
}

class _SpecialityListViewState extends State<SpecialityListView> {
  var selectedSpecializationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationList!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedSpecializationIndex = index;
              });
              context.read<HomeCubit>().getDoctorsData(
                    specializationId: widget.specializationList![index]!.id!,
                  );
            },
            child: SpecialityListViewItem(
              itemIndex: index,
              selectedIndex: selectedSpecializationIndex,
              specializationsData: widget.specializationList![index]!,
            ),
          );
        },
      ),
    );
  }
}
