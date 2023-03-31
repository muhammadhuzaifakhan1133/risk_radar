import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/app/app.router.dart';
import 'package:risk_radar/model/disaster_model.dart';
import 'package:risk_radar/ui/disasters/disaster_enum.dart';
import 'package:risk_radar/utils/disasters_utils.dart';
import 'package:stacked_services/stacked_services.dart';

class DisasterCountryCard extends StatelessWidget {
  final DisasterModel disaster;
  final DisasterType type;
  const DisasterCountryCard({
    super.key,
    required this.disaster,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        locator<NavigationService>()
            .navigateToDisasterDetailView(disaster: disaster, type: type);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Image.asset(disaster.countryImage),
            SizedBox(width: 15.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  disaster.location,
                  style:
                       TextStyle(fontSize: 15.sp, color: Color(0xff090808)),
                ),
                Text(
                  disaster.locationDetail,
                  style:
                       TextStyle(fontSize: 12.sp, color: Color(0xff626060)),
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: getDisasterColor(type)),
                  child: Center(
                    child: Text(
                      "${disaster.magnitude}",
                      style:  TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                  ),
                ),
                Text(
                  "${disaster.agotime} ago",
                  style:
                       TextStyle(color: Color(0xff626060), fontSize: 12.sp),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
