import 'dart:ui';

import 'package:academic_calendar/cubit/admin_cubit.dart';
import 'package:academic_calendar/cubit/admin_states.dart';
import 'package:academic_calendar/generated/l10n.dart';
import 'package:academic_calendar/modules/add_event_screen/widgets/textfield_widget.dart';
import 'package:academic_calendar/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationDialogWidget extends StatefulWidget {
  const NotificationDialogWidget(
      {super.key, required this.isdark, required this.size});
  final bool isdark;
  final Size size;

  @override
  State<NotificationDialogWidget> createState() =>
      _NotificationDialogWidgetState();
}

class _NotificationDialogWidgetState extends State<NotificationDialogWidget> {
  TextEditingController controller = TextEditingController();
  bool? isloading;
  @override
  void initState() {
    isloading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminStates>(
      listener: (context, state) {
        if (state is SuccessSendNotiState) {
          myToast(message: S.of(context).messagenoti);
          Navigator.pop(context);
        }
        if (state is ErrorSendNotiState) {
          myToast(message: S.of(context).loginf);
          isloading = false;
        }
      },
      builder: (context, state) => AlertDialog(
        title: Text(
          S.of(context).sendnoti,
          style: TextStyle(
            color: !widget.isdark ? Colors.white : Colors.black,
            fontFeatures: const <FontFeature>[FontFeature.enable('aaaa')],
          ),
        ),
        content: SizedBox(
          height: 200,
          child: TextFieldWidget(
            size: widget.size,
            name: S.of(context).noti,
            icon: Icons.notifications_none_outlined,
            controller: controller,
            lines: 2,
            ontap: () {},
            textInputType: TextInputType.text,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              S.of(context).no,
              style: const TextStyle(
                fontFeatures: <FontFeature>[FontFeature.enable('aaaa')],
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              if (controller.text != '') {
                isloading = true;
                AdminCubit.get(context)
                    .pushNotificationsAllUsers(body: controller.text);
              } else {
                myToast(message: S.of(context).notit);
              }
            },
            child: isloading!
                ? const CircularProgressIndicator()
                : Text(
                    S.of(context).send,
                    style: const TextStyle(
                      fontFeatures: <FontFeature>[FontFeature.enable('aaaa')],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
