// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome;
import 'package:scoped_model/scoped_model.dart';
import 'package:pocketmd/data/app_state.dart';
import 'package:pocketmd/data/preferences.dart';
import 'package:pocketmd/screens/home.dart';
import 'package:pocketmd/screens/login.dart';
import 'package:pocketmd/styles.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    ScopedModel<AppState>(
      model: AppState(),
      child: ScopedModel<Preferences>(
        model: Preferences()..load(),
        child: CupertinoApp(
          debugShowCheckedModeBanner: false,
          color: Styles.appBackground,
          home: LoginScreen(),
        ),
      ),
    ),
  );
}
