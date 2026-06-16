//
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../providers/auth_provider.dart';
//
// class LoginPage extends ConsumerWidget {
//   LoginPage({super.key});
//
//   final usernameController =
//   TextEditingController();
//
//   final passwordController =
//   TextEditingController();
//
//   @override
//   Widget build(
//       BuildContext context,
//       WidgetRef ref,
//       ) {
//
//     //final state = ref.watch(authProvider);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Login"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//
//             TextField(
//               controller: usernameController,
//               decoration: const InputDecoration(
//                 hintText: 'Username',
//               ),
//             ),
//
//             TextField(
//               controller: passwordController,
//               decoration: const InputDecoration(
//                 hintText: 'Password',
//               ),
//             ),
//
//             const SizedBox(height: 20),
//
//             if (state.isLoading)
//               const CircularProgressIndicator(),
//
//             ElevatedButton(
//               onPressed: () {
//
//                 ref
//                     .read(authProvider.notifier)
//                     .login(
//                   username:
//                   usernameController.text,
//                   password:
//                   passwordController.text,
//                 );
//               },
//               child: const Text("Login"),
//             ),
//
//             if (state.user != null)
//               Text(
//                 "Welcome ${state.user!.username}",
//               ),
//
//             if (state.error != null)
//               Text(state.error!,style: TextStyle(color: Colors.red)),
//           ],
//         ),
//       ),
//     );
//   }
// }
