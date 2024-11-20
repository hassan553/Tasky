import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tt/components/custom_image_handler.dart';
import 'package:tt/components/custom_loader.dart';
import 'package:tt/core/constants/app_consts.dart';
import 'package:tt/core/extension/navigation_extension.dart';
import 'package:tt/core/extension/text_extension.dart';
import 'package:tt/core/services/setup/getIt.dart';
import 'package:tt/core/utils/app_images.dart';
import 'package:tt/generated/locale_keys.g.dart';

import '../../../../components/custom_button.dart';
import '../../../../components/text_field_component.dart';
import '../../../../core/routes/app_pages.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_validation_functions.dart';
import '../../data/repo/login_repo.dart';
import '../../logic/login_cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(loginRepo: getIt<LoginRepo>()),
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.setLocale(const Locale('ar', 'EG'));
            },
          ),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageHandler(AppImages.onboarding,
                      height: height(context) * .6,
                      width: width(context),
                      fit: BoxFit.fitWidth),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Login',
                            textAlign: TextAlign.center,
                            style: context.f12400!.copyWith(
                                fontSize: 24.sp, fontWeight: FontWeight.w700)),
                        SizedBox(height: 16.h),
                        TextFieldComponent(
                          hint: 'Phone',
                          keyboardType: TextInputType.phone,
                          controller: phoneController,
                          validator: (v) =>
                              AppValidationFunctions.phoneValidationFunction(v),
                        ),
                        SizedBox(height: 20.h),
                        TextFieldComponent(
                          hint: 'Password',
                          keyboardType: TextInputType.name,
                          controller: passwordController,
                          validator: (v) =>
                              AppValidationFunctions.passwordValidationFunction(
                                  v),
                        ),
                        SizedBox(height: 40.h),
                        BlocConsumer<LoginCubit, LoginState>(
                          listener: (context, state) {
                            if (state is LoginSuccess) {
                              context.navigateToPage(AppPages.loadingPage);
                            }
                          },
                          builder: (context, state) {
                            return AnimatedCrossFade(
                                firstChild: CustomButton(
                                    text:LocaleKeys.marzouk.tr(),
                                    color: AppColors.whiteColor,
                                    onTap: () {
                                      if (formKey.currentState!.validate()) {
                                        context.read<LoginCubit>().login(
                                              password: passwordController.text
                                                  .trim(),
                                              phone:
                                                  phoneController.text.trim(),
                                            );
                                      }
                                    }),
                                secondChild: const CustomLoader(),
                                crossFadeState: state is LoginLoading
                                    ? CrossFadeState.showSecond
                                    : CrossFadeState.showFirst,
                                duration: const Duration(milliseconds: 250));
                          },
                        ),
                        SizedBox(height: 16.h),
                        Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Didn’t have any account? ',
                                style: context.f14400!
                                    .copyWith(color: AppColors.bgGrey)),
                            InkWell(
                              onTap: () =>
                                  context.navigateToPage(AppPages.register),
                              child: Text('Sign Up',
                                  style: context.f14400!
                                      .copyWith(color: AppColors.primaryColor)),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
