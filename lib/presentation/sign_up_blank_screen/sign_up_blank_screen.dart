import 'bloc/sign_up_blank_bloc.dart';import 'models/sign_up_blank_model.dart';import 'package:flutter/material.dart';import 'package:rhs_app/core/app_export.dart';import 'package:rhs_app/core/utils/validation_functions.dart';import 'package:rhs_app/widgets/custom_checkbox_button.dart';import 'package:rhs_app/widgets/custom_elevated_button.dart';import 'package:rhs_app/widgets/custom_text_form_field.dart';import 'package:rhs_app/domain/facebookauth/facebook_auth_helper.dart';import 'package:rhs_app/domain/googleauth/google_auth_helper.dart';
// ignore_for_file: must_be_immutable
class SignUpBlankScreen extends StatelessWidget {SignUpBlankScreen({Key? key}) : super(key: key);

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

static Widget builder(BuildContext context) { return BlocProvider<SignUpBlankBloc>(create: (context) => SignUpBlankBloc(SignUpBlankState(signUpBlankModelObj: SignUpBlankModel()))..add(SignUpBlankInitialEvent()), child: SignUpBlankScreen()); } 
@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(resizeToAvoidBottomInset: false, body: Form(key: _formKey, child: Container(width: double.maxFinite, padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 11.v), child: Column(children: [CustomImageView(imagePath: ImageConstant.imgArrowLeft, height: 28.adaptSize, width: 28.adaptSize, alignment: Alignment.centerLeft, onTap: () {onTapImgArrowLeft(context);}), SizedBox(height: 84.v), Align(alignment: Alignment.centerLeft, child: SizedBox(width: 257.h, child: Text("msg_create_your_account".tr, maxLines: 2, overflow: TextOverflow.ellipsis, style: theme.textTheme.displayMedium!.copyWith(height: 1.50)))), SizedBox(height: 36.v), _buildCreateAccountForm(context), SizedBox(height: 75.v), _buildOrDivider(context), SizedBox(height: 31.v), _buildSocial(context), SizedBox(height: 66.v), Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("msg_already_have_an".tr, style: CustomTextStyles.bodyMediumGray50_1), GestureDetector(onTap: () {onTapTxtSignIn(context);}, child: Padding(padding: EdgeInsets.only(left: 8.h), child: Text("lbl_sign_in".tr, style: theme.textTheme.titleSmall)))]), SizedBox(height: 5.v)]))))); } 
/// Section Widget
Widget _buildCreateAccountForm(BuildContext context) { return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [BlocSelector<SignUpBlankBloc, SignUpBlankState, TextEditingController?>(selector: (state) => state.emailController, builder: (context, emailController) {return CustomTextFormField(controller: emailController, hintText: "lbl_email".tr, textInputType: TextInputType.emailAddress, prefix: Container(margin: EdgeInsets.fromLTRB(20.h, 20.v, 12.h, 20.v), child: CustomImageView(imagePath: ImageConstant.imgCheckmark, height: 20.adaptSize, width: 20.adaptSize)), prefixConstraints: BoxConstraints(maxHeight: 60.v), validator: (value) {if (value == null || (!isValidEmail(value, isRequired: true))) {return "err_msg_please_enter_valid_email".tr;} return null;}, contentPadding: EdgeInsets.only(top: 21.v, right: 30.h, bottom: 21.v));}), SizedBox(height: 20.v), BlocBuilder<SignUpBlankBloc, SignUpBlankState>(builder: (context, state) {return CustomTextFormField(controller: state.passwordController, hintText: "lbl_password".tr, textInputAction: TextInputAction.done, textInputType: TextInputType.visiblePassword, prefix: Container(margin: EdgeInsets.fromLTRB(20.h, 20.v, 12.h, 20.v), child: CustomImageView(imagePath: ImageConstant.imgLock, height: 20.adaptSize, width: 20.adaptSize)), prefixConstraints: BoxConstraints(maxHeight: 60.v), suffix: InkWell(onTap: () {context.read<SignUpBlankBloc>().add(ChangePasswordVisibilityEvent(value: !state.isShowPassword));}, child: Container(margin: EdgeInsets.fromLTRB(30.h, 20.v, 20.h, 20.v), child: CustomImageView(imagePath: ImageConstant.imgDashboard, height: 20.adaptSize, width: 20.adaptSize))), suffixConstraints: BoxConstraints(maxHeight: 60.v), validator: (value) {if (value == null || (!isValidPassword(value, isRequired: true))) {return "err_msg_please_enter_valid_password".tr;} return null;}, obscureText: state.isShowPassword, contentPadding: EdgeInsets.symmetric(vertical: 21.v));}), SizedBox(height: 20.v), BlocSelector<SignUpBlankBloc, SignUpBlankState, bool?>(selector: (state) => state.rememberme, builder: (context, rememberme) {return CustomCheckboxButton(text: "lbl_remember_me".tr, value: rememberme, padding: EdgeInsets.symmetric(vertical: 3.v), onChange: (value) {context.read<SignUpBlankBloc>().add(ChangeCheckBoxEvent(value: value));});}), SizedBox(height: 20.v), CustomElevatedButton(text: "lbl_sign_up2".tr, onPressed: () {onTapSignUp(context);})]); } 
/// Section Widget
Widget _buildOrDivider(BuildContext context) { return Padding(padding: EdgeInsets.symmetric(horizontal: 10.h), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.end, children: [Padding(padding: EdgeInsets.only(top: 11.v, bottom: 9.v), child: SizedBox(width: 96.h, child: Divider())), Text("msg_or_continue_with".tr, style: CustomTextStyles.titleMediumGray50), Padding(padding: EdgeInsets.only(top: 11.v, bottom: 9.v), child: SizedBox(width: 96.h, child: Divider()))])); } 
/// Section Widget
Widget _buildSocial(BuildContext context) { return Padding(padding: EdgeInsets.symmetric(horizontal: 38.h), child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Container(height: 60.v, width: 88.h, padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 17.v), decoration: AppDecoration.outlineGray.copyWith(borderRadius: BorderRadiusStyle.roundedBorder16), child: CustomImageView(imagePath: ImageConstant.imgLogosfacebook, height: 24.adaptSize, width: 24.adaptSize, alignment: Alignment.center, onTap: () {onTapImgLogosFacebook(context);})), Container(height: 60.v, width: 87.h, margin: EdgeInsets.only(left: 20.h), padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 17.v), decoration: AppDecoration.outlineGray.copyWith(borderRadius: BorderRadiusStyle.roundedBorder16), child: CustomImageView(imagePath: ImageConstant.imgFrame, height: 24.adaptSize, width: 24.adaptSize, alignment: Alignment.center, onTap: () {onTapImgImage(context);})), Container(height: 60.v, width: 88.h, margin: EdgeInsets.only(left: 20.h), padding: EdgeInsets.symmetric(horizontal: 31.h, vertical: 17.v), decoration: AppDecoration.outlineGray.copyWith(borderRadius: BorderRadiusStyle.roundedBorder16), child: CustomImageView(imagePath: ImageConstant.imgFrameWhiteA700, height: 24.adaptSize, width: 24.adaptSize, alignment: Alignment.center))])); } 

