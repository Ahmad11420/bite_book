// import 'package:bite_book/screens/catagory.dart';
// import 'package:bite_book/screens/fav.dart';
// import 'package:flutter/material.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int currindex = 0;
//   setindex(int index) {
//     setState(() {
//       currindex = index;
//       currindex++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: SizedBox(
//         height: 120,
//         child: BottomNavigationBar(
//           items: [
//             BottomNavigationBarItem(
//               icon: InkWell(
//                 onTap: () {
//                   setindex(currindex);
//                   print(currindex);
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => Catagory()),
//                   );
//                 },
//                 child: Icon(Icons.room_service, size: 50),
//               ),
//               label: 'Categories',
//             ),

//             BottomNavigationBarItem(
//               icon: InkWell(
//                 onTap: () {
//                   setindex(currindex++);
//                   print(currindex);
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => Fav()),
//                   );
//                 },
//                 child: Icon(Icons.favorite, size: 50),
//               ),
//               label: 'Favourite',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
