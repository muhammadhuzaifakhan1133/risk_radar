import 'package:flutter/material.dart';
import 'package:risk_radar/utils/size_extension.dart';

Widget paymentCard(BuildContext context,
    {required String cardType,
    required String cardIcon,
    required Function() onTap,
    required bool isSelected}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: context.width * 0.8,
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(isSelected ? 1 : 0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(cardIcon),
              const SizedBox(width: 10),
              Text(
                cardType,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
          if (isSelected)
            const Icon(
              Icons.check,
              color: Colors.black,
            )
        ],
      ),
    ),
  );
}
