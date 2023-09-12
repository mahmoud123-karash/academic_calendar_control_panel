import 'package:academic_calendar/cubit/admin_cubit.dart';
import 'package:academic_calendar/generated/l10n.dart';
import 'package:academic_calendar/layout/widgets/listTile_widget.dart';
import 'package:academic_calendar/layout/widgets/notification_dialog_widget.dart';
import 'package:academic_calendar/models/shared_preference.dart';
import 'package:academic_calendar/modules/academic_year_screen/academic_year_screen.dart';
import 'package:academic_calendar/modules/add_event_screen/add_event_screen.dart';
import 'package:academic_calendar/modules/add_image_screen/add_image_screen.dart';
import 'package:academic_calendar/modules/forget_pass_screen/forget_pass_screen.dart';
import 'package:academic_calendar/modules/login_screen/login_screen.dart';
import 'package:academic_calendar/shared/assets.dart';
import 'package:academic_calendar/shared/components.dart';
import 'package:academic_calendar/shared/constants.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key, required this.isdark});
  final bool isdark;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Drawer(
      backgroundColor: isdark ? Colors.grey[200] : blackColor,
      shape: Border(
        bottom: BorderSide.none,
        top: BorderSide.none,
        left: BorderSide.merge(
          BorderSide(
              style: BorderStyle.solid,
              width: 0,
              color: isdark ? blackColor : Colors.grey),
          BorderSide(
              style: BorderStyle.solid,
              width: 0,
              color: isdark ? blackColor : Colors.grey),
        ),
      ),
      child: Column(
        children: [
          DrawerHeader(
            margin: const EdgeInsets.all(50),
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Assets.Cal2),
                      ),
                    ),
                  ),
                  Text(
                    S.of(context).title,
                    style: TextStyle(
                      color: isdark ? Colors.black : Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SwitchListTile(
            activeColor: myColor,
            inactiveTrackColor: Colors.grey[300],
            secondary: Icon(
              isdark ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            ),
            title: Text(
              S.of(context).theme,
            ),
            value: !isdark,
            onChanged: (value) {
              AdminCubit.get(context).changeAppTheme();
            },
          ),
          const SizedBox(
            height: 5,
          ),
          ListTileWidget(
            ontap: () {
              showDialog(
                context: context,
                builder: (context) => NotificationDialogWidget(
                  isdark: isdark,
                  size: size,
                ),
              );
            },
            text: S.of(context).sendnoti,
            icon: Icons.notifications_outlined,
          ),
          const SizedBox(
            height: 5,
          ),
          ListTileWidget(
            ontap: () {
              AdminCubit.get(context).getBanners();
              navigatorTo(context, const AddImageScreen());
            },
            text: S.of(context).addimage,
            icon: Icons.image_outlined,
          ),
          const SizedBox(
            height: 5,
          ),
          ListTileWidget(
            ontap: () {
              navigatorTo(context, const AcademicYearScreen());
            },
            text: S.of(context).year,
            icon: Icons.calendar_month_outlined,
          ),
          const SizedBox(
            height: 5,
          ),
          ListTileWidget(
            ontap: () {
              navigatorTo(context, const AddEventScreen());
            },
            text: S.of(context).mon,
            icon: Icons.edit_calendar_outlined,
          ),
          const SizedBox(
            height: 5,
          ),
          ListTileWidget(
            ontap: () {
              navigatorTo(context, const ForgetPassScreen());
            },
            text: S.of(context).passf,
            icon: Icons.lock_open_rounded,
          ),
          const SizedBox(
            height: 5,
          ),
          ListTileWidget(
            ontap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                    S.of(context).logout,
                    style: TextStyle(color: myColor),
                  ),
                  content: Text(S.of(context).logoutm),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(S.of(context).no),
                    ),
                    TextButton(
                      onPressed: () {
                        cache_helper.removeData(key: 'uid');
                        navigatorToAndfinish(context, const LoginScreen());
                      },
                      child: Text(S.of(context).ok),
                    )
                  ],
                ),
              );
            },
            text: S.of(context).logout,
            icon: Icons.logout_rounded,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
            child: ListTile(
              title: Text(S.of(context).profile),
              trailing: GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                  backgroundImage: AssetImage('images/pro.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
