import 'package:flutter/material.dart';
import 'package:healthify/user/pharmacy/medDetails.dart';
class Medicines extends StatefulWidget {
  @override
  _meds createState() => _meds();
}

class _meds extends State<Medicines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
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
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        prefixIcon: Icon(Icons.search),
                        hintText:'Search drugs, categories',
                      ),
                    ),
               // color: Colors.grey,
                width: 100,
                height: 80,
              ),
          //SizedBox(height: 8,),
          Container(
            width: 200,
            height: 200,
            margin: EdgeInsets.fromLTRB(20, 8, 20, 8),
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
          SizedBox(height: 10,),
          Container(
            //color: Colors.grey,
            height: 70,
            width: 200,
            margin: EdgeInsets.fromLTRB(20, 8, 20, 8),
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Text("Popular Products",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),),
                SizedBox(width: 10,),
                TextButton(
                  child: Text('see all',style: TextStyle(
                    color: Colors.blueAccent,
                  ),),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 6,),
          Container(
            margin: EdgeInsets.fromLTRB(20, 2, 20, 8),
                height: 202,
                child: ListView(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 160,
                      //color: Colors.red,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Image(image: AssetImage('assets/images/paracetamol.jpg'),height: 80,width: 100,),
                          SizedBox(height: 19,),
                          Text("Paracetamol",style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),),
                          SizedBox(height: 8,),
                          Text("20pcs",style: TextStyle(fontSize: 12,color: Colors.grey),),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Image(image: AssetImage('assets/images/rupee.jpg'),height: 25,width: 25,),
                              Row(
                                children: [
                                  Text("50",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18
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
                    SizedBox(width: 10,),
                    Container(
                      width: 160,
                      //color: Colors.red,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Image(image: AssetImage('assets/images/paracetamol.jpg'),height: 80,width: 100,),
                          SizedBox(height: 19,),
                          Text("Paracetamol",style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),),
                          SizedBox(height: 8,),
                          Text("20pcs",style: TextStyle(fontSize: 12,color: Colors.grey),),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Image(image: AssetImage('assets/images/rupee.jpg'),height: 25,width: 25,),
                              Row(
                                children: [
                                  Text("50",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18
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
                    SizedBox(width: 10,),
                    Container(
                      width: 160,
                      //color: Colors.red,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Image(image: AssetImage('assets/images/paracetamol.jpg'),height: 80,width: 100,),
                          SizedBox(height: 19,),
                          Text("Paracetamol",style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),),
                          SizedBox(height: 8,),
                          Text("20pcs",style: TextStyle(fontSize: 12,color: Colors.grey),),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Image(image: AssetImage('assets/images/rupee.jpg'),height: 25,width: 25,),
                              Row(
                                children: [
                                  Text("50",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18
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
                    SizedBox(width: 10,),
                    Container(
                      width: 160,
                      //color: Colors.red,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Image(image: AssetImage('assets/images/paracetamol.jpg'),height: 80,width: 100,),
                          SizedBox(height: 19,),
                          Text("Paracetamol",style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),),
                          SizedBox(height: 8,),
                          Text("20pcs",style: TextStyle(fontSize: 12,color: Colors.grey),),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Image(image: AssetImage('assets/images/rupee.jpg'),height: 25,width: 25,),
                              Row(
                                children: [
                                  Text("50",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18
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
                  ],
                ),
              ),


          Container(
            height: 70,
            width: 200,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Text("Products On Sale",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                SizedBox(width: 10,),
                TextButton(
                  child: Text('see all',style: TextStyle(
                    color: Colors.blueAccent,
                  ),),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 6,),
          Container(
            margin: EdgeInsets.fromLTRB(20, 2, 20, 8),
            height: 202,
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 160,
                  //color: Colors.red,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Image(image: AssetImage('assets/images/paracetamol.jpg'),height: 80,width: 100,),
                      SizedBox(height: 19,),
                      Text("Paracetamol",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),),
                      SizedBox(height: 8,),
                      Text("20pcs",style: TextStyle(fontSize: 12,color: Colors.grey),),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Image(image: AssetImage('assets/images/rupee.jpg'),height: 25,width: 25,),
                          Row(
                            children: [
                              Text("50",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
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
                SizedBox(width: 10,),
                Container(
                  width: 160,
                  //color: Colors.red,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Image(image: AssetImage('assets/images/paracetamol.jpg'),height: 80,width: 100,),
                      SizedBox(height: 19,),
                      Text("Paracetamol",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),),
                      SizedBox(height: 8,),
                      Text("20pcs",style: TextStyle(fontSize: 12,color: Colors.grey),),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Image(image: AssetImage('assets/images/rupee.jpg'),height: 25,width: 25,),
                          Row(
                            children: [
                              Text("50",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
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
                SizedBox(width: 10,),
                Container(
                  width: 160,
                  //color: Colors.red,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Image(image: AssetImage('assets/images/paracetamol.jpg'),height: 80,width: 100,),
                      SizedBox(height: 19,),
                      Text("Paracetamol",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),),
                      SizedBox(height: 8,),
                      Text("20pcs",style: TextStyle(fontSize: 12,color: Colors.grey),),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Image(image: AssetImage('assets/images/rupee.jpg'),height: 25,width: 25,),
                          Row(
                            children: [
                              Text("50",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
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
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MedicineDetails()),
                    );
                  },
                  child: Container(
                    width: 160,
                    //color: Colors.red,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Image(image: AssetImage('assets/images/paracetamol.jpg'),height: 80,width: 100,),
                        SizedBox(height: 19,),
                        Text("Paracetamol",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),),
                        SizedBox(height: 8,),
                        Text("20pcs",style: TextStyle(fontSize: 12,color: Colors.grey),),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Image(image: AssetImage('assets/images/rupee.jpg'),height: 25,width: 25,),
                            Row(
                              children: [
                                Text("50",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}