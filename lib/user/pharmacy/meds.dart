import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:healthify/user/pharmacy/medDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Medicines extends StatefulWidget {
  @override
  _meds createState() => _meds();
}
class _meds extends State<Medicines> {
  final ref = FirebaseFirestore.instance.collection("Inventory");

  TextEditingController _searchController = TextEditingController();
  List<CardData> _allCards = [];

  void initState() {
    super.initState();
    // Fetch data from Firestore and populate _allCards
    fetchDataFromFirestore().then((_) {
      filterCards(""); // Display all cards initially
    });
  }

  Future<void> fetchDataFromFirestore() async{
    // Replace 'cards' with your Firestore collection name
    await FirebaseFirestore.instance.collection('Inventory').get().then((querySnapshot) {
      setState(() {
        _allCards = querySnapshot.docs.map((doc) => CardData.fromDocument(doc)).toList();
      });
    });
  }

  List<CardData> _filteredCards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Pharmacy',
        style: TextStyle(
          color: Colors.black
        ),
        textAlign: TextAlign.center)
      ),
      body: ListView(
        children: [

          //SizedBox(height: 8,),
          Container(
            width: 200,
            height: 200,
            margin: EdgeInsets.fromLTRB(20, 8, 12, 8),
            padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
            //color: Colors.lightBlueAccent,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Text("Order quickly",
                        textAlign: TextAlign.left,
                        style:TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        )),
                    SizedBox(height: 8,),
                    Text("with prescription",
                        textAlign: TextAlign.left,
                        style:TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        )),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue[600]),
                        elevation: MaterialStateProperty.resolveWith<double?>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed))
                                return 16;
                              return null;
                            }),
                      ),
                      onPressed: () { },
                      child: Text('upload prescription'),
                    )
                  ],

                ),

                Image(image: AssetImage('assets/images/medF.png'),height: 280,width: 134,),
              ],
            ),

          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                prefixIcon: Icon(Icons.search),
                hintText:'Search drugs, categories',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    filterCards("");
                  },
                ),
              ),
              onChanged: (value) {
                filterCards(value);
              },
            ),
            // color: Colors.grey,
            width: 100,
            height: 80,
          ),
          SizedBox(height: 10,),
          Container(
            //color: Colors.grey,
            height: 70,
            width: 200,
            margin: EdgeInsets.fromLTRB(20, 0, 20, 5),
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Text("Popular Products",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                // SizedBox(width: 10,),
                // TextButton(
                //   child: Text('see all',style: TextStyle(
                //     color: Colors.blueAccent,
                //   ),),
                //   style: ButtonStyle(
                //       backgroundColor: MaterialStateProperty.all(Colors.white)),
                //   onPressed: () {},
                // ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 2, 20, 8),
            height: 202,
            child: StreamBuilder(
                stream: ref.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  return ListView.builder(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _filteredCards.length,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MedicineDetails(docToView: snapshot
                                .data!.docs
                                .elementAt(
                                index))),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 2, 5, 2),
                          width: 180,
                          //color: Colors.red,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Image(image: AssetImage(_filteredCards[index].image),height: 80,width: 100,),
                              SizedBox(height: 12,),
                              Text(_filteredCards[index].med_name,style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),),
                              SizedBox(height: 5,),
                              Text(_filteredCards[index].quantity,style: TextStyle(fontSize: 12,color: Colors.grey),),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Image(image: AssetImage('assets/images/rupee.jpg'),height: 25,width: 25,),
                                  Row(
                                    children: [
                                      Text(_filteredCards[index].price.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16
                                        ),),
                                      SizedBox(width: 60,),
                                      IconButton(
                                        color: Colors.blueAccent,
                                        icon: const Icon(Icons.add),
                                        tooltip: 'Increase volume by 10',
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
            ),
          ),

          Container(
            height: 70,
            width: 200,
            margin: EdgeInsets.fromLTRB(20, 8, 20, 5),
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Text("Products On Sale",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                // SizedBox(width: 10,),
                // TextButton(
                //   child: Text('see all',style: TextStyle(
                //     color: Colors.blueAccent,
                //   ),),
                //   style: ButtonStyle(
                //       backgroundColor: MaterialStateProperty.all(Colors.white)),
                //   onPressed: () {},
                // ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 2, 20, 15),
            height: 202,
            child: StreamBuilder(
                stream: ref.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  return ListView.builder(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.hasData ? (snapshot.data?.docs.length) : 0,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MedicineDetails(docToView: snapshot
                                .data!.docs
                                .elementAt(
                                index))),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 2, 5, 2),
                          width: 180,
                          //color: Colors.red,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Image(image: AssetImage((snapshot.data!.docs
                                  .elementAt(index)
                                  .data()
                              as Map)['image']
                                  .toString()),height: 80,width: 100,),
                              SizedBox(height: 12,),
                              Text((snapshot.data!.docs
                                  .elementAt(index)
                                  .data()
                              as Map)['med_name']
                                  .toString(),style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),),
                              SizedBox(height: 5,),
                              Text((snapshot.data!.docs
                                  .elementAt(index)
                                  .data()
                              as Map)['quantity']
                                  .toString(),style: TextStyle(fontSize: 12,color: Colors.grey),),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Image(image: AssetImage('assets/images/rupee.jpg'),height: 25,width: 25,),
                                  Row(
                                    children: [
                                      Text((snapshot.data!.docs
                                          .elementAt(index)
                                          .data()
                                      as Map)['price']
                                          .toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16
                                        ),),
                                      SizedBox(width: 60,),
                                      IconButton(
                                        color: Colors.blueAccent,
                                        icon: const Icon(Icons.add),
                                        tooltip: 'Increase volume by 10',
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
            ),
          ),
        ],
      ),

    );
  }
  void filterCards(String query) {
    setState(() {
      _filteredCards = (query == "") ? _allCards :
      _allCards.where((card) {
        final containsName = card.med_name.toLowerCase().contains(query.toLowerCase());
        return containsName;
      }).toList();
    });
  }

}

class CardData {
  final String med_name;
  final String image;
  final String quantity;
  final int price;

  CardData({
    required this.med_name,
    required this.image,
    required this.quantity,
    required this.price,
  });

  factory CardData.fromDocument(QueryDocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return CardData(
      med_name: data['med_name'] ?? '',
      image: data['image'] ?? '',
      quantity: data['quantity'] ?? '',
      price: data['price'] ?? '',
    );
  }
}