// ignore_for_file: file_names

import 'package:academic_calendar/cubit/admin_cubit.dart';
import 'package:academic_calendar/generated/l10n.dart';
import 'package:academic_calendar/models/banner_model.dart';
import 'package:flutter/material.dart';

class ItemBannerWidget extends StatefulWidget {
  const ItemBannerWidget({super.key, required this.size, required this.banner});
  final Size size;
  final BannerModel banner;

  @override
  State<ItemBannerWidget> createState() => _ItemBannerWidgetState();
}

class _ItemBannerWidgetState extends State<ItemBannerWidget> {
  bool? isloading;
  @override
  void initState() {
    isloading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 200,
            width: widget.size.width < 900 ? widget.size.width / 1.7 : 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(widget.banner.image!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text(S.of(context).bannerdelete),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(S.of(context).no),
                    ),
                    TextButton(
                      onPressed: () {
                        isloading = true;
                        AdminCubit.get(context)
                            .removeBanner(uuid: widget.banner.id!);
                      },
                      child: isloading!
                          ? const CircularProgressIndicator()
                          : Text(S.of(context).ok),
                    )
                  ],
                ),
              );
            },
            icon: const Icon(Icons.delete),
          )
        ],
      ),
    );
  }
}
