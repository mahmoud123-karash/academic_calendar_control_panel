class AdminStates {}

class InitialAdminState extends AdminStates {}

class MyFunctionState extends AdminStates {}

class ChangeAppThemeState extends AdminStates {}

class HiddenPassState extends AdminStates {}

//pick image
class LoadingPickImageState extends AdminStates {}

class SuccessPickImageState extends AdminStates {}

class ErrorPickImageState extends AdminStates {}

//login
class LoadingLoginState extends AdminStates {}

class SuccessLoginState extends AdminStates {
  final String uid;

  SuccessLoginState({required this.uid});
}

class ErrorLoginState extends AdminStates {}

//reset pass
class LoadingResetPassState extends AdminStates {}

class SuccessResetPassState extends AdminStates {}

class ErrorResetPassState extends AdminStates {}

//add event
class LoadingAddEventState extends AdminStates {}

class SuccessAddEventState extends AdminStates {}

class ErrorAddEventState extends AdminStates {}

//get events
class LoadingGetEventsState extends AdminStates {}

class SuccessGetEventsState extends AdminStates {}

//remove event
class LoadingDeleteEventState extends AdminStates {}

class SuccessDeleteEventState extends AdminStates {}

class ErrorDeleteEventState extends AdminStates {}

//update event
class LoadingUpdateEventState extends AdminStates {}

class SuccessUpdateEventState extends AdminStates {}

class ErrorUpdateEventState extends AdminStates {}

//add banner
class LoadingAddBannerState extends AdminStates {}

class SuccessAddBannerState extends AdminStates {}

class ErrorAddBannerState extends AdminStates {}

//get banners
class LoadingGetBannersState extends AdminStates {}

class SuccessGetBannersState extends AdminStates {}

//remove banner
class LoadingDeleteBannerState extends AdminStates {}

class SuccessDeleteBannerState extends AdminStates {}

class ErrorDeleteBannerState extends AdminStates {}

//remove banner
class LoadingSendNotiState extends AdminStates {}

class SuccessSendNotiState extends AdminStates {}

class ErrorSendNotiState extends AdminStates {}
