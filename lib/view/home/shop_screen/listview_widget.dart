import 'package:flutter/material.dart';

import '../../card_details/card_widget.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key,required this.img}) : super(key: key);
final String img  ;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height:MediaQuery.of(context).size.width*0.5,
      child: Expanded(
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx,index)=>CardWidget(img: img),

            separatorBuilder: (ctx,index)=>SizedBox(
              width: 10,
            ),
            itemCount:10 ),
      ),
    );
  }
}
