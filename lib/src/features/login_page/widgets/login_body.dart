import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:regalo/src/features/home_page/screens/home_page.dart';

import '../../../core/constants/constants.dart';
import '../../../core/notifications/local_notification.dart';
import '../../../core/shared/components.dart';
import '../../restore_password/screens/restore_password.dart';
import '../../register_page/screens/register_page.dart';
import '../controller/cubit/login_cubit.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key, required this.height}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          print('login successful');
        }
      },
      builder: (context, state) {
        var loginCubit = LoginCubit.get(context);
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15.w),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: height),
                    // Logo
                    Image.asset('assets/images/login.png'),
                    SizedBox(height: height),
                    //Username Form Field
                    defaultFormField(
                      controller: userNameController,
                      label: 'اسم المستخدم',
                      prefix: FontAwesomeIcons.user,
                      prefixIconSize: 10.sp,
                      validate: (value) {
                        if (value!.length < 0) {
                          return 'من فضلك ادخل اسم حسابك';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height,
                    ),
                    //Password Form Field
                    defaultFormField(
                      maxLength: 15,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'من فضلك ادخل كلمه المرور';
                        }
                        return null;
                      },
                      onSubmit: (value) {
                        if (formKey.currentState?.validate() == true) {
                          loginCubit.userLogin(
                            userName: userNameController.text,
                            password: passwordController.text,
                          );
                        }
                        return 'خطأ في كلمه المرور او اسم الحساب';
                      },
                      controller: passwordController,
                      label: 'كلمه المرور',
                      prefix: FontAwesomeIcons.lock,
                      prefixIconSize: 10.sp,
                      obscureText: loginCubit.obscureText,
                      suffix: loginCubit.suffix,
                      suffixIconSize: 10.sp,
                      suffixPressed: () => loginCubit.changePasswordVisibility(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        //Forget your password?
                        TextButton(
                          onPressed: () {
                            navigateToPage(context, pageName: const RestorePassword());
                          },
                          child: Text(
                            'نسيت كلمه المرور؟',
                            style: TextStyle(fontSize: 10.sp),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                                       //'Sign in' Button
                        ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          fallback: (context) {
                            return const Center(
                                child: CircularProgressIndicator(color: primaryColor));
                          },
                          builder: (context) => defaultButton(
                            function: () {
                              if (formKey.currentState!.validate() == true) {
                                loginCubit.userLogin(
                                    userName: userNameController.text,
                                    password: passwordController.text);
                              }
                              print(userNameController.text);
                              print(passwordController.text);

                            },
                            text: 'تسجيل الدخول',
                            fontSize: 14.sp,
                            width: 140.w,
                            height: 40.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height,
                    ),
                    //Skip login button
                    defaultTextButton(
                        text: 'تخطي الدخول',
                        fontSize: 12.sp,
                        function: () {

                          navigateToPageAndFinish(context, pageName: const HomePage());
                        },
                        isUpperCase: false),
                    SizedBox(
                      height: height,
                    ),
                    //Register button
                    TextButton(
                      onPressed: () {
                        navigateToPage(context, pageName: const RegisterPage());
                      },
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'ليس لديك حساب؟  ',
                              style: TextStyle(color: secondaryColor, fontSize: 12.sp),
                            ),
                            TextSpan(
                              text: 'انشاء حساب',
                              style: TextStyle(color: primaryColor, fontSize: 12.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
