import 'package:flutter/material.dart';
import 'package:marvelflix/src/core/utils/resources/app_assets.dart';
import 'package:marvelflix/src/core/utils/resources/app_font.dart';
import 'package:marvelflix/src/core/utils/resources/app_icons.dart';
import 'package:marvelflix/src/core/utils/resources/app_strings.dart';
import 'package:marvelflix/src/core/utils/resources/app_values.dart';
import 'package:marvelflix/src/features/auth/presentation/screens/register_screen.dart';
import 'package:marvelflix/src/features/auth/presentation/widgets/custom_rich_text.dart';
import 'package:marvelflix/src/core/utils/widgets/custom_singlechildscrollview_vertical.dart';
import 'package:marvelflix/src/core/utils/widgets/custom_sizedbox_height.dart';
import 'package:marvelflix/src/features/auth/presentation/widgets/custom_text.dart';
import 'package:marvelflix/src/features/auth/presentation/widgets/custom_text_button.dart';
import 'package:marvelflix/src/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:marvelflix/src/features/home/presentation/ui/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  final AppPharses appPharses = AppPharses();
  late final double mediaQuerySizeOfHeight = MediaQuery.of(context).size.height;

  late final CustomSizedBoxHeight sizedBoxOfHeight_15;
  late final CustomSizedBoxHeight sizedBoxOfHeight_30;
  late final CustomSizedBoxHeight sizedBoxOfHeight_40;
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    sizedBoxOfHeight_15 =
        CustomSizedBoxHeight(height: mediaQuerySizeOfHeight / 15);
    sizedBoxOfHeight_30 =
        CustomSizedBoxHeight(height: mediaQuerySizeOfHeight / 30);
    sizedBoxOfHeight_40 =
        CustomSizedBoxHeight(height: mediaQuerySizeOfHeight / 40);

    super.didChangeDependencies();
  }

  Widget _buildMarvelImage() {
    return Image.asset(
      AppImagesPng.marvel,
      fit: BoxFit.fill,
      width: double.infinity,
    );
  }

  Widget _buildLetsConnectWithUsText() {
    return const CustomText(
      title: AppStrings.letsConnectWithUs,
      fontSize: AppFontSize.s26,
      fontWeight: AppFontWeight.bold,
    );
  }

  Widget _buildEmailTextFormFiled() {
    return CustomTextFormField(
      textEditingController: _emailController,
      keyBoardType: TextInputType.emailAddress,
      hintText: AppStrings.emailAddress,
    );
  }

  Widget _buildPasswordTextFormFiled() {
    return CustomTextFormField(
      textEditingController: _passwordController,
      keyBoardType: TextInputType.visiblePassword,
      hintText: AppStrings.password,
      suffixIcon: const Icon(AppIcons.eyePassword),
    );
  }

  Widget _buildForgotPasswordText() {
    return const Align(
      alignment: Alignment.centerRight,
      child: CustomText(
        title: AppStrings.forgotPassword,
        fontSize: AppFontSize.s18,
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return CustomTextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      },
      textButton: AppStrings.login,
    );
  }

  Widget _buildDoNotHaveAccount() {
    return CustomRichText(
      mainText: AppStrings.dontHaveAccount,
      highlightText:
          appPharses.phraseConstructionWithFirstStringEmpty(AppStrings.signUp),
      nextWidget: const ReigsterScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomSingleChildScrollViewVertical(
        children: [
          _buildMarvelImage(),
          sizedBoxOfHeight_30,
          Padding(
            padding: AppEdgeInsetsPaddings.loginPadding,
            child: Column(
              children: [
                _buildLetsConnectWithUsText(),
                sizedBoxOfHeight_15,
                _buildEmailTextFormFiled(),
                sizedBoxOfHeight_40,
                _buildPasswordTextFormFiled(),
                _buildForgotPasswordText(),
                sizedBoxOfHeight_30,
                _buildLoginButton(context),
                sizedBoxOfHeight_30,
                _buildDoNotHaveAccount(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
