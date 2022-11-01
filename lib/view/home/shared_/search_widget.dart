import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search,size: 30,),
          hintText:'Search for store' ,
          labelText: 'Search for store',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),

          ),
        ),
      ),
    );
  }
}
