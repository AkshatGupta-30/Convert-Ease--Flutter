import 'package:convert_ease/src/model/tab.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';

class ConverterTabs extends StatelessWidget {
  final VoidCallback onTap;
  final Tabs tab;
  ConverterTabs({super.key, required this.onTap, required this.tab,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border.all(color: Colors.black38, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Iconify(tab.icon, size: 40, color: Colors.black,),
            Gap(12),
            Text(tab.label, maxLines: 2, textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
