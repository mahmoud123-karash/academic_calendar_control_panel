import 'dart:convert';
import 'dart:io';
import 'package:academic_calendar/cubit/admin_states.dart';
import 'package:academic_calendar/models/banner_model.dart';
import 'package:academic_calendar/models/event_model.dart';
import 'package:academic_calendar/models/shared_preference.dart';
import 'package:academic_calendar/shared/components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jhijri/jHijri.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:http/http.dart' as http;

class AdminCubit extends Cubit<AdminStates> {
  AdminCubit() : super(InitialAdminState());
  static AdminCubit get(context) => BlocProvider.of(context);

  void myfunction() {
    emit(MyFunctionState());
  }

  bool isdark = false;
  void changeAppTheme({bool? fromSP}) {
    if (fromSP != null) {
      isdark = fromSP;
    } else {
      isdark = !isdark;
      cache_helper.saveData(key: 'isdark', value: isdark);
    }
    emit(ChangeAppThemeState());
  }

  ImagePicker imagePicker = ImagePicker();
  File? pickedimage;
  Uint8List webimage = Uint8List(8);

  void selectimage() async {
    if (!kIsWeb) {
      emit(LoadingPickImageState());
      XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        pickedimage = File(image.path);
        emit(SuccessPickImageState());
      } else {
        if (kDebugMode) {
          print('No Image is picked');
        }
        emit(ErrorPickImageState());
      }
    } else if (kIsWeb) {
      emit(LoadingPickImageState());
      XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        webimage = await image.readAsBytes();
        pickedimage = File('a');
        emit(SuccessPickImageState());
      } else {
        if (kDebugMode) {
          print('No Image is picked');
        }
        emit(ErrorPickImageState());
      }
    } else {
      if (kDebugMode) {
        print('try again');
      }
      emit(ErrorPickImageState());
    }
  }

  bool hiddenPass = true;
  void makeThePassecure() {
    hiddenPass = !hiddenPass;
    emit(HiddenPassState());
  }

  void loginUser({required String email, required String password}) {
    emit(LoadingLoginState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(SuccessLoginState(uid: value.user!.uid));
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(ErrorLoginState());
    });
  }

  void resetpassword(String email) {
    emit(LoadingResetPassState());
    FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) {
      emit(SuccessResetPassState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(ErrorResetPassState());
    });
  }

  String jHijridate = '';
  String dateTime = '';
  String dateO = '';
  String year = JHijri.now().year.toString();

  void addNewEvent({
    required String title,
    required String dateJ,
    required String dateM,
    required String description,
    required String uuid,
    required String dateO,
  }) {
    emit(LoadingAddEventState());
    if (!kIsWeb) {
      firebase_storage.FirebaseStorage.instance
          .ref()
          .child('events')
          .child('$uuid.jpg')
          .putFile(pickedimage!)
          .then((p0) {
        p0.ref.getDownloadURL().then((value) {
          EventModel model = EventModel(
            title: title,
            image: pickedimage == null ? '' : value,
            id: uuid,
            description: description,
            dateJ: dateJ,
            dateM: dateM,
            dateO: dateO,
          );
          FirebaseFirestore.instance
              .collection(year)
              .doc(uuid)
              .set(model.tomap())
              .then((value) {
            emit(SuccessAddEventState());
          });
        }).catchError((onError) {
          if (kDebugMode) {
            print(onError.toString());
          }
          emit(ErrorAddEventState());
        });
      }).catchError((onError) {
        if (kDebugMode) {
          print(onError.toString());
        }
        emit(ErrorAddEventState());
      });
    } else if (kIsWeb) {
      firebase_storage.FirebaseStorage.instance
          .ref()
          .child('events')
          .child('$uuid.jpg')
          .putData(webimage)
          .then((p0) {
        p0.ref.getDownloadURL().then((value) {
          EventModel model = EventModel(
            title: title,
            image: value,
            id: uuid,
            description: description,
            dateJ: dateJ,
            dateM: dateM,
            dateO: dateO,
          );
          FirebaseFirestore.instance
              .collection(year)
              .doc(uuid)
              .set(model.tomap())
              .then((value) {
            emit(SuccessAddEventState());
          });
        }).catchError((onError) {
          if (kDebugMode) {
            print(onError.toString());
          }
          emit(ErrorAddEventState());
        });
      }).catchError((onError) {
        if (kDebugMode) {
          print(onError.toString());
        }
        emit(ErrorAddEventState());
      });
    }
  }

  void addEvenTwiyhoutImage(
      {required String title,
      required String dateJ,
      required String dateM,
      required String description,
      required String uuid,
      required String dateO}) {
    emit(LoadingAddEventState());
    EventModel model = EventModel(
      title: title,
      image: '',
      id: uuid,
      description: description,
      dateJ: dateJ,
      dateM: dateM,
      dateO: dateO,
    );
    FirebaseFirestore.instance
        .collection(year)
        .doc(uuid)
        .set(model.tomap())
        .then((value) {
      emit(SuccessAddEventState());
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError.toString());
      }
      emit(ErrorAddEventState());
    });
  }

  List<EventModel> events = [];

  void getEvents() {
    emit(LoadingGetEventsState());
    FirebaseFirestore.instance
        .collection(year)
        .orderBy('dateO', descending: false)
        .snapshots()
        .listen((event) {
      events = [];
      for (var element in event.docs) {
        events.add(EventModel.fromjson(element.data()));
      }
      emit(SuccessGetEventsState());
    });
  }

  void removeEvent({required String uuid}) {
    emit(LoadingDeleteEventState());
    FirebaseFirestore.instance
        .collection(year)
        .doc(uuid)
        .delete()
        .then((value) {
      myToast(message: 'تم مسح الحدث');
      emit(SuccessDeleteEventState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(ErrorDeleteEventState());
    });
  }

  void updateEventWithImage(
      {required String title,
      required String dateJ,
      required String dateM,
      required String description,
      required String uuid,
      required String dateO}) {
    emit(LoadingUpdateEventState());
    if (kIsWeb) {
      firebase_storage.FirebaseStorage.instance
          .ref()
          .child('events')
          .child('$uuid.jpg')
          .putData(webimage)
          .then((value) {
        value.ref.getDownloadURL().then((value) {
          EventModel model = EventModel(
            title: title,
            image: value,
            id: uuid,
            description: description,
            dateJ: dateJ,
            dateM: dateM,
            dateO: dateO,
          );
          FirebaseFirestore.instance
              .collection(year)
              .doc(uuid)
              .update(model.tomap())
              .then((value) {
            emit(SuccessUpdateEventState());
          });
        }).catchError((error) {
          if (kDebugMode) {
            print(error);
          }
          emit(ErrorUpdateEventState());
        });
      }).catchError((error) {
        if (kDebugMode) {
          print(error);
        }
        emit(ErrorUpdateEventState());
      });
    } else if (!kIsWeb) {
      firebase_storage.FirebaseStorage.instance
          .ref()
          .child('events')
          .child('$uuid.jpg')
          .putFile(pickedimage!)
          .then((value) {
        value.ref.getDownloadURL().then((value) {
          EventModel model = EventModel(
            title: title,
            image: value,
            id: uuid,
            description: description,
            dateJ: dateJ,
            dateM: dateM,
            dateO: dateO,
          );
          FirebaseFirestore.instance
              .collection(year)
              .doc(uuid)
              .update(model.tomap())
              .then((value) {
            emit(SuccessUpdateEventState());
          });
        }).catchError((error) {
          if (kDebugMode) {
            print(error);
          }
          emit(ErrorUpdateEventState());
        });
      }).catchError((error) {
        if (kDebugMode) {
          print(error);
        }
        emit(ErrorUpdateEventState());
      });
    }
  }

  void updateEventWithoutImage({
    required String title,
    required String dateJ,
    required String dateM,
    required String description,
    required String uuid,
    required String image,
    required String dateO,
  }) {
    emit(LoadingUpdateEventState());
    EventModel model = EventModel(
        title: title,
        image: image,
        id: uuid,
        description: description,
        dateJ: dateJ,
        dateM: dateM,
        dateO: dateO);
    FirebaseFirestore.instance
        .collection(year)
        .doc(uuid)
        .update(model.tomap())
        .then((value) {
      emit(SuccessUpdateEventState());
    }).catchError(
      (error) {
        if (kDebugMode) {
          print(error);
        }
        emit(ErrorUpdateEventState());
      },
    );
  }

  List<EventModel> searchevents = [];

  void getSearchEvents({required String year}) {
    emit(LoadingGetEventsState());
    FirebaseFirestore.instance
        .collection(year)
        .orderBy('dateO', descending: false)
        .snapshots()
        .listen((event) {
      searchevents = [];
      for (var element in event.docs) {
        searchevents.add(EventModel.fromjson(element.data()));
      }
      emit(SuccessGetEventsState());
    });
  }

  void addNewBanner({
    required String uri,
    required String uuid,
  }) {
    emit(LoadingAddBannerState());
    if (!kIsWeb) {
      firebase_storage.FirebaseStorage.instance
          .ref()
          .child('banners')
          .child('$uuid.jpg')
          .putFile(pickedimage!)
          .then((p0) {
        p0.ref.getDownloadURL().then((value) {
          BannerModel model = BannerModel(image: value, id: uuid, uri: uri);
          FirebaseFirestore.instance
              .collection('banners')
              .doc(uuid)
              .set(model.tomap())
              .then((value) {
            emit(SuccessAddBannerState());
          });
        }).catchError((onError) {
          if (kDebugMode) {
            print(onError.toString());
          }
          emit(ErrorAddBannerState());
        });
      }).catchError((onError) {
        if (kDebugMode) {
          print(onError.toString());
        }
        emit(ErrorAddBannerState());
      });
    } else if (kIsWeb) {
      firebase_storage.FirebaseStorage.instance
          .ref()
          .child('banners')
          .child('$uuid.jpg')
          .putData(webimage)
          .then((p0) {
        p0.ref.getDownloadURL().then((value) {
          BannerModel model = BannerModel(image: value, id: uuid, uri: uri);
          FirebaseFirestore.instance
              .collection('banners')
              .doc(uuid)
              .set(model.tomap())
              .then((value) {
            emit(SuccessAddBannerState());
          });
        }).catchError((onError) {
          if (kDebugMode) {
            print(onError.toString());
          }
          emit(ErrorAddBannerState());
        });
      }).catchError((onError) {
        if (kDebugMode) {
          print(onError.toString());
        }
        emit(ErrorAddBannerState());
      });
    }
  }

  List<BannerModel> banners = [];

  void getBanners() {
    emit(LoadingGetBannersState());
    FirebaseFirestore.instance
        .collection('banners')
        .snapshots()
        .listen((event) {
      banners = [];
      for (var element in event.docs) {
        banners.add(BannerModel.fromjson(element.data()));
      }
      emit(SuccessGetBannersState());
    });
  }

  void removeBanner({required String uuid}) {
    emit(LoadingDeleteBannerState());
    FirebaseFirestore.instance
        .collection("banners")
        .doc(uuid)
        .delete()
        .then((value) {
      myToast(message: 'تم مسح الإعلان');
      emit(SuccessDeleteBannerState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(ErrorDeleteBannerState());
    });
  }

  void pushNotificationsAllUsers({
    required String body,
  }) {
    emit(LoadingSendNotiState());
    http
        .post(
      Uri.parse('https://notification-api-u90s.onrender.com/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({"body": body}),
    )
        .then((value) {
      if (value.statusCode == 200) {
        emit(SuccessSendNotiState());
      } else {
        emit(ErrorSendNotiState());
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  void logout() {
    pickedimage = null;
    webimage = Uint8List(8);
    emit(SuccessLogoutState());
  }
}
