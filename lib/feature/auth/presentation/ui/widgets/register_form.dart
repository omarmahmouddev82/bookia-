import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/utils/app_validator.dart';
import 'package:bookia/core/widgets/app_button.dart';
import 'package:bookia/core/widgets/custom_text_form_felid.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  var formState = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const AlertDialog(
              backgroundColor: Colors.transparent,
              content: Center(child: CircularProgressIndicator()),
            ),
          );
        } else if (state is RegisterSuccessState) {
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.homeScreen,
            (route) => false,
          );
        } else if (state is RegisterErrorState) {
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(
                state.message,
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
              ),
            ),
          );
        }
      },
      child: Form(
        key: formState,
        child: Column(
          children: [
            CustomTextFormFelid(
              controller: usernameController,
              hintText: "Username",
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Username is required";
                }
                return null;
              },
            ),
            16.verticalSpace,
            CustomTextFormFelid(
              controller: emailController,
              hintText: "Email",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email is required";
                }
                if (!AppValidator.isEmailValid(value)) {
                  return "Please enter a valid email";
                }
                return null;
              },
            ),
            16.verticalSpace,
            CustomTextFormFelid(
              controller: passwordController,
              hintText: "Password",
              isPassword: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password is required";
                } else if (value.length <= 6) {
                  return "Password must be greater than 6 chars";
                }
                return null;
              },
            ),
            16.verticalSpace,
            CustomTextFormFelid(
              controller: confirmPasswordController,
              hintText: "Confirm your Password",
              isPassword: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Confirm password is required";
                } else if (value != passwordController.text) {
                  return "Passwords do not match";
                }
                return null;
              },
            ),
            32.verticalSpace,
            AppButton(
              title: "Register",
              onTap: () {
                if (formState.currentState?.validate() ?? false) {
                  context.read<AuthCubit>().register(
                    username: usernameController.text.trim(),
                    email: emailController.text.trim(),
                    password: passwordController.text,
                    confirmPassword: confirmPasswordController.text,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}