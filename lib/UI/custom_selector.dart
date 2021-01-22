import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSelector extends StatelessWidget {
  final String listName;
  final List<String> list;
  final String title;
  CustomSelector({
    @required this.list,
    @required this.listName,
    @required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.clear,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          listName,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 7,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700,
                ),
              ),
              Divider(
                height: 20,
                color: Colors.grey.shade700,
              ),
              Expanded(
                child: ListView.separated(
                    itemCount: list.length,
                    physics: BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => Divider(
                          height: 20,
                          color: Colors.grey.shade700,
                        ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pop(context, list[index]);
                        },
                        child: Container(
                          child: Text(list[index]),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
