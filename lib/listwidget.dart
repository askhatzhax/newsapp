import 'package:flutter/material.dart';
import 'shared/listitem.dart';
Widget listWidget(ListItem item){
  return Card(
    elevation: 1.0,
      color: Colors.yellow[50],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
    margin: EdgeInsets.only(bottom: 10.0),
    child: Padding(

        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Hero(

              tag: '${item.newsTitle}',
              child: Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image:  NetworkImage(item.imgUrl), fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(8.0),
                )
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.newsTitle,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      children: [
                        Icon(Icons.person,color:Colors.indigo ,),
                        Text(
                          item.author,
                          style: TextStyle(
                            fontSize: 12.0,

                          ),
                        ),
                        SizedBox(width: 10.0),
                        Icon(Icons.date_range,color:Colors.indigo ,),
                        Text(
                          item.date,
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        )
                      ],
                    ),
                  ],
                ), ),
          ],
        ),
  )
  );
}