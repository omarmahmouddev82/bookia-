import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/utils/app_validator.dart';
import 'package:bookia/core/widgets/app_button.dart';
import 'package:bookia/core/widgets/custom_text_form_felid.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var formState = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginLoadingState){
          showDialog(context: context,barrierDismissible: false, builder: (context)=> 
          AlertDialog(
            backgroundColor: Colors.transparent,
            content: Center(child: CircularProgressIndicator()),
          ));
        }else if (state is LoginSuccesState){
          Navigator.pushNamed(context, AppRoutes.homeScreen);
        }
        else{
          Navigator.pop(context);
          showDialog(context: context, builder: (context)=> AlertDialog(
            content: Text(
              "Error",
              textAlign: TextAlign.center,
            ),
          ));
        }
      },
      child: Form(
        key: formState,
        child: Column(
          children: [
            CustomTextFormFelid(
              controller: emailController,
              hintText: "Enter your Email",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email is required";
                }
                if (!AppValidator.isEmailValid(value ?? "")) {
                  return "please Enter Valid Email";
                }
              },
            ),
            16.verticalSpace,
            CustomTextFormFelid(
              controller: passwordController,
              hintText: "Enter your Password",
              isPassword: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password is required";
                } else if (value.length <= 6) {
                  return "Password must be greater than 6 char";
                }
              },
            ),
            32.verticalSpace,
            AppButton(
              title: "Login",
              onTap: () {
                if (formState.currentState?.validate()?? false){
                  context.read<AuthCubit>().login(email: emailController.text, password: passwordController.text);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
