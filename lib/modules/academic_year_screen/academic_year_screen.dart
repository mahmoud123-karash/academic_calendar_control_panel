import 'package:academic_calendar/cubit/admin_cubit.dart';
import 'package:academic_calendar/cubit/admin_states.dart';
import 'package:academic_calendar/generated/l10n.dart';
import 'package:academic_calendar/layout/widgets/event_item_widget.dart';
import 'package:academic_calendar/modules/add_event_screen/widgets/textfield_widget.dart';
import 'package:academic_calendar/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AcademicYearScreen extends StatefulWidget {
  const AcademicYearScreen({super.key});

  @override
  State<AcademicYearScreen> createState() => _AcademicYearScreenState();
}

class _AcademicYearScreenState extends State<AcademicYearScreen> {
  TextEditingController searchController = TextEditingController();
  late bool isSearch;
  @override
  void initState() {
    isSearch = false;
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<AdminCubit, AdminStates>(
      builder: (context, state) {
        bool isdark = AdminCubit.get(context).isdark;
        var events = AdminCubit.get(context).searchevents;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              S.of(context).year,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: size.width / 2,
                      height: 60,
                      decoration: BoxDecoration(
                        color: isdark
                            ? Colors.grey[300]
                            : Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFieldWidget(
                            size: size,
                            name: 'العام الدراسي',
                            icon: Icons.search,
                            controller: searchController,
                            lines: 1,
                            ontap: () {},
                            textInputType: TextInputType.text),
                      ),
                    ),
                    const Spacer(),
                    MaterialButton(
                      color: Colors.grey[300],
                      onPressed: () {
                        isSearch = true;
                        AdminCubit.get(context)
                            .getSearchEvents(year: searchController.text);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          S.of(context).search,
                          style: TextStyle(color: myColor),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                !isSearch
                    ? Center(child: Text(S.of(context).searchp))
                    : state is LoadingGetEventsState
                        ? const Center(child: CircularProgressIndicator())
                        : events.isEmpty
                            ? Center(child: Text(S.of(context).research))
                            : Expanded(
                                child: ListView.builder(
                                  itemBuilder: (context, index) =>
                                      EventItemWidget(
                                    isdark: isdark,
                                    size: size,
                                    event: events[index],
                                  ),
                                  itemCount: events.length,
                                ),
                              )
              ],
            ),
          ),
        );
      },
    );
  }
}
