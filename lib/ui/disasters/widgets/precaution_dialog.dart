import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:risk_radar/ui/disasters/disaster_enum.dart';
import 'package:risk_radar/utils/disasters_utils.dart';
import 'package:risk_radar/utils/size_extension.dart';

precautionDialog(BuildContext context, DisasterType type) {
  List<String> precautions = [
    "Prepare for a probable earthquake by creating a family plan that includes how to contact each other and where to meet.",
    "Learn how to act in the case of an earthquake by participating in simulations in your community/workplace/school.",
    "Talk to your children about what to do if there is an earthquake, and especially, what to do if they are alone when one occurs.",
    "Locate the safest places in your home/workplace/school to take shelter in an earthquake, and identify evacuation routes.",
    "Keep emergency telephone numbers close at hand (civil defense, ambulance, hospitals, fire department, police, etc.).",
    "Make sure you have sufficient emergency supplies, including clean water, non-perishable foods, prescription drugs, first aid kit, batteries, radio, and food for pets. Keep important documents such as passports or identity documents with you.",
    "Prepare an emergency backpack/kit in case you have to evacuate the area.",
    "If there is a pregnant woman in the family, prepare a pregnancy kit with medical documents, medicines, and other things that might be necessary if she is hospitalized for delivery or any complication.",
  ];
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Center(
                child: Text(
              "${getDisasterName(type)} Precautions",
              style: TextStyle(color: Colors.black, fontSize: 20),
            )),
            content: SizedBox(
                height: context.height * 0.7,
                width: context.width * 0.85,
                child: ListView.separated(
                  itemCount: precautions.length,
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
                              precautions[index],
                              textAlign: TextAlign.justify,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ))
                      ],
                    );
                  },
                )));
      });
}
