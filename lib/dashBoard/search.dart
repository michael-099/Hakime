// import 'package:flutter/material.dart';

// class Search extends StatefulWidget {
//   @override
//   State<Search> createState() => SearchState();
// }

// class SearchState extends State<Search> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(""),
//         actions: [
//           IconButton(
//             onPressed: () {
//               showSearch(
//                 context: context,
//                 delegate: MySearchDelegate(),
//               );
//             },
//             icon: const Icon(Icons.search),
//           )
//         ],
//       ),
//     );
//   }
// }

// class MySearchDelegate extends SearchDelegate {
//   final List<String> searchTerms = [
//     'frfrfe',
//     'dfavfav',
//     'fevfev',
//     'vfeefev',
//     'vfvfvvraaaaaa'
//   ];

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           query = '';
//         },
//         icon: const Icon(Icons.clear),
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         close(context, null);
//       },
//       icon: const Icon(Icons.arrow_back),
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var item  in searchTerms) {
//       if (item .toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(item);
//       }
//     }

//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         // var result = matchQuery[index];
//         return ListTile(
//           title: Text(matchQuery[index]),
//           // onTap: () {
//           //   close(context, matchQuery[index]);
//           // },
//         );
//       },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//      List<String> matchQuery = [];
//     for (var term in searchTerms) {
//       if (term.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(term);
//       }
//     }

//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         // var result = matchQuery[index];
//         return ListTile(
//           title: Text(matchQuery[index]),
//           // onTap: () {
//           //   close(context, matchQuery[index]);
//           // },
//         );
//       },
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final TextEditingController searchController;

  Search({required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360, // Adjust the width as needed
      height: 50, // Adjust the height as needed
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: CupertinoSearchTextField(
        controller: searchController,
        placeholder: 'Search',
        style: TextStyle(color: Colors.black45),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 1),
            ),
          ],
        ),
        itemColor: Colors.lightBlue.shade200,
        onChanged: (value) {
          // You can perform actions when the text changes
        },
      ),
    );
  }
}


