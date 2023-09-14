import 'package:academic_calendar/cubit/admin_cubit.dart';
import 'package:academic_calendar/generated/l10n.dart';
import 'package:academic_calendar/modules/add_event_screen/widgets/button_widget.dart';
import 'package:academic_calendar/shared/components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AlertAddBannerWidget extends StatefulWidget {
  const AlertAddBannerWidget(
      {super.key, required this.isdark, required this.controller});
  final bool isdark;
  final TextEditingController controller;

  @override
  State<AlertAddBannerWidget> createState() => _AlertAddBannerWidgetState();
}

class _AlertAddBannerWidgetState extends State<AlertAddBannerWidget> {
  bool? isloading;
  @override
  void initState() {
    isloading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        S.of(context).addimage,
        style: TextStyle(color: widget.isdark ? Colors.black : Colors.white),
      ),
      content: Column(
        children: [
          SizedBox(
            width: 300,
            child: TextFormField(
              controller: widget.controller,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                label: Text(S.of(context).uri),
                prefixIcon: const Icon(Icons.file_upload_sharp),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ButtonWidget(
            text: AdminCubit.get(context).pickedimage != null
                ? S.of(context).change
                : S.of(context).image,
            onprssed: () {
              AdminCubit.get(context).selectimage();
            },
          ),
          const SizedBox(
            height: 15,
          ),
          if (AdminCubit.get(context).pickedimage != null)
            Container(
              width: 300,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: AdminCubit.get(context).pickedimage != null
                        ? MemoryImage(AdminCubit.get(context).webimage)
                        : FileImage(AdminCubit.get(context).pickedimage!)
                            as ImageProvider,
                    fit: BoxFit.cover),
              ),
            )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            widget.controller.clear();
            AdminCubit.get(context).pickedimage = null;
            AdminCubit.get(context).webimage = Uint8List(8);
            Navigator.pop(context);
          },
          child: Text(S.of(context).no),
        ),
        TextButton(
          onPressed: () {
            if (widget.controller.text != '') {
              var uuid = const Uuid().v4();
              if (AdminCubit.get(context).pickedimage != null) {
                isloading = true;
                AdminCubit.get(context)
                    .addNewBanner(uri: widget.controller.text, uuid: uuid);
                AdminCubit.get(context).pickedimage = null;
                AdminCubit.get(context).webimage = Uint8List(8);
                widget.controller.clear();
              } else {
                myToast(message: S.of(context).imagei);
              }
            } else {
              myToast(message: S.of(context).urii);
            }
          },
          child: isloading!
              ? const CircularProgressIndicator()
              : Text(S.of(context).add),
        )
      ],
    );
  }
}
