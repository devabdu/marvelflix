import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelflix/src/config/router/app_routes.dart';
import 'package:marvelflix/src/core/utils/functions/valid_functions.dart';
import 'package:marvelflix/src/core/utils/helper/shared_components.dart';
import 'package:marvelflix/src/core/utils/helper/show_progress_indicator.dart';
import 'package:marvelflix/src/core/utils/helper/show_snack_bar.dart';
import 'package:marvelflix/src/core/utils/resources/app_assets.dart';
import 'package:marvelflix/src/core/utils/resources/app_font.dart';
import 'package:marvelflix/src/core/utils/resources/app_icons.dart';
import 'package:marvelflix/src/core/utils/resources/app_strings.dart';
import 'package:marvelflix/src/core/utils/resources/app_values.dart';
import 'package:marvelflix/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:marvelflix/src/features/auth/presentation/screens/register_screen.dart';
import 'package:marvelflix/src/features/auth/presentation/widgets/custom_rich_text.dart';
import 'package:marvelflix/src/core/utils/widgets/custom_singlechildscrollview_vertical.dart';
import 'package:marvelflix/src/core/utils/widgets/custom_sizedbox_height.dart';
import 'package:marvelflix/src/features/auth/presentation/widgets/custom_text.dart';
import 'package:marvelflix/src/features/auth/presentation/widgets/custom_text_button.dart';
import 'package:marvelflix/src/features/auth/presentation/widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  late String email;
  late String password;
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
      validator: (value) => validateEmail(value),
      onSaved: (newValue) => email = newValue!,
    );
  }

  Widget _buildPasswordTextFormFiled() {
    return CustomTextFormField(
      textEditingController: _passwordController,
      keyBoardType: TextInputType.visiblePassword,
      hintText: AppStrings.password,
      obscureText: _obscureText,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? AppIcons.visibility : AppIcons.visibilityOff,
        ),
        onPressed: _togglePasswordVisibility,
      ),
      validator: (value) => validatePassword(value),
      onSaved: (newValue) => password = newValue!,
    );
  }

  Widget _buildForgotPasswordText() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // Todo later
        },
        child: const CustomText(
          title: AppStrings.forgotPassword,
          fontSize: AppFontSize.s18,
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return CustomTextButton(
      onPressed: () {
        _sign(context);
      },
      textButton: AppStrings.login,
    );
  }

  Widget _buildSignInSubmitedBloc() {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is SignInLoading) {
          showProgressIndicator(context);
        }
        if (state is SignInSuccess) {
          navigatePushNamed(context, AppRoutesName.homeRoute, '');
        }
        if (state is SignInError) {
          String message = (state).error;
          showSnackBar(context, message);
        }
      },
      child: Container(
        height: AppSize.s45,
      ),
    );
  }

  Future<void> _sign(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      _formKey.currentState!.save();
      BlocProvider.of<AuthCubit>(context)
          .signInWithEmailAndPassword(email, password);
    }
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
      body: Form(
        key: _formKey,
        child: CustomSingleChildScrollViewVertical(
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
                  _buildSignInSubmitedBloc(),
                  sizedBoxOfHeight_30,
                  _buildDoNotHaveAccount(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
