import 'package:flutter_web/material.dart';
import 'package:after_io_demo/screens/sessions.dart';
import 'package:after_io_demo/util/tracks.dart';
import 'package:after_io_demo/util/speakers.dart';
import 'package:after_io_demo/util/session.dart';
import 'package:after_io_demo/widgets/slide_item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home>{
  final TextEditingController _searchControl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: PreferredSize(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: Card(
            elevation: 6.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: TextField(
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.white,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white,),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "Search..",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  suffixIcon: Icon(
                    Icons.filter_list,
                    color: Colors.black,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                maxLines: 1,
                controller: _searchControl,
              ),
            ),
          ),
        ),
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          60.0,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Speakers",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                FlatButton(
                  child: Text(
                    "See all (${(speakers.length+1).toString()})",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onPressed: (){
                  },
                ),
              ],
            ),

            SizedBox(height: 10.0),

            Container(
              height: 50.0,
              child: ListView.builder(
                primary: false,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: speakers == null ? 0:speakers.length,
                itemBuilder: (BuildContext context, int index) {
                  String img = speakers[index];

                  return Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        img,
                      ),
                      radius: 25.0,
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 10.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Sessions",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                FlatButton(
                  child: Text(
                    "See all (${(sessions.length+1).toString()})",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context){
                          return Sessions();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),

            SizedBox(height: 10.0),
            Container(
              height: MediaQuery.of(context).size.height/2.4,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: sessions == null ? 0 :sessions.length,
                itemBuilder: (BuildContext context, int index) {
                  Map session = sessions[index];

                  return Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: SlideItem(
                      img: session["img"],
                      name: session["name"],
                      title: session["title"],
                      time: session["time"],
                      track: session["track"],
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 10.0),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Tracks",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                FlatButton(
                  child: Text(
                    "See all (${(tracks.length +1).toString()})",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onPressed: (){
                  },
                ),
              ],
            ),

            SizedBox(height: 10.0),
            Container(
              height: MediaQuery.of(context).size.height/6,
              child: ListView.builder(
                primary: false,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: tracks == null ? 0:tracks.length,
                itemBuilder: (BuildContext context, int index) {
                  Map cat = tracks[index];

                  return Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            cat["img"],
                            height: MediaQuery.of(context).size.height/6,
                            width: MediaQuery.of(context).size.height/6,
                            fit: BoxFit.cover,
                          ),

                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.2, 0.7],
                                colors: [
                                  cat['color1'],
                                  cat['color2'],
                                ],
                              ),
                            ),
                            height: MediaQuery.of(context).size.height/6,
                            width: MediaQuery.of(context).size.height/6,
                          ),


                          Center(

                            child: Container(
                              height: MediaQuery.of(context).size.height/6,
                              width: MediaQuery.of(context).size.height/6,
                              padding: EdgeInsets.all(1),
                              constraints: BoxConstraints(
                                minWidth: 20,
                                minHeight: 20,
                              ),
                              child: Center(
                                child: Text(
                                  cat["name"],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 30.0),


          ],
        ),
      ),
    );

  }

  @override
  bool get wantKeepAlive => false;


}
