import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key,required this.img}) : super(key: key);
final String img ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.42,
      child: SizedBox(
        child: Card(
          elevation: 4,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
              color: Colors.black,
              width: 0.1
            )
          ),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(img,width: MediaQuery.of(context).size.width*0.2,),
              Text('Organic Bananas',style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),),
              Text('7pcs, Priceg',
              style: TextStyle (
                color: Colors.grey
              ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('\$4.99'),
                  Image.asset('assets/images/img_10.png',width: MediaQuery.of(context).size.width*0.1,)

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
