import 'package:flutter/material.dart';

class list_gridview extends StatefulWidget {
  const list_gridview({super.key});

  @override
  State<list_gridview> createState() => _list_gridviewState();
}

class _list_gridviewState extends State<list_gridview> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5, // Replace with the length of your data list
        itemBuilder: (context, index) {
          return CustomListCell(subtitle: "pradeep", title: "me");
        },
      ),
    );
  }
}






class CustomListCell extends StatelessWidget {
  final String title;
  final String subtitle;

  CustomListCell({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(Icons.label),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          // Handle tap event
        },
      ),
    );
  }
}
