// import 'package:intl/intl.dart';
// import 'package:tt/core/models/errors/exceptions.dart';

// class AppTimeAndDateFormat {
//   static const String monthIn3LettersFormat = 'MMM';
//   static const String dayIn2NumbersFormat = 'dd';
//   static const String dayIn3LettersFormat = 'EEE';
//   static const String dateFormat = 'dd-M-yyyy';
//   static const String _timeFormat = 'hh:mm a';

//   static String formatDate(DateTime date) {
//     return DateFormat(dateFormat).format(date);
//   }

//   static DateTime? parseDate(String date) {
//     try {
//       return DateFormat(dateFormat).parse(date);
//     } catch (e) {
//       return null;
//     }
//   }

//   // static String getDayFromFroramtedDate(String date) {
//   //   return DateFormat('EEEE').format(parseDate(date));
//   // }

//   static String formatTime12H(DateTime date) {
//     return DateFormat(_timeFormat).format(date);
//   }

//   static String formatTime24H(DateTime date) {
//     return DateFormat.jm().format(date);
//   }

//   static DateTime parseTime(String date) {
//     return DateFormat(_timeFormat).parse(date);
//   }

//   static double calculateTotalHours(String time) {
//     DateTime dateTime = parseTime(time);
//     return dateTime.hour + (dateTime.minute / 60);
//   }

//   static double calculateTimeDiffInMinutes(
//       List<String> start, List<String> end) {
//     if (start.length > 2) {
//       if (calculateTotalHours(start[1]) < calculateTotalHours(end[0])) {
//         throw PrimaryServerException(
//             error: " ", code: 1, message: "time range is wrong");
//       }
//     }

//     double sTotal = 0, eTotal = 0;
//     for (int i = 0; i < start.length; i++) {
//       double startTemp = calculateTotalHours(start[i]);
//       double endTemp = calculateTotalHours(end[i]);

//       if (startTemp > endTemp) {
//         throw PrimaryServerException(
//             error: " ", code: 1, message: "time range is wrong");
//       }
//       sTotal += startTemp;
//       eTotal += endTemp;
//     }

//     return (eTotal - sTotal) * 60;
//   }

//   static String getTimeAgo(DateTime date) {
//     Duration difference = DateTime.now().difference(date);

//     if (difference.inMinutes < 60) {
//       return "منذ ${difference.inMinutes} دقيقة";
//     } else if (difference.inHours < 24) {
//       return "منذ ${difference.inHours} ساعة";
//     } else if (difference.inDays < 7) {
//       return "منذ ${difference.inDays} يوم";
//     } else if (difference.inDays < 30) {
//       return "منذ ${difference.inDays ~/ 7} أسبوع";
//     } else if (difference.inDays < 365) {
//       return "منذ ${difference.inDays ~/ 30} شهر";
//     } else {
//       return "منذ ${difference.inDays ~/ 365} سنة";
//     }
//   }
// }
