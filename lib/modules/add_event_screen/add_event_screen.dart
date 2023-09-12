// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'package:academic_calendar/cubit/admin_cubit.dart';
import 'package:academic_calendar/cubit/admin_states.dart';
import 'package:academic_calendar/generated/l10n.dart';
import 'package:academic_calendar/modules/add_event_screen/widgets/button_widget.dart';
import 'package:academic_calendar/modules/add_event_screen/widgets/event_info_widget.dart';
import 'package:academic_calendar/modules/add_event_screen/widgets/image_container_widget.dart';
import 'package:academic_calendar/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController datecontroller = TextEditingController();
  final TextEditingController descontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    namecontroller.dispose();
    datecontroller.dispose();
    descontroller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    AdminCubit.get(context).pickedimage = null;
    AdminCubit.get(context).webimage = Uint8List(8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AdminCubit, AdminStates>(
      listener: (context, state) {
        if (state is SuccessAddEventState) {
          Navigator.pop(context);
          myToast(message: 'تم اضافة الحدث');
          AdminCubit.get(context).pickedimage = null;
          AdminCubit.get(context).webimage = Uint8List(8);
        }
      },
      builder: (context, state) {
        File? pickedimage = AdminCubit.get(context).pickedimage;
        Uint8List webimage = AdminCubit.get(context).webimage;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              S.of(context).eventa,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (webimage != Uint8List(8) && pickedimage != null)
                      ImageContainerWidget(
                        size: size,
                        image: kIsWeb
                            ? MemoryImage(webimage)
                            : FileImage(pickedimage) as ImageProvider,
                      ),
                    const SizedBox(
                      height: 15,
                    ),
                    ButtonWidget(
                      text: webimage != Uint8List(8) && pickedimage != null
                          ? 'تغيير'
                          : 'اختر صورة',
                      onprssed: () {
                        AdminCubit.get(context).selectimage();
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    EventInfoWidget(
                      namecontroller: namecontroller,
                      datecontroller: datecontroller,
                      descontroller: descontroller,
                      size: size,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    state is LoadingAddEventState
                        ? const Center(child: CircularProgressIndicator())
                        : ButtonWidget(
                            text: S.of(context).add,
                            onprssed: () {
                              if (formkey.currentState!.validate()) {
                                if (pickedimage == null) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content: Text(S.of(context).eventwi),
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
                                                  Navigator.pop(context);
                                                  var uuid = const Uuid().v4();
                                                  AdminCubit.get(context)
                                                      .addEvenTwiyhoutImage(
                                                    title: namecontroller.text,
                                                    dateJ:
                                                        AdminCubit.get(context)
                                                            .dateTime,
                                                    dateM:
                                                        AdminCubit.get(context)
                                                            .jHijridate,
                                                    description:
                                                        descontroller.text,
                                                    uuid: uuid,
                                                  );
                                                  AdminCubit.get(context)
                                                      .pickedimage = null;
                                                  AdminCubit.get(context)
                                                      .webimage = Uint8List(8);
                                                },
                                                child: Text(S.of(context).ok),
                                              )
                                      ],
                                    ),
                                  );
                                } else {
                                  var uuid = const Uuid().v4();
                                  AdminCubit.get(context).addNewEvent(
                                    title: namecontroller.text,
                                    dateJ: AdminCubit.get(context).dateTime,
                                    dateM: AdminCubit.get(context).jHijridate,
                                    description: descontroller.text,
                                    uuid: uuid,
                                  );
                                  AdminCubit.get(context).pickedimage = null;
                                  AdminCubit.get(context).webimage =
                                      Uint8List(8);
                                }
                              }
                            },
                          )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
