// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'package:academic_calendar/cubit/admin_cubit.dart';
import 'package:academic_calendar/cubit/admin_states.dart';
import 'package:academic_calendar/generated/l10n.dart';
import 'package:academic_calendar/models/event_model.dart';
import 'package:academic_calendar/modules/add_event_screen/widgets/button_widget.dart';
import 'package:academic_calendar/modules/add_event_screen/widgets/event_info_widget.dart';
import 'package:academic_calendar/modules/add_event_screen/widgets/image_container_widget.dart';
import 'package:academic_calendar/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

class EditEventDetails extends StatefulWidget {
  const EditEventDetails({super.key, required this.event});
  final EventModel event;

  @override
  State<EditEventDetails> createState() => _EditEventDetailsState();
}

class _EditEventDetailsState extends State<EditEventDetails> {
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
    AdminCubit.get(context).dateTime = '';
    AdminCubit.get(context).jHijridate = '';
    AdminCubit.get(context).dateO = '';
    namecontroller.text = widget.event.title!;
    descontroller.text = widget.event.description!;
    datecontroller.text = '${widget.event.dateJ}- ${widget.event.dateM}';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AdminCubit, AdminStates>(
      listener: (context, state) {
        if (state is SuccessUpdateEventState) {
          Navigator.pop(context);
          myToast(message: 'تم تعديل الحدث');
        }
      },
      builder: (context, state) {
        File? pickedimage = AdminCubit.get(context).pickedimage;
        Uint8List webimage = AdminCubit.get(context).webimage;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              S.of(context).evente,
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
                    if (widget.event.image != '' || pickedimage != null)
                      ImageContainerWidget(
                        size: size,
                        image: webimage != Uint8List(8) && pickedimage != null
                            ? kIsWeb
                                ? MemoryImage(webimage)
                                : FileImage(pickedimage) as ImageProvider
                            : NetworkImage(widget.event.image!),
                      ),
                    const SizedBox(
                      height: 15,
                    ),
                    ButtonWidget(
                      text: widget.event.image != "" || pickedimage != null
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
                    state is LoadingUpdateEventState
                        ? const Center(child: CircularProgressIndicator())
                        : ButtonWidget(
                            text: S.of(context).eventte,
                            onprssed: () {
                              if (formkey.currentState!.validate()) {
                                if (pickedimage != null) {
                                  AdminCubit.get(context).updateEventWithImage(
                                      title: namecontroller.text,
                                      dateJ:
                                          AdminCubit.get(context).dateTime != ''
                                              ? AdminCubit.get(context).dateTime
                                              : widget.event.dateJ!,
                                      dateM: AdminCubit.get(context)
                                                  .jHijridate !=
                                              ''
                                          ? AdminCubit.get(context).jHijridate
                                          : widget.event.dateM!,
                                      description: descontroller.text,
                                      uuid: widget.event.id!,
                                      dateO: AdminCubit.get(context).dateO != ''
                                          ? AdminCubit.get(context).dateO
                                          : widget.event.dateO!);
                                  AdminCubit.get(context).pickedimage = null;
                                  AdminCubit.get(context).webimage =
                                      Uint8List(8);
                                } else if (pickedimage == null) {
                                  AdminCubit.get(context)
                                      .updateEventWithoutImage(
                                    title: namecontroller.text,
                                    dateJ:
                                        AdminCubit.get(context).dateTime != ''
                                            ? AdminCubit.get(context).dateTime
                                            : widget.event.dateJ!,
                                    dateM:
                                        AdminCubit.get(context).jHijridate != ''
                                            ? AdminCubit.get(context).jHijridate
                                            : widget.event.dateM!,
                                    description: descontroller.text,
                                    uuid: widget.event.id!,
                                    image: widget.event.image!,
                                    dateO: AdminCubit.get(context).dateO != ''
                                        ? AdminCubit.get(context).dateO
                                        : widget.event.dateO!,
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