/// Navigates to the previous screen.
onTapImgArrowLeft(BuildContext context) { NavigatorService.goBack(); } 
/// Navigates to the fillProfileScreen when the action is triggered.
onTapSignUp(BuildContext context) { NavigatorService.pushNamed(AppRoutes.fillProfileScreen, ); } 
/// Performs a Facebook sign-in and returns a [FacebookUser] object.
///
/// If the sign-in is successful, the [onSuccess] callback will be called with
/// a TODO comment needed to be modified by you.
/// If the sign-in fails, the [onError] callback will be called with the error message.
///
/// Throws an exception if the Facebook sign-in process fails.
onTapImgLogosFacebook(BuildContext context) async  {             await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
              //TODO Actions to be performed after signin
              }).catchError((onError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(onError.toString())));
            });
             } 
/// Performs a Google sign-in and returns a [GoogleUser] object.
///
/// If the sign-in is successful, the [onSuccess] callback will be called with
/// a TODO comment needed to be modified by you.
/// If the sign-in fails, the [onError] callback will be called with the error message.
///
/// Throws an exception if the Google sign-in process fails.
onTapImgImage(BuildContext context) async  {         await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
          if(googleUser!=null){
            //TODO Actions to be performed after signin
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('user data is empty')));
          }
        }).catchError((onError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(onError.toString())));
        });
         } 
/// Navigates to the fillProfileScreen when the action is triggered.
onTapTxtSignIn(BuildContext context) { NavigatorService.pushNamed(AppRoutes.fillProfileScreen, ); } 
 }
