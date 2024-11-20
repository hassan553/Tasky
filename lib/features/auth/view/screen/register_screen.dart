import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tt/components/custom_image_handler.dart';
import 'package:tt/core/constants/app_consts.dart';
import 'package:tt/core/extension/navigation_extension.dart';
import 'package:tt/core/extension/text_extension.dart';
import 'package:tt/core/routes/app_pages.dart';
import 'package:tt/core/services/setup/getIt.dart';
import 'package:tt/core/utils/app_images.dart';
import 'package:tt/core/utils/app_validation_functions.dart';

import '../../../../components/custom_button.dart';
import '../../../../components/custom_loader.dart';
import '../../../../components/text_field_component.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/repo/Register_repo.dart';
import '../../logic/register_cubit/register_cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var displayNameController = TextEditingController();
  var experienceYearsController = TextEditingController();
  var addressController = TextEditingController();
  var levelController = TextEditingController();
  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    displayNameController.dispose();
    experienceYearsController.dispose();
    addressController.dispose();
    levelController.dispose();
    super.dispose();
  }

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(
        registerRepo: getIt<RegisterRepo>(),
      ),
      child: Scaffold(
          body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageHandler(AppImages.onboarding,
                  height: height(context) * .3,
                  width: width(context),
                  fit: BoxFit.fitWidth),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Register',
                        textAlign: TextAlign.center,
                        style: context.f12400!.copyWith(
                            fontSize: 24.sp, fontWeight: FontWeight.w700)),
                    SizedBox(height: 16.h),
                    TextFieldComponent(
                      hint: 'Name',
                      keyboardType: TextInputType.phone,
                      controller: displayNameController,
                      validator: (v) =>
                          AppValidationFunctions.stringValidationFunction(
                              v, 'Name'),
                    ),
                    SizedBox(height: 20.h),
                    TextFieldComponent(
                      hint: 'Phone',
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
                      validator: (v) =>
                          AppValidationFunctions.stringValidationFunction(
                              v, 'Phone'),
                    ),
                    SizedBox(height: 20.h),
                    TextFieldComponent(
                      hint: 'Year of Experience',
                      keyboardType: TextInputType.phone,
                      controller: experienceYearsController,
                      validator: (v) =>
                          AppValidationFunctions.stringValidationFunction(
                              v, 'Year of Experience'),
                    ),
                    SizedBox(height: 20.h),
                    TextFieldComponent(
                      hint: 'Choose Experience Level',
                      keyboardType: TextInputType.phone,
                      controller: levelController,
                      validator: (value) =>
                          AppValidationFunctions.stringValidationFunction(
                              value, 'Choose Experience Level'),
                    ),
                    SizedBox(height: 20.h),
                    TextFieldComponent(
                      hint: 'Address',
                      keyboardType: TextInputType.streetAddress,
                      controller: addressController,
                      validator: (value) =>
                          AppValidationFunctions.stringValidationFunction(
                              value, 'Address'),
                    ),
                    SizedBox(height: 20.h),
                    TextFieldComponent(
                      hint: 'Password',
                      keyboardType: TextInputType.name,
                      controller: passwordController,
                      validator: (value) =>
                          AppValidationFunctions.stringValidationFunction(
                              value, 'Address'),
                    ),
                    SizedBox(height: 40.h),
                    BlocConsumer<RegisterCubit, RegisterState>(
                      listener: (context, state) {
                        if (state is RegisterSuccess) {
                          context.navigateToPage(AppPages.loadingPage);
                        }
                      },
                      builder: (context, state) {
                        return AnimatedCrossFade(
                            firstChild: CustomButton(
                                text: 'Register',
                                color: AppColors.whiteColor,
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<RegisterCubit>().register(
                                          addressController: addressController,
                                          displayNameController:
                                              displayNameController,
                                          experienceYearsController:
                                              experienceYearsController,
                                          levelController: levelController,
                                          passwordController:
                                              passwordController,
                                          phoneController: phoneController,
                                        );
                                  }
                                }),
                            secondChild: const CustomLoader(),
                            crossFadeState: state is RegisterLoading
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
                          onTap: () {
                            context.navigateToPage(AppPages.register);
                          },
                          child: Text('Sign In',
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
