// import 'package:url_launcher/url_launcher.dart';

// class UrlLauncherService {
//   static String? encodeQueryParameters(Map<String, String> params) {
//     return params.entries
//         .map((MapEntry<String, String> e) =>
//             '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
//         .join('&');
//   }

//   static sendEmail({required String to, subject = " "}) {
//     final Uri emailLaunchUri = Uri(
//       scheme: 'mailto',
//       query: encodeQueryParameters(<String, String>{
//         'subject': subject,
//       }),
//     );
//     launchUrl(emailLaunchUri);
//   }

//   static launchSite({required path}) async {
//     final Uri url = Uri.parse(path);

//     await launchUrl(url);
//   }
// }
