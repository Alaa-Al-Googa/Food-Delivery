// import 'package:flutter/material.dart';

// class LanguagePickerBottomSheet extends StatefulWidget {
//   final String initialLanguage;
//   final void Function(String) onSelected;

//   const LanguagePickerBottomSheet({
//     Key? key,
//     required this.initialLanguage,
//     required this.onSelected,
//   }) : super(key: key);

//   @overridez
//   State<LanguagePickerBottomSheet> createState() =>
//       _LanguagePickerBottomSheetState();
// }

// class _LanguagePickerBottomSheetState extends State<LanguagePickerBottomSheet> {
//   late String selectedLanguage;

//   final List<Map<String, dynamic>> languages = [
//     {'name': 'English (US)', 'flag': '🇺🇸'},
//     {'name': 'العربية', 'flag': '🇸🇦'},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     selectedLanguage = widget.initialLanguage;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Text(
//             'Select Language',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//           ),
//           const SizedBox(height: 16),
//           ...languages.map((lang) {
//             bool isSelected = selectedLanguage == lang['name'];
//             return GestureDetector(
//               onTap: () {
//                 setState(() {
//                   selectedLanguage = lang['name'];
//                 });
//               },
//               child: Container(
//                 margin: const EdgeInsets.symmetric(vertical: 6),
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 12,
//                   horizontal: 12,
//                 ),
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: isSelected ? Colors.orange : Colors.grey.shade300,
//                     width: isSelected ? 2 : 1,
//                   ),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Row(
//                   children: [
//                     Text(lang['flag'], style: const TextStyle(fontSize: 24)),
//                     const SizedBox(width: 12),
//                     Expanded(
//                       child: Text(
//                         lang['name'],
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: isSelected
//                               ? FontWeight.bold
//                               : FontWeight.normal,
//                         ),
//                       ),
//                     ),
//                     if (isSelected)
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.orange,
//                           border: Border.all(color: Colors.orange),
//                           borderRadius: BorderRadius.circular(46),
//                         ),
//                         child: Icon(Icons.check, color: Colors.white),
//                       ),
//                   ],
//                 ),
//               ),
//             );
//           }).toList(),
//           const SizedBox(height: 20),
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.orange,
//                 padding: const EdgeInsets.symmetric(vertical: 14),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//               ),
//               onPressed: () {
//                 widget.onSelected(selectedLanguage);
//                 Navigator.pop(context);
//               },
//               child: const Text(
//                 'Select',
//                 style: TextStyle(fontSize: 18, color: Colors.white),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
