import 'package:academic_calendar/generated/l10n.dart';
import 'package:academic_calendar/models/event_model.dart';
import 'package:academic_calendar/modules/edit_event_screen/edit_event_screen.dart';
import 'package:academic_calendar/modules/event_details_screen/widgets/event_description_widget.dart';
import 'package:academic_calendar/modules/event_details_screen/widgets/event_image_widget.dart';
import 'package:academic_calendar/modules/event_details_screen/widgets/event_name_and_date_widget.dart';
import 'package:academic_calendar/shared/components.dart';
import 'package:flutter/material.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen(
      {super.key, required this.event, required this.isdark});
  final EventModel event;
  final bool isdark;

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
                    event: event,
                  ));
            },
            icon: const Icon(Icons.edit_outlined),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 10,
                ),
                EventNameAndDateWidget(event: event),
                if (event.image != '')
                  EventImageWidget(
                    image: event.image!,
                    size: size,
                  )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            EventDescriptionWidget(
              description: event.description!,
            )
          ],
        ),
      ),
    );
  }
}
