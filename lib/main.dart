import 'package:flutter/material.dart';
import 'package:newnews/details.dart';
import 'package:newnews/listwidget.dart';
import 'package:newnews/shared/listitem.dart';
import 'package:newnews/shared/lipsum.dart' as lipsum;
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context ){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}
//, style: TextStyle(color: Colors.amber),
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
      List<ListItem> listTiles=[
        ListItem(
          "https://icdn.football-espana.net/wp-content/uploads/2022/03/Robert-Lewanssdowski-1.jpeg",
            "Левандовский перешел в лучший клуб мира",
            "Fabrizio Romano",
            "22.07.2022",
        ),
        ListItem(
          "https://ss.metronews.ru/userfiles/materials/124/1249483/858x540_c8799824.jpg",
          "Никто не хочет подписывать Роналду, так как он с Абайской области",
          "adil kabluk",
          "21.07.2022",
        ),
        ListItem(
          "https://images.unian.net/photos/2022_04/thumb_files/400_0_1650525794-9184.jpg?0.16182366475336663",
          "К сожалению бревно по имени Бензема скорее всего получить зм 2022г.",
          "Уйурский гуру",
          "20.07.2022",
        ),
        ListItem(
          "https://sun9-21.userapi.com/impf/c627116/v627116236/2fa5e/I0zh-wgnmp4.jpg?size=590x384&quality=96&sign=7e7b589bdfa532a284dc9d3f0742c076&type=album",
          "Говно-клуб Реал Мадрид победил в финале лч 2022",
          "машинаубийца",
          "29.05.2022",
        ),
        ListItem(
          "http://risovach.ru/upload/2013/12/mem/fraj_36425058_orig_.jpg",
          lipsum.createWord(numWords: 6),
          lipsum.createWord(numWords: 2),
          "19.07.2022",
        ),
      ];
      List<Tab> _tabList = [
      Tab(child: Text("Top"),),
      Tab(child: Text("Popular"),),
      Tab(child: Text("Trending"),),
      Tab(child: Text("Editor Choice"),),
      Tab(child: Text("Category"),),
      ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: (_tabList.length), vsync: this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();

  }
  late TabController _tabController;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.0,
        leading: IconButton(
          onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            )
        ),
        backgroundColor: Color(0xFFFAFAFA),
        centerTitle: true,
        title: Text("Newsapp",style: TextStyle(
          color: Colors.black,
        ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: TabBar(
            indicatorColor: Colors.black,
            isScrollable: true,
            labelColor: Colors.deepOrangeAccent,
            controller: _tabController,
            tabs: _tabList,

          ),
        )
      ),
      body: TabBarView(
          controller: _tabController,
          children: [
           Padding(
             padding: EdgeInsets.all(8.0),
             child: Container(
               child: ListView.builder(
                 itemCount: listTiles.length,
                 itemBuilder: (context, index){
                   return InkWell(
                     onTap:(){
                       Navigator.push(context, MaterialPageRoute(
                           builder : (context)=>DetailsScreen(
                             item: listTiles[index],
                             tag: listTiles[index].newsTitle,
                           )
                       ));
                     },
                     child: listWidget(listTiles[index]),
                   );
                 },
               ),
             ) ,
           ),
             Padding(
             padding: EdgeInsets.all(8.0),
             child: Container() ,
           ),
             Padding(
             padding: EdgeInsets.all(8.0),
             child: Container() ,
           ),
             Padding(
             padding: EdgeInsets.all(8.0),
             child: Container() ,
           ),
             Padding(
             padding: EdgeInsets.all(8.0),
             child: Container() ,
           ),

          ],
      ),
    );
  }
}