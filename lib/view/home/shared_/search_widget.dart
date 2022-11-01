import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
      decoration:BoxDecoration(
          color: const Color(0xffF2F3F2),
          borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        children: const [
          Icon(Icons.search) ,
          Text('Search Store',style: TextStyle(
              fontSize: 18
          ),),
        ],
      ),
    );
  }
}
