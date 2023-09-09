import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvelflix/src/core/utils/resources/app_assets.dart';
import 'package:marvelflix/src/core/utils/resources/app_colors.dart';
import 'package:marvelflix/src/core/utils/resources/app_strings.dart';
import 'package:marvelflix/src/core/utils/resources/app_values.dart';
import 'package:marvelflix/src/features/auth/presentation/screens/register_screen.dart';
import 'package:marvelflix/src/features/auth/presentation/widgets/custom_rich_text.dart';
import 'package:marvelflix/src/features/auth/presentation/widgets/custom_text_button.dart';
import 'package:marvelflix/src/features/auth/presentation/widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AppPharses appPharses = AppPharses();

  Widget _buildMarvelImage() {
    return Image.asset(AppImagesPng.marvel);
  }

  Widget _buildLetsConnectWithUsText() {
    return Text(
      AppStrings.letsConnectWithUs,
      style: GoogleFonts.workSans(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
      ),
    );
  }

  Widget _buildEmailTextFormFiled() {
    return Column(
      children: [
        Text(
          AppStrings.emailAddress,
          style: GoogleFonts.workSans(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
        ),
        CustomTextFormField(
          textEditingController: _emailController,
          keyBoardType: TextInputType.emailAddress,
        ),
      ],
    );
  }

  Widget _buildPasswordTextFormFiled() {
    return Column(
      children: [
        Text(
          AppStrings.password,
          style: GoogleFonts.workSans(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
        ),
        CustomTextFormField(
          textEditingController: _passwordController,
          keyBoardType: TextInputType.visiblePassword,
          suffixIcon: const Icon(Icons.remove_red_eye_rounded),
        ),
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return CustomTextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      },
      textButton: AppStrings.login,
    );
  }

  Widget _buildForgotPasswordText() {
    return Text(
      AppStrings.forgotPassword,
      style: GoogleFonts.workSans(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
    );
  }

  Widget _buildDoNotHaveAccount() {
    return CustomRichText(
      mainText: AppStrings.dontHaveAccount,
      highlightText: appPharses
          .phraseConstructionWithFirstStringEmpty(AppStrings.register),
      nextWidget: const ReigsterScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    double mediaQuerySizeOfHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: ConstEdgeInsetsGeometry.defaultPaddingAuth,
          child: Column(
            children: [
              _buildMarvelImage(),
              SizedBox(height: mediaQuerySizeOfHeight / 7),
              _buildLetsConnectWithUsText(),
              SizedBox(height: mediaQuerySizeOfHeight / 20),
              _buildEmailTextFormFiled(),
              SizedBox(height: mediaQuerySizeOfHeight / 20),
              _buildPasswordTextFormFiled(),
              _buildForgotPasswordText(),
              SizedBox(height: mediaQuerySizeOfHeight / 20),
              _buildLoginButton(context),
              SizedBox(height: mediaQuerySizeOfHeight / 20),
              _buildDoNotHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
