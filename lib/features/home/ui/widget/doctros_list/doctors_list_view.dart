import 'package:doctor_appointement_project/features/home/data/models/specialization_response_model.dart';
import 'package:doctor_appointement_project/features/home/ui/widget/doctros_list/doctors_listview_item.dart';
import 'package:flutter/material.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({
    super.key,
    required this.doctorsList,
  });
  final List<Doctors?> doctorsList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorsList.length,
        itemBuilder: (context, index) {
          return DoctorsListViewItem(
            doctorsItemListModel: doctorsList[index]!,
          );
        },
      ),
    );
  }
}
