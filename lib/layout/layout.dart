import 'package:academic_calendar/cubit/admin_cubit.dart';
import 'package:academic_calendar/cubit/admin_states.dart';
import 'package:academic_calendar/generated/l10n.dart';
import 'package:academic_calendar/layout/widgets/Littile_control_widget.dart';
import 'package:academic_calendar/layout/widgets/date_widget.dart';
import 'package:academic_calendar/layout/widgets/drawer_widget.dart';
import 'package:academic_calendar/layout/widgets/event_item_widget.dart';
import 'package:academic_calendar/layout/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  final GlobalKey<ScaffoldState> layoutkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<AdminCubit, AdminStates>(
      builder: (context, state) {
        bool isdark = AdminCubit.get(context).isdark;
        var events = AdminCubit.get(context).events;
        return Scaffold(
          key: layoutkey,
          drawer: DrawerWidget(isdark: isdark),
          body: Row(
            children: [
              if (size.width > 900) DrawerWidget(isdark: isdark),
              Expanded(
                child: Column(
                  children: [
                    if (size.width < 900)
                      HeaderWidget(
                        size: size,
                        isdark: isdark,
                        layoutkey: layoutkey,
                      ),
                    if (size.width > 900)
                      DateWidget(isdark: isdark, size: size),
                    const ListTileControlWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    state is LoadingGetEventsState
                        ? const Center(child: CircularProgressIndicator())
                        : events.isEmpty
                            ? Center(
                                child: Text(
                                  S.of(context).empty,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            : Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListView.builder(
                                    itemBuilder: (context, index) =>
                                        EventItemWidget(
                                      isdark: isdark,
                                      size: size,
                                      event: events[index],
                                    ),
                                    itemCount: events.length,
                                  ),
                                ),
                              )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
