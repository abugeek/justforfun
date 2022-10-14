import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:age_calculator/age_calculator.dart';


void main() {
  
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextStyle txt = const TextStyle(fontSize: 20, color: Colors.white);
  String DD = "00", MM = "00", YYYY = "0000";

  int presentYear = 00;
  int presentMonth = 00;
  int presentDay = 00;

  int nMonth = 0;
  int nDay = 0;
  int nnMonth = 0;

  final datecontroller = TextEditingController();
  final monthcontroller = TextEditingController();
  final yearcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    DateTime currentDate = DateTime.now();
    String formattedDate = DateFormat('d MMM, y').format(currentDate);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            showDialog(context: context, builder: (context) => SimpleDialog(
              alignment: Alignment.center,
              
             title: Text('Yoshingni hisobla',),
             children: [
              Text('     G\'aniyev Asadbek va @abugeek',),
              SizedBox(height: 10,),
              TextButton(onPressed: () {
                Navigator.of(context).pop();
              }, 
              child: Text('Yopish'),),
             ],
             
            ),);
          }, icon: Icon(Icons.info,),),
        ],
        title: const Text(
          "AgeCalc",
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff202A43),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Bugungi kun",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          color: Color(0xff000000),
                        )),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 5)),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: h / 13,
                    width: w,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      formattedDate,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1C003E),
                      ),
                    ),
                  ), 
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 15)),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Tug\'ilgan kun",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          color: Color(0xff000000),
                        )),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 5)),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          height: h / 13,
                          width: w / 3,
                          child: Align(
                            child: TextField(
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              controller: datecontroller,
                              onChanged: (d) {
                                DD = d;
                                print("$DD");
                              },
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                  hintText: "Kun", border: OutlineInputBorder()),
                            ),
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(right: 5)),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          height: h / 13,
                          width: w / 3,
                          child: Align(
                            child: TextField(
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              controller: monthcontroller,
                              onChanged: (m) {
                                MM = m;
                                print("$MM");
                              },
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                  hintText: "Oy", border: OutlineInputBorder()),
                            ),
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(right: 5)),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          height: h / 13,
                          width: w / 3,
                          child: Align(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              controller: yearcontroller,
                              onChanged: (y) {
                                YYYY = y;
                                print("$YYYY");
                              },
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                  hintText: "Yil",
                                  border: OutlineInputBorder()),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 35)),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              datecontroller.clear();
                              monthcontroller.clear();
                              yearcontroller.clear();
                            });
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            height: h / 16,
                            width: w / 2,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: const Color(0xff13547A)),
                                borderRadius: BorderRadius.circular(8)),
                            child: const Align(
                                child: Text(
                              "O\'chirish",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(right: 5)),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              presentMonth = currentDate.month - int.parse(MM);
                              presentYear = (currentDate.month < int.parse(MM))
                                  ? (currentDate.year - int.parse(YYYY)) - 1
                                  : (currentDate.year - int.parse(YYYY));
                              presentDay = 30 - int.parse(DD);

                              // nMonth = int.parse(MM) - currentDate.month;
                              nnMonth = currentDate.difference(DateTime(int.parse(YYYY), int.parse(MM), int.parse(DD),)).inDays *24 ;
                              nDay = currentDate.day - int.parse(DD);
                              // nnMonth = (int.parse(MM) + currentDate.month);
                            });
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            height: h / 16,
                            width: w / 2,
                            decoration: BoxDecoration(
                                color: const Color(0xff13547A),
                                borderRadius: BorderRadius.circular(8)),
                            child: const Align(
                                child: Text(
                              "Hisoblash",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            )),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Xozirgi yoshingiz",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          color: Color(0xff000000),
                        )),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 5)),
                  Container(
                    height: h / 6,
                    width: w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xff13547A), Color(0xff203A43)])),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("$presentYear", style: txt),
                            Text("Yil", style: txt)
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("$presentMonth", style: txt),
                            Text("Oy", style: txt)
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("$presentDay", style: txt),
                            Text("Kun", style: txt)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Jami Soat",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          color: Color(0xff000000),
                        )),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 5)),
                  Container(
                    height: h / 6,
                    width: w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [Color(0xff6BBED9), Color(0xff006ACb)])),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("$nnMonth", style: txt),
                            Text("soat", style: txt)
                          ],
                        ),
                        /* Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("$nDay", style: txt),
                            Text("DD", style: txt)
                          ],
                        ), */
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}