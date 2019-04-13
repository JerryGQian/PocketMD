// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:veggieseasons/data/medication.dart';
import 'package:veggieseasons/data/prescription.dart';
import 'package:veggieseasons/screens/details.dart';
import 'package:veggieseasons/styles.dart';

class PrescriptionHeadline extends StatelessWidget {
  final Prescription prescription;
  final Medication medication;

  const PrescriptionHeadline(this.prescription, this.medication);

  List<Widget> _buildSeasonDots(List<Season> seasons) {
    List<Widget> widgets = <Widget>[];

    for (Season season in seasons) {
      widgets.add(SizedBox(width: 4.0));
      widgets.add(
        Container(
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
            color: Styles.seasonColors[season],
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      );
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) => DetailsScreen(prescription.id),
            fullscreenDialog: true,
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80.0,
            height: 80.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                medication.imageAssetPath,
                semanticLabel: 'An icon showing ${medication.name}',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SizedBox(width: 8.0),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: <Widget>[
                    Text(medication.name, style: Styles.headlineName),
                  ]..addAll(_buildSeasonDots(medication.seasons)),
                ),
                Text(medication.shortDescription,
                    style: Styles.headlineDescription),
              ],
            ),
          )
        ],
      ),
    );
  }
}
