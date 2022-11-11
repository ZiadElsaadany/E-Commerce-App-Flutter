import 'package:flutter/material.dart';

import '../../search/search_screen.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GestureDetector(
        onTap: ( ) {

          Navigator.pushNamed(context, SearchScreen.id);

        } ,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Icon(Icons.search, color: Colors.grey,),
              SizedBox(width: 5,),
              const Text('Search For Products ',
              style: TextStyle(
                color: Colors.grey
              ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey)
          ),
        ),
      ),
    );
  }
}
