import 'package:flutter/material.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);
  
  @override
  State<LibraryPage> createState() => _LibraryPageState();
 }

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context)
  {
    return DefaultTabController(
      length: 3, child: Scaffold(
   
    backgroundColor: Color.fromARGB(255, 180, 149, 139),
    appBar: AppBar(
      title: Text('Library App CSI'),
      actions:[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            showSearch(
              context: context,
              delegate: MySearchDelegate(),
              
            );
          }
        )
      ],
      // ignore: prefer_const_constructors
      leading: Icon(Icons.add_box_outlined),
      //backgroundColor: Color.fromARGB(255, 127, 83, 67),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // ignore: prefer_const_literals_to_create_immutables
            colors: [Color.fromARGB(255, 147, 75, 49),Color.fromARGB(255, 139, 91, 74),Color.fromARGB(255, 149, 123, 114)],
            begin: Alignment.bottomRight,
            end: Alignment.topRight,
          ),
        ),
      ),
      bottom: TabBar(
        indicatorColor:Colors.white,
        indicatorWeight: 2,
        // ignore: prefer_const_literals_to_create_immutables
        tabs: [
          Tab(icon: Icon(Icons.home),text: 'Home'),
          Tab(icon: Icon(Icons.bookmark),text: 'Bookmark'),
          Tab(icon: Icon(Icons.settings),text: 'Settings'),
          
         
        ],

      ),
      elevation: 10,
      ),
      body: 
      
      TabBarView(
        children: [
          Container(child: buildImageCard()),
          buildPage('Home Page'),
          buildPage('Bookmarks Page'),
          buildPage('Settings Page'),

        ],
        ),
      
      )
    );
  
  }
Widget buildPage(String text) => Center(
    child: Text(
      text,
      style: TextStyle(fontSize: 30),
    ),
  );

}
class MySearchDelegate extends SearchDelegate {
  @override 
  Widget? buildLeading(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back_outlined),
    onPressed: () {}
    );
   @override 
  List<Widget>? buildActions(BuildContext context) => [
   IconButton(
    icon: const Icon(Icons.clear),
    onPressed: () {
      if (query.isEmpty) {
        close(context, null);
      }
      else{
      query='';
      }
    }
   ),
  ];
  
  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }
  
  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
  
  
}

Widget buildImageCard() => Card (
  child:Stack (
    children: [
      Ink.image(
        image: NetworkImage('https://www.valuespreadsheet.com/images/rich-dad-poor-dad-book.jpg'),
      height: 250,
      fit: BoxFit.cover,
      )
    ],
  )
   
  );