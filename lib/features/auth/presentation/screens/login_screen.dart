import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;
  String selectedFilter = "";
  int selectedCategory = 0;

  @override
  void initState() {
    super.initState();

    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                textEditingController: usernameController,
                hintText: 'Username',
                isObscure: false,
              ),

              const SizedBox(height: 16),

              CustomTextField(
                textEditingController: passwordController,
                hintText: 'Password',
                isObscure: true,
                //suffixIcon: Icon(Icons.visibility),
                //onSuffixTap: () {},
              ),

              const SizedBox(height: 24),

              authState.isLoading
                  ? const CircularProgressIndicator()
                  : CustomButton(
                      buttonText: 'Login',
                      onTap: () {
                        ref
                            .read(authProvider.notifier)
                            .login(
                              username: usernameController.text,
                              password: passwordController.text,
                            );
                      },
                    ),

              const SizedBox(height: 24),

              authState.when(
                data: (auth) {
                  final user = auth.user;

                  if (user == null) {
                    return const SizedBox();
                  }

                  return Text('Welcome ${user.username}');
                },
                loading: () => const SizedBox(),
                error: (e, st) => Text(
                  e.toString(),
                  style: const TextStyle(color: Colors.red),
                ),
              ),

              // CustomDropdownField<String>(
              //   hintText: 'Select Gender',
              //   items: const ['Male', 'Female', 'Other'],
              //   itemLabel: (item) => item,
              //   onChanged: (value) {},
              // ),
              // const SizedBox(height: 24),
              // CustomTextField(
              //   hintText: 'date',
              //   isObscure: false,
              //   suffixIcon: Icon(Icons.calendar_month_rounded),
              //   onSuffixTap: () {
              //     final date = AppDatePicker.pickDate(context);
              //
              //     print(date.toString());
              //   },
              // ),
              // ImageAvatar(
              //   fallbackImage: AssetImage(Assets.superMarket),
              //   shape: BoxShape.rectangle,
              // ),
              // const SizedBox(height: 24),
              // CustomButton(
              //   onTap: () {
              //     ImagePickerService.pickImage(ImageSourceType.gallery);
              //   },
              //   buttonText: "Gallery",
              // ),
              //const SizedBox(height: 24),
              // CustomButton(
              //   onTap: () {
              //     ImagePickerService.pickImage(ImageSourceType.camera);
              //   },
              //   buttonText: "Camera",
              // ),
              // const SizedBox(height: 24),
              // CustomButton(
              //   onTap: () async {
              //     await CustomDialog.show(
              //       context: context,
              //       title: 'Success',
              //       message: 'Profile updated successfully.',
              //     );
              //   },
              //   buttonText: "Dialog",
              // ),
              // CustomSearchAutocomplete<String>(
              //   options: const ['Apple', 'Banana', 'Cherry', 'Date'],
              //   displayStringForOption: (item) => item,
              //   onSelected: (value) {
              //     debugPrint(value);
              //   },
              //   hintText: 'Search fruit',
              // ),
              // const SizedBox(height: 24),
              // CustomFilterChip(
              //   label: 'Popular',
              //   selected: selectedFilter == 'Popular',
              //   onTap: () {
              //     setState(() {
              //       selectedFilter = 'Popular';
              //     });
              //   },
              //   selectedColor: AppColors.textSecondary,
              //   showCheckMark: true,
              // ),
              //const SizedBox(height: 24),
              // CustomSegmentedButton<Settings>(
              //   multiSelectionEnabled: true,
              //   segments: [
              //     const ButtonSegment(
              //       value: Settings.home,
              //       label: Text('Home'),
              //       icon: Icon(Icons.home),
              //     ),
              //     ButtonSegment(
              //       value: Settings.profile,
              //       label: const Text('Profile'),
              //       icon: const Icon(Icons.person),
              //     ),
              //     ButtonSegment(
              //       value: Settings.notification,
              //       label: const Text('Alert'),
              //       icon: const Icon(Icons.star),
              //     ),
              //   ],
              //   selectedValue: selected,
              //   onChanged: (value) {
              //     setState(() {
              //       selected = value;
              //     });
              //   },
              // ),
              // CustomButton(
              //   onTap: () {
              //     BottomSheetHelper.show(
              //       context: context,
              //       title: 'Select Category',
              //       child: Column(
              //         mainAxisSize: MainAxisSize.min,
              //         children: [
              //           ListTile(
              //             title: const Text('Electronics'),
              //             onTap: () => Navigator.pop(context, 'Electronics'),
              //           ),
              //           ListTile(
              //             title: const Text('Fashion'),
              //             onTap: () => Navigator.pop(context, 'Fashion'),
              //           ),
              //         ],
              //       ),
              //     );
              //   },
              //   buttonText: 'Open Bottom Sheet',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
