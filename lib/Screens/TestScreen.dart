import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/TestModel.dart';

class Design extends StatefulWidget {
  DesignState createState() => DesignState();
}

class DesignState extends State<Design> {

  TestModel testModel = null;

  bool loading = true;

  Future<String> getData() async {
    setState(() {
      loading = true;
    });

    final responseData = await http.get("https://testffc.nimapinfotech.com/testdata.json");
    if (responseData.statusCode == 200) {
      final data = jsonDecode(responseData.body);
      print(responseData.body);

      testModel = testModelFromJson(responseData.body);

    }
    setState(() {});
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: Text("Record List"),
        ),
        body: Container(
          height: double.infinity,
          child: ListView.builder(
            itemCount: testModel == null ? 0 : testModel.data.records.length,
            itemBuilder: (context, int index) {
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      // image: DecorationImage(image: NetworkImage("${testModel.data.records[1].mainImageUrl}")),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage("https://i.pinimg.com/originals/59/c9/a4/59c9a4188f9531106886e87d24bf058d.jpg")),
                    ),
                    //  color: Colors.green,
                    height: 200.0,
                    width: double.infinity,
                    child: Stack(
                      alignment: AlignmentDirectional.topStart,
                      overflow: Overflow.visible,
                      fit: StackFit.loose,
                      children: [
                        Positioned(
                            bottom: -50,
                            left: 10.0,
                            right: 10.0,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    height: 120,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 110,
                                          child: Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      15.0)),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                            child: Text(
                                                              testModel == null
                                                                  ? ""
                                                                  : testModel
                                                                  .data
                                                                  .records[index]
                                                                  .title
                                                                  .toString(),
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                              ),
                                                            ),
                                                          ),
                                                      ),

                                                      Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .only(
                                                            right: 10.0),
                                                        child: Icon(
                                                          Icons.favorite,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            testModel == null
                                                                ? ""
                                                                : testModel
                                                                .data
                                                                .records[
                                                            index]
                                                                .shortDescription
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.blueGrey,
                                  radius: 35,
                                  child: Text(
                                    "100%",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                  Container(
                    //color: Colors.red,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: Column(
                                      children: [
                                        Text( testModel == null
                                            ? ""
                                            : "₹ ${testModel
                                            .data
                                            .records[
                                        index]
                                            .collectedValue
                                            .toString()}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("Funded",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
                                      ],
                                    )),
                                Expanded(
                                    child: Column(
                                      children: [
                                        Text( testModel == null
                                            ? ""
                                            : "₹ ${testModel
                                            .data
                                            .records[
                                        index]
                                            .totalValue
                                            .toString()}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("Goals",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
                                      ],
                                    )),
                                Expanded(
                                    child: Column(
                                      children: [
                                        Text("36",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("Ends In",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
                                      ],
                                    )),
                                Expanded(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 10),
                                          child: Container(
                                            width: 100,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                              BorderRadius.circular(10.0),
                                            ),
                                            child: FlatButton(
                                              onPressed: () {},
                                              child: FittedBox(
                                                child: Text(
                                                  "PLEDGE",
                                                  style: TextStyle(
                                                      color: Colors.blueAccent),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                              ],
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              );
            },
          ),
        ));
  }


}
