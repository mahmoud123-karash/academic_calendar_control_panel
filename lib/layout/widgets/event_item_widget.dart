import 'package:academic_calendar/cubit/admin_cubit.dart';
import 'package:academic_calendar/cubit/admin_states.dart';
import 'package:academic_calendar/generated/l10n.dart';
import 'package:academic_calendar/layout/widgets/item_name_and_datea-widget.dart';
import 'package:academic_calendar/models/event_model.dart';
import 'package:academic_calendar/modules/event_details_screen/event_details_screen.dart';
import 'package:academic_calendar/shared/components.dart';
import 'package:academic_calendar/shared/constants.dart';
import 'package:flutter/material.dart';

class EventItemWidget extends StatelessWidget {
  const EventItemWidget(
      {super.key,
      required this.isdark,
      required this.size,
      required this.event});
  final bool isdark;
  final Size size;
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () {
          navigatorTo(
            context,
            EventDetailsScreen(
              event: event,
              isdark: isdark,
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isdark ? Colors.grey[300] : Colors.white.withOpacity(0.1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                ItemNameAndDateWidget(size: size, event: event),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          S.of(context).delete,
                          style: TextStyle(color: myColor),
                        ),
                        content: Text(S.of(context).deletem),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(S.of(context).no),
                          ),
                          State is LoadingDeleteEventState
                              ? const CircularProgressIndicator(
                                  strokeWidth: 2,
                                )
                              : TextButton(
                                  onPressed: () {
                                    AdminCubit.get(context)
                                        .removeEvent(uuid: event.id!);
                                    Navigator.pop(context);
                                  },
                                  child: Text(S.of(context).ok),
                                )
                        ],
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.delete_outlined,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
