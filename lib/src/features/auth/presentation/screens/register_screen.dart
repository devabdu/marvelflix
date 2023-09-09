import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvelflix/src/core/utils/resources/app_colors.dart';
import 'package:marvelflix/src/core/utils/resources/app_strings.dart';
import 'package:marvelflix/src/core/utils/resources/app_values.dart';
import 'package:marvelflix/src/features/auth/presentation/screens/login_screen.dart';
import 'package:marvelflix/src/features/auth/presentation/widgets/custom_rich_text.dart';
import 'package:marvelflix/src/features/auth/presentation/widgets/custom_text_button.dart';
import 'package:marvelflix/src/features/auth/presentation/widgets/custom_text_form_field.dart';

class ReigsterScreen extends StatefulWidget {
  const ReigsterScreen({super.key});

  @override
  State<ReigsterScreen> createState() => _ReigsterScreenState();
}

class _ReigsterScreenState extends State<ReigsterScreen>
    with RestorationMixin {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  RestorableBoolN checkboxValue = RestorableBoolN(false);

  @override
  String? get restorationId => 'checkbox_demo';
  final AppPharses appPharses = AppPharses();
  late double mediaQuerySizeOfHeight;

  @override
  void initState() {
    mediaQuerySizeOfHeight = MediaQuery.of(context).size.height;
    super.initState();
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(checkboxValue, 'checkbox');
  }

  @override
  void dispose() {
    checkboxValue.dispose();
    super.dispose();
  }

  Widget _buildHeyAndEnterYourAccountText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.hey,
          style: GoogleFonts.workSans(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
        Text(
          AppStrings.enterYourAccount,
          style: GoogleFonts.workSans(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildNameTextFormFiled() {
    return Column(
      children: [
        Text(
          AppStrings.name,
          style: GoogleFonts.workSans(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
        ),
        CustomTextFormField(
          textEditingController: _nameController,
          keyBoardType: TextInputType.name,
        ),
      ],
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

  Widget _buildLineOfAcceptOurPrivacyAndTerms() {
    return Row(
      children: [
        Checkbox(
          fillColor: MaterialStateProperty.all<Color>(AppColors.black),
          value: checkboxValue.value,
          onChanged: (value) {
            setState(() {
              checkboxValue.value = value;
            });
          },
        ),
        const Expanded(
          child: CustomRichText(
            fontSize: 14,
            mainText: AppStrings.iAgreeTo,
            highlightText: AppStrings.termsAndPrivacy,
            highlightTextDecoration: TextDecoration.underline,
            // not handled yet
            nextWidget: Center(),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return CustomTextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      },
      textButton: AppStrings.register,
    );
  }

  Widget _buildAlreadyHaveAccount() {
    return CustomRichText(
      mainText: AppStrings.alreadyHaveAccount,
      highlightText:
          appPharses.phraseConstructionWithFirstStringEmpty(AppStrings.login),
      nextWidget: const LoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: ConstEdgeInsetsGeometry.defaultPaddingAuth,
        child: Column(
          children: [
            _buildHeyAndEnterYourAccountText(),
            SizedBox(height: mediaQuerySizeOfHeight / 15),
            _buildNameTextFormFiled(),
            SizedBox(height: mediaQuerySizeOfHeight / 30),
            _buildEmailTextFormFiled(),
            SizedBox(height: mediaQuerySizeOfHeight / 30),
            _buildPasswordTextFormFiled(),
            SizedBox(height: mediaQuerySizeOfHeight / 15),
            _buildLineOfAcceptOurPrivacyAndTerms(),
            SizedBox(height: mediaQuerySizeOfHeight / 9),
            _buildRegisterButton(context),
            SizedBox(height: mediaQuerySizeOfHeight / 9),
            _buildAlreadyHaveAccount(),
          ],
        ),
      ),
    );
  }
}
