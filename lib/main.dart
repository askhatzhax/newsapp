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
      darkTheme: ThemeData(brightness: Brightness.dark),
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
          "https://sun9-10.userapi.com/impf/0e5k9NwBWgEe2nbdNEdghvLe8-EsHroonakNqQ/mJqwF1sp7wU.jpg?size=1080x1044&quality=96&sign=b8aa811dec81e922763dfd03f523c6f9&type=album",
            "Левандовский перешел в лучший клуб мира",
            "Fabrizio Romano",
            "22.07.2022",
        ),
        ListItem(
          "https://sun2.dataix-kz-akkol.userapi.com/impf/kouh7t7QItBj5-mDRaXQ2sP7HgShmiPEnBiV9w/drERin3yt5w.jpg?size=1600x1115&quality=95&sign=8761673c210e26f8fb2abbb7094d1541&type=album",
          "Никто не хочет подписывать Роналду, так как он с Абайской области",
          "adil kabluk",
          "21.07.2022",
        ),
        ListItem(
          "https://sun1.dataix-kz-akkol.userapi.com/impg/u2543KdsvaFwaEc0jOzt0pmqydRu4ovGIyAkNw/OJwi-h54JfM.jpg?size=1920x1279&quality=96&sign=310d8944165a229ebe2b21e52043c98b&type=album",
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
          "https://sun9-21.userapi.com/impf/c627116/v627116236/2fa5e/I0zh-wgnmp4.jpg?size=590x384&quality=96&sign=7e7b589bdfa532a284dc9d3f0742c076&type=album",
          lipsum.createWord(numWords: 6),
          lipsum.createWord(numWords: 2),
          "19.07.2022",
        ),
      ];
      List<Tab> _tabList = [
      Tab(child: Text("Popular"),),
      Tab(child: Text("Sport"),),
      Tab(child: Text("Science"),),
      Tab(child: Text("Busines"),),
      Tab(child: Text("Favorites"),),
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
              color: Colors.cyan,
            )
        ),
        backgroundColor: Colors.yellow[50],
        centerTitle: true,
        title: Text("Newsapp",style: TextStyle(
          color: Colors.amber,
        ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: TabBar(
            indicatorColor: Colors.amber,
            isScrollable: true,
            labelColor: Colors.cyan,
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