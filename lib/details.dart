import 'package:flutter/material.dart';
import 'package:newnews/shared/lipsum.dart' as lipsum;
import 'package:newnews/shared/listitem.dart';

class DetailsScreen extends StatelessWidget {
  final String tag;
  final ListItem item;

  DetailsScreen({ Key? key, required this.item , required this.tag})
      : super( key:key );

  @override
  Widget build(BuildContext context){
    return Container(
      child: Scaffold(
        backgroundColor: Colors.yellow[50],
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                      tag: '${item.newsTitle}',
                      child: Image.network(item.imgUrl)),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Text(
                            item.newsTitle,
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(children: [
                            Icon(Icons.person,color:Colors.indigo ,),
                            Text(
                              item.author,
                              style: TextStyle(
                                fontSize: 12.0,

                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Icon(Icons.date_range,color:Colors.indigo ,),
                            Text(
                              item.date,
                              style: TextStyle(
                                fontSize: 12.0,

                              ),
                            ),
                          ],
                          ),
                          SizedBox(height: 20.0,),
                          Text(
                            lipsum.createParagraph(numParagraphs: 4),
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          )
                        ],
                      ),
                  )

                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 12.0),
              child: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                } ,
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.cyan,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


