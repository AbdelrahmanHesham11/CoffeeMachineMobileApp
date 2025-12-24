import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/preparing_coffee_routes.dart';

void showDayNightTimePicker({
  required BuildContext context,
}) {
  final TimeOfDay time = TimeOfDay.now();
  Navigator.of(context)
      .push(
        showPicker(
          context: context,
          value: Time(hour: time.hour, minute: time.minute),
          sunrise: const TimeOfDay(hour: 6, minute: 0),
          sunset: const TimeOfDay(hour: 18, minute: 0),
          duskSpanInMinutes: 120,
          onChange: (_) {},
          showCancelButton: false,
        ),
      )
      .then((value) => Get.toNamed(PreparingCoffeeRoutes.preparingCoffee));
}
