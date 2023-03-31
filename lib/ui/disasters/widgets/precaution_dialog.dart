import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk_radar/ui/disasters/disaster_enum.dart';
import 'package:risk_radar/utils/disasters_utils.dart';
import 'package:risk_radar/utils/size_extension.dart';

precautionDialog(BuildContext context, DisasterType type,
    {bool isPrecaution = true}) {
  List<String> earthquakePrecautions = [
    "Prepare for a probable earthquake by creating a family plan that includes how to contact each other and where to meet.",
    "Learn how to act in the case of an earthquake by participating in simulations in your community/workplace/school.",
    "Talk to your children about what to do if there is an earthquake, and especially, what to do if they are alone when one occurs.",
    "Locate the safest places in your home/workplace/school to take shelter in an earthquake, and identify evacuation routes.",
    "Keep emergency telephone numbers close at hand (civil defense, ambulance, hospitals, fire department, police, etc.).",
    "Make sure you have sufficient emergency supplies, including clean water, non-perishable foods, prescription drugs, first aid kit, batteries, radio, and food for pets. Keep important documents such as passports or identity documents with you.",
    "Prepare an emergency backpack/kit in case you have to evacuate the area.",
    "If there is a pregnant woman in the family, prepare a pregnancy kit with medical documents, medicines, and other things that might be necessary if she is hospitalized for delivery or any complication.",
  ];
  List<String> otherPrecautions = [
    "Stay informed: Keep an eye on weather reports and flood warnings in your area. You can do that through News on homepage.",
    "Plan ahead: Create an emergency plan and discuss it with your family members. Make sure you know how to turn off your gas, electricity, and water supplies.",
    "Prepare an emergency kit: Keep a kit that includes important documents, a first aid kit, non-perishable food, and water in case you need to evacuate.",
    "Move to higher ground: If you live in a flood-prone area, move to higher ground if you can. Avoid low-lying areas, and do not attempt to drive through flooded areas.",
    "Secure your property: Secure your property by moving important items to higher levels or elevating them off the ground. Sandbags can also be used to prevent water from entering your home.",
    "Evacuate if necessary: If authorities tell you to evacuate, do so immediately. Do not wait until the last minute, and follow designated evacuation routes.",
  ];
  List<String> earthquakeSafetyMeasures = [
    "Drop, Cover, and Hold On: If you are indoors, drop to the ground, take cover under a sturdy desk or table, and hold on until the shaking stops.",
    "Stay away from windows: Stay away from windows, as they can shatter and cause injury.",
    "Move to a clear area: If you are outdoors, move to a clear area away from buildings, trees, and power lines.",
    "Protect your head: If you are unable to get under a desk or table, protect your head and neck with your arms and take cover against an interior wall.",
    "Stay inside: Do not try to run outside during an earthquake, as there may be falling debris or other hazards.",
    "Turn off gas and electricity: If you smell gas or see sparks, turn off gas and electricity supplies to your home or workplace to reduce the risk of fire and electrocution.",
    "Stay calm: Try to remain calm and reassure others, especially children.",
    "Follow official instructions: Listen to local authorities and follow their instructions.",
    "Check for injuries: After the earthquake, check yourself and others for injuries, and provide first aid if necessary.",
    "Avoid using elevators: Do not use elevators during or immediately after an earthquake, as they may stop working or become unsafe to use. Use stairs instead.",
  ];

  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Center(
                child: Text(
              "${getDisasterName(type)} ${isPrecaution ? "Precautions" : "Safety Measures"}",
              style: TextStyle(color: Colors.black, fontSize: 20.sp),
            )),
            content: SizedBox(
                height: context.height * 0.7,
                width: context.width * 0.85,
                child: ListView.separated(
                  itemCount: type != DisasterType.earthquake
                      ? otherPrecautions.length
                      : isPrecaution
                          ? earthquakePrecautions.length
                          : earthquakeSafetyMeasures.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("•"),
                        const SizedBox(width: 10),
                        SizedBox(
                            width: context.width * 0.6,
                            child: Text(
                              type != DisasterType.earthquake
                                  ? otherPrecautions[index]
                                  : isPrecaution
                                      ? earthquakePrecautions[index]
                                      : earthquakeSafetyMeasures[index],
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.sp),
                            ))
                      ],
                    );
                  },
                )));
      });
}
