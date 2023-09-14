import 'dart:ui';

import 'package:academic_calendar/cubit/admin_cubit.dart';
import 'package:academic_calendar/cubit/admin_states.dart';
import 'package:academic_calendar/generated/l10n.dart';
import 'package:academic_calendar/modules/add_image_screen/widgets/Item_banner_widget.dart';
import 'package:academic_calendar/modules/add_image_screen/widgets/alert_add_banner_widget.dart';
import 'package:academic_calendar/shared/components.dart';
import 'package:academic_calendar/shared/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddImageScreen extends StatefulWidget {
  const AddImageScreen({super.key});

  @override
  State<AddImageScreen> createState() => _AddImageScreenState();
}

class _AddImageScreenState extends State<AddImageScreen> {
  final TextEditingController uriController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    uriController.dispose();
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
        if (state is SuccessAddBannerState) {
          Navigator.pop(context);
          myToast(message: S.of(context).banner);
        }
        if (state is SuccessDeleteBannerState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        bool isdark = AdminCubit.get(context).isdark;
        var banners = AdminCubit.get(context).banners;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              S.of(context).addimage,
              style: const TextStyle(
                fontFeatures: <FontFeature>[FontFeature.enable('aaaa')],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: MaterialButton(
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  color: Colors.grey[300],
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertAddBannerWidget(
                            isdark: isdark, controller: uriController));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      S.of(context).addimage,
                      style: TextStyle(
                        color: myColor,
                        fontSize: 15,
                        fontFeatures: const <FontFeature>[
                          FontFeature.enable('aaaa')
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
          body: state is LoadingGetBannersState
              ? const Center(child: CircularProgressIndicator())
              : banners.isEmpty
                  ? Center(
                      child: Text(
                        S.of(context).nobanners,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFeatures: <FontFeature>[
                            FontFeature.enable('aaaa')
                          ],
                        ),
                      ),
                    )
                  : Center(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: banners.length,
                        itemBuilder: (context, index) => ItemBannerWidget(
                          size: size,
                          banner: banners[index],
                        ),
                      ),
                    ),
        );
      },
    );
  }
}
