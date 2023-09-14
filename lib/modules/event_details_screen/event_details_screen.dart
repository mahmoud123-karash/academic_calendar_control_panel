import 'package:academic_calendar/cubit/admin_cubit.dart';
import 'package:academic_calendar/generated/l10n.dart';
import 'package:academic_calendar/models/event_model.dart';
import 'package:academic_calendar/modules/edit_event_screen/edit_event_screen.dart';
import 'package:academic_calendar/modules/event_details_screen/widgets/event_image_widget.dart';
import 'package:academic_calendar/modules/event_details_screen/widgets/event_name_and_date_widget.dart';
import 'package:academic_calendar/shared/components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen(
      {super.key, required this.event, required this.isdark});
  final EventModel event;
  final bool isdark;

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  @override
  void initState() {
    AdminCubit.get(context).pickedimage = null;
    AdminCubit.get(context).webimage = Uint8List(8);
    AdminCubit.get(context).dateTime = '';
    AdminCubit.get(context).jHijridate = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).eventd),
        actions: [
          IconButton(
            onPressed: () {
              navigatorTo(
                context,
                EditEventDetails(
                  event: widget.event,
                ),
              );
            },
            icon: const Icon(Icons.edit_outlined),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            if (widget.event.image != '')
              EventImageWidget(
                image: widget.event.image!,
                size: size,
              ),
            const SizedBox(
              height: 20,
            ),
            EventNameAndDateWidget(
              event: widget.event,
            ),
          ],
        ),
      ),
    );
  }
}
