import 'package:academic_calendar/cubit/admin_cubit.dart';
import 'package:academic_calendar/generated/l10n.dart';
import 'package:academic_calendar/modules/add_event_screen/widgets/button_widget.dart';
import 'package:academic_calendar/modules/add_event_screen/widgets/textfield_widget.dart';
import 'package:academic_calendar/shared/components.dart';
import 'package:academic_calendar/shared/constants.dart';
import 'package:flutter/material.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  TextEditingController emailcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).pass,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formkey,
          child: Center(
            child: Column(
              children: [
                Text(
                  "${S.of(context).email}:",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: myColor),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFieldWidget(
                  textInputType: TextInputType.emailAddress,
                  size: size / 2,
                  name: '',
                  icon: Icons.email_outlined,
                  controller: emailcontroller,
                  lines: 1,
                  ontap: () {},
                ),
                const Spacer(),
                Center(
                  child: ButtonWidget(
                    text: S.of(context).imaged,
                    onprssed: () {
                      if (formkey.currentState!.validate()) {
                        if (emailcontroller.text ==
                            'Abk.almalki.2015@gmail.com') {
                          AdminCubit.get(context)
                              .resetpassword(emailcontroller.text);
                          myToast(message: S.of(context).emails);
                        } else {
                          myToast(message: S.of(context).emailres);
                        }
                      }
                    },
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
