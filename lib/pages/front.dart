import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/bottomWave.dart';
import 'package:flutter_shop/widgets/featuredCarousel.dart';
import 'package:flutter_shop/widgets/searchAppBar.dart';
import '../widgets/featuredCarousel.dart';

import 'package:english_words/english_words.dart' as words;


class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {

  final List<String> kWords = List.from(Set.from(words.all))..sort(
      (w1, w2) => w1.toLowerCase().compareTo(w2.toLowerCase())
  );

  SearchAppBarDelegate _searchDelegate;
  
  @override 
  void initState() {
    super.initState();
    _searchDelegate = SearchAppBarDelegate(kWords);
  }

  @override
  void dispose() {
    super.dispose();
  }
  

  //Shows Search result
  void showSearchPage(BuildContext context,
    SearchAppBarDelegate searchDelegate) async {
    final String selected = await showSearch<String>(
      context: context,
      delegate: searchDelegate,
    );

    if (selected != null) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Your Word Choice: $selected'),
        ),
      );
    }
  }

  Widget getDummySearchButton() {

    double width = MediaQuery.of(context).size.width;
    double buttonWidth = width * .9;

    return Container(
      padding: EdgeInsets.fromLTRB(width * .1, 0, width * .08, 0),
      color: Colors.transparent,
      width: buttonWidth,
      height: 36,

      child:
      FlatButton(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
        color: Colors.green[800],
        textColor: Colors.grey,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.fromLTRB(buttonWidth * .08, 2, buttonWidth * .05, 2),
        onPressed: () {
          showSearchPage(context, _searchDelegate);
        },
        child: Row(
          children: <Widget>[
            
            Expanded(
              child: Text("mate 30", style: TextStyle(fontSize: 12.0),),
            ),

            ImageIcon(
              AssetImage("assets/images/search.png"),
              color: Colors.white,
              size: 42.0,
            ),

          ],
        ),),

    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      //backgroundColor: Colors.transparent,
      body: CustomScrollView(
        
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: MySliverAppBar(250, this),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate(_buildList(context, 50))
            ),
          ],
        ),
    );
  }

  List _buildList(BuildContext context, int count) {
    List<Widget> listItems = List();
    
    //***********  this is required to push the list lower at 220px more. ***********
    listItems.add(SizedBox(height: 280,));
    listItems.add(getTodayHotList(context));

    return listItems;
  }

  Widget getTodayHotList(BuildContext context) {
    
    double width = MediaQuery.of(context).size.width;
    
    return Container(
      width: width,
      padding: EdgeInsets.fromLTRB(width * .05, 0, width *.05, 0),
      child: Row(
        children: <Widget>[
          Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.start,
            spacing: 2.0,
            runSpacing: 20.0,

            children: <Widget>[
              getProductCard(context, "Apple iPhone 11", "https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Ficdn4.digitaltrends.com%2Fimage%2Fiphone-11r-3-1500x1500.jpg&f=1&nofb=1"),
              getProductCard(context, "Mi Mix Alpha", "https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Fphone.mesramobile.com%2Fwp-content%2Fuploads%2F2019%2F09%2Fxiaomi-mi-mix-alpha-price-malaysia-1.jpg&f=1&nofb=1"),
              getProductCard(context, "OPPO R17", "https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.xda-developers.com%2Ffiles%2F2018%2F08%2FOPPO-R17.jpg&f=1&nofb=1"),

              getProductCard(context, "Huawei Mate 30", "https://www.notebookcheck.com/fileadmin/Notebooks/News/_nc3/Huawei_Mate_30_Glas_Unibody_NBClogo_2.jpg"),
              getProductCard(context, "Huawei P30 Pro", "https://assets.mspimages.in/wp-content/uploads/2018/12/Huawei-P30-Pro-Aurora.png"),
              getProductCard(context, "VIVO NEX 3", "https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Fpropakistani.pk%2Fprice%2Fwp-content%2Fuploads%2F2018%2F06%2Fvivo-nex-s2-1-1.jpg&f=1&nofb=1"),

              getProductCard(context, "Huawei P30 Pro", "https://assets.mspimages.in/wp-content/uploads/2018/12/Huawei-P30-Pro-Aurora.png"),
              getProductCard(context, "NEX 3 5G", "https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Fpocketnow.com%2Fwp-content%2Fuploads%2F2019%2F09%2F0079Fyh9ly1g6n8wce3s1j30u01hcqe5.jpg&f=1&nofb=1"),
              getProductCard(context, "Apple iPhone 11", "https://static.esrgear.com/wp-content/uploads/2019/08/iPhone-11-Pro-Essential-Zero-Case-6.jpg"),
            ],
          ), 
          Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.start,
            spacing: 2.0,
            runSpacing: 20.0,
            children: <Widget>[              
              getProductCard(context, "Mi Mix Alpha", "https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Fphone.mesramobile.com%2Fwp-content%2Fuploads%2F2019%2F09%2Fxiaomi-mi-mix-alpha-price-malaysia-1.jpg&f=1&nofb=1"),
              getProductCard(context, "Huawei P30 Pro", "https://assets.mspimages.in/wp-content/uploads/2018/12/Huawei-P30-Pro-Aurora.png"),
              getProductCard(context, "Mi Mix Alpha", "https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Fphone.mesramobile.com%2Fwp-content%2Fuploads%2F2019%2F09%2Fxiaomi-mi-mix-alpha-price-malaysia-1.jpg&f=1&nofb=1"),
              
              getProductCard(context, "Huawei P30 Pro", "https://assets.mspimages.in/wp-content/uploads/2018/12/Huawei-P30-Pro-Aurora.png"),
              getProductCard(context, "NEX 3 5G", "https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Fpocketnow.com%2Fwp-content%2Fuploads%2F2019%2F09%2F0079Fyh9ly1g6n8wce3s1j30u01hcqe5.jpg&f=1&nofb=1"),
              getProductCard(context, "Apple iPhone 11", "https://static.esrgear.com/wp-content/uploads/2019/08/iPhone-11-Pro-Essential-Zero-Case-6.jpg"),

              getProductCard(context, "Huawei P30 Pro", "https://assets.mspimages.in/wp-content/uploads/2018/12/Huawei-P30-Pro-Aurora.png"),
              getProductCard(context, "Huawei Mate 30", "https://www.notebookcheck.com/fileadmin/Notebooks/News/_nc3/Huawei_Mate_30_Glas_Unibody_NBClogo_2.jpg"),
              getProductCard(context, "Apple iPhone 11", "https://static.esrgear.com/wp-content/uploads/2019/08/iPhone-11-Pro-Essential-Zero-Case-6.jpg"),
            ],
          ), 
        ],
      ), 
    );
  }

  Widget getProductCard(BuildContext context, String name, String url) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
          //color: const Color(0xFF66BB6A),
          boxShadow: [BoxShadow(
            color: Colors.white10,
            blurRadius: 2.0,
          ),]
      ),
      width: width * .45,
      padding: EdgeInsets.fromLTRB(2, 1, 2, 1),
      alignment: FractionalOffset.center,
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            print('Card tapped.');
          },
          child: Container(
            //width: width,
            child: Column(children: <Widget>[
              Image.network(url, fit: BoxFit.cover),
              Text('$name'),
            ],) 
          ),),
        
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  double expandedHeight;
  _FrontPageState parent;
  MySliverAppBar(double expandedHeight, _FrontPageState parent) { 
      this.expandedHeight = expandedHeight;
      this.parent = parent;
  }

  Widget getRoundButton(String name) {
    return RawMaterialButton(
        constraints: BoxConstraints(maxHeight: 52),
        onPressed: () {},
        child: Image.asset('assets/images/round/$name.png'),
        shape: CircleBorder(),
        elevation: 4.0,
        fillColor: Colors.white,
        //padding: const EdgeInsets.all(0.0),
      );
  }

  Widget getCategoryButtons() {
    return Container(
      //alignment: FractionalOffset.center,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: 10),
            Wrap(children: <Widget>[
              getRoundButton('allcat'),
              SizedBox(width: 10),
              getRoundButton('mencloth'),
              SizedBox(width: 10),
              getRoundButton('womencloth'),
              SizedBox(width: 10),
              getRoundButton('sports'),
              SizedBox(width: 10),
              getRoundButton('electronics'),
            ]
            ),
            SizedBox(height: 10),
            Wrap(children: <Widget>[
              getRoundButton('phone'),
              SizedBox(width: 10),
              getRoundButton('computer'),
              SizedBox(width: 10),
              getRoundButton('automobiles'),
              SizedBox(width: 10),
              getRoundButton('jewellery'),
              SizedBox(width: 10),
              getRoundButton('garden'),
            ]
            ),
            //Expanded(flex: 1, child: Container(),),
          ]
      ),
    );
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [

        // ********* Green Background ************
        ClipPath(
            clipper: BottomWaveClipper(),
            child: Container(
              
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.bottomCenter,
                    colors: [Colors.green[900], Colors.green[700]]
                )
              ),
              height: MediaQuery.of(context).size.height * 0.3,

              // ********* Search Button ************
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AppBar(
                    title: parent.getDummySearchButton(),
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    actions: <Widget>[
                      //Adding the search widget in AppBar
                      //TODO: add important shortcut action here, either wallet or cart.
                    ],
                  ),
                  
                ],
              ),
            ),
        ),

        // ********* Category Round Buttons ************
        Positioned(
          top: 380 - shrinkOffset * 1.1,
          left: MediaQuery.of(context).size.width * .05,
          child: Card(
              //color: Colors.green[800],
              color: Colors.transparent,
              elevation: 0,
              child: SizedBox(
                height: 130,
                width: MediaQuery.of(context).size.width * .9,
                child: getCategoryButtons(),
              ),
          ),
        ),

        // ********* Featured Slides ************
        
        Positioned(
          top: 92,
          bottom: -110,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: SizedBox(
                height: expandedHeight -10,
                width: MediaQuery.of(context).size.width,
                child: FeaturedCarousel(),
              ),
          ),
        ),
        
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 250;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}