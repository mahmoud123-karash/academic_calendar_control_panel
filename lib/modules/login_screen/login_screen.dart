import 'dart:ui';

import 'package:academic_calendar/cubit/admin_cubit.dart';
import 'package:academic_calendar/cubit/admin_states.dart';
import 'package:academic_calendar/generated/l10n.dart';
import 'package:academic_calendar/layout/layout.dart';
import 'package:academic_calendar/models/shared_preference.dart';
import 'package:academic_calendar/modules/forget_pass_screen/forget_pass_screen.dart';
import 'package:academic_calendar/modules/login_screen/widgets/login_button_widget.dart';
import 'package:academic_calendar/shared/components.dart';
import 'package:academic_calendar/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailcontroller.dispose();
    passcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<AdminCubit, AdminStates>(
      listener: (context, state) {
        if (state is ErrorLoginState) {
          myToast(message: S.of(context).loginf);
        }
        if (state is SuccessLoginState) {
          navigatorToAndfinish(context, const LayoutScreen());
          myToast(message: S.of(context).logins);
          cache_helper.saveData(key: 'uid', value: state.uid);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).title),
            centerTitle: true,
          ),
          body: Center(
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/cal2.png'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      S.of(context).login,
                      style: TextStyle(
                          color: myColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: size.width / 2,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return S.of(context).validate;
                          }
                          return null;
                        },
                        controller: emailcontroller,
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                              fontFeatures: <FontFeature>[
                                FontFeature.enable('aaaa')
                              ],
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                          labelText: S.of(context).email,
                          prefixIcon: const Icon(Icons.email_outlined),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: size.width / 2,
                      child: TextFormField(
                        controller: passcontroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return S.of(context).validate;
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: AdminCubit.get(context).hiddenPass,
                        decoration: InputDecoration(
                          labelText: S.of(context).passl,
                          labelStyle: const TextStyle(
                            fontFeatures: <FontFeature>[
                              FontFeature.enable('aaaa')
                            ],
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: myColor,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              AdminCubit.get(context).makeThePassecure();
                            },
                            icon: AdminCubit.get(context).hiddenPass
                                ? Icon(
                                    Icons.visibility_off,
                                    color: myColor,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: myColor,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: size.width / 2,
                      child: state is LoadingLoginState
                          ? const Center(child: CircularProgressIndicator())
                          : LoginButtonWidget(
                              onpressed: () {
                                if (formkey.currentState!.validate()) {
                                  if (emailcontroller.text ==
                                      'Abk.almalki.2015@gmail.com') {
                                    AdminCubit.get(context).loginUser(
                                        email: emailcontroller.text,
                                        password: passcontroller.text);
                                  } else {
                                    myToast(message: S.of(context).loginf);
                                  }
                                }
                              },
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        navigatorTo(context, const ForgetPassScreen());
                      },
                      child: Text(
                        S.of(context).fpass,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: myColor,
                          decoration: TextDecoration.underline,
                          fontFeatures: const <FontFeature>[
                            FontFeature.enable('aaaa')
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
