import 'dart:ffi';
import 'dart:ui';

import 'package:posttest6_1915016121_rhennanurlisa/controller/drawer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'costume_alert.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:posttest6_1915016121_rhennanurlisa/controller/item_card.dart';
import 'package:posttest6_1915016121_rhennanurlisa/controller/event.dart';
import 'package:flutter/foundation.dart';

  
class Calendar extends StatefulWidget {

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat format = CalendarFormat.month; // agar format dalam bulan tampil
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text("My Calendar"),
    centerTitle: true,
      ),
      
      body: TableCalendar( // package kalender
        // focusedDay: DateTime.now(),
        focusedDay: selectedDay, //menunjukkan hari ini
        firstDay: DateTime(2021),  // menunjukkan kalender dimulai dari tahun brp
        lastDay: DateTime(2030), // menunjukkan berakhirnya kalender

        calendarFormat: format, 
        onFormatChanged: (CalendarFormat fformat){ //untuk mengubah kalender berdasarkan bulannya atau mingguannya
          setState(() {
            format = fformat;
            });
          },

          startingDayOfWeek: StartingDayOfWeek.sunday, //untuk memulai hari dari sunday // memperlihatkan hri dlm sminggu
          daysOfWeekVisible: true,

            //day changed
          onDaySelected: (DateTime selectDay,DateTime focuseDay) {

            setState(() {
              selectedDay = selectDay;
              focusedDay = focuseDay;
            });

              // ignore: avoid_print
            print(focusedDay);
          },

          selectedDayPredicate: (DateTime date) {
            return isSameDay(selectedDay, date);
          },
            
            //to style the calender
          calendarStyle: CalendarStyle( // decoration kalender
            isTodayHighlighted: true,
            selectedDecoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),

            selectedTextStyle: TextStyle(color: Colors.black), 
            todayDecoration: BoxDecoration(
              color: Colors.red, 
              shape: BoxShape.circle,
            ),
          ),

          headerStyle: HeaderStyle(
            formatButtonVisible: true,
            titleCentered: true, 
            formatButtonShowsNext: false, 
            formatButtonDecoration: 
            BoxDecoration(color: Colors.transparent
            ),
            formatButtonTextStyle: TextStyle(
              color: Colors.blueGrey,
            ),
          ),
        ),

        drawer: MyDrawer(),
      );
  }
}

class For extends StatefulWidget {
  const For({Key? key}) : super(key: key);

  @override
  State<For> createState()=> _FromState();
}

enum Survive { Formal, NonFormal, SemiFormal}

class _FromState extends State<For> {
  Future<Void> showInformationDialog(BuildContext context) async{
    return await showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          backgroundColor: Color.fromARGB(22, 0, 0, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
               SizedBox(height: 15),
                Text(
                  "Data di simpan",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
            ],
          ),

          actions: <Widget>[
              SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: double.infinity,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "OK",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
              ),
            ],
        );
      },
    );
  }

  TextEditingController controllernama = TextEditingController();
  TextEditingController controllerwaktu = TextEditingController();
  TextEditingController _myController = TextEditingController();

  String namaAgenda = '', waktuAgenda = '';

  bool nilaiCheckbox = false;
  List<String> survive = ["Formal", "NonFormal", "SemiFormal"];
  String survivee= "";

  @override
  void dispose() {
    controllernama.dispose();
    controllerwaktu.dispose();
    super.dispose();
  }

  @override
  void hapusValue() {
    controllernama.text = "";
    controllerwaktu.text = "";
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference Agenda = firestore.collection("Agenda");
    return Scaffold(
      appBar: AppBar(
      title: const Text("AGENDA"),
      centerTitle: true,
      ),
      
      body: Container(
        color: Color.fromARGB(255, 219, 216, 218),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(23),
              child: Column(
                children: [
                  TextFormField(
                    controller: controllernama,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 29, 202, 202),
                          )
                        ),
                        hintText: "Nama Agenda",
                        labelText: "Nama Agenda",
                    ),
                  ),

                  SizedBox(height: 25),
                  TextFormField(
                    controller: controllerwaktu,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 29, 202, 202),
                          )
                        ),
                        hintText: "Waktu Agenda",
                        labelText: "Waktu Agenda",
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 25),
                    child: Row(
                      children: [
                        Checkbox(
                          value: nilaiCheckbox, 
                          onChanged: (bool? value){
                            setState(() {
                              nilaiCheckbox = value!;
                            });
                          }),

                          Text(
                            "Nyalakan Notifikasi?",
                            style: TextStyle(
                              color: Color.fromARGB(255, 200, 5, 21),
                            ),
                          ),
                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 15),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (var item in survive)
                        Column(
                          children: [
                            Radio(
                              value: item, 
                              groupValue: survivee, 
                              onChanged: (newValue){
                                setState(() {
                                  survivee = newValue.toString();
                                });
                              }
                            ),
                            Text(item),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: 250,
                    height: 40,
                    margin: EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: () async{
                        await showInformationDialog(context);
                        setState(() {
                          Agenda.add({
                            'NamaAgenda' : controllernama.text,
                            'WaktuAgenda': controllerwaktu.text,
                            'DilaksanakanSecara' : survivee,
                            'NyalakanNotifikasi'  : nilaiCheckbox,
                          });

                          namaAgenda = controllernama.text;
                          waktuAgenda = controllerwaktu.text;

                          hapusValue();
                        });
                        CustomAlert(context, _myController.text);
                      }, 
                      
                      child: Text("Tambah"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            StreamBuilder<QuerySnapshot>(
              stream: Agenda.snapshots(),
              builder: (context, snapshot) {
                return (snapshot.hasData)
                    ? Column(
                        children: snapshot.data!.docs
                            .map(
                              (e) => ItemCard(
                                e.get('NamaAgenda'),
                                e.get('WaktuAgenda'),
                                e.get('DilaksanakanSecara'),
                                e.get('NyalakanNotifikasi'),

                                onUpdate: () {
                                  Agenda.doc(e.id).update({
                                    'NamaAgenda': controllernama.text,
                                    'WaktuAgenda': controllerwaktu.text,
                                    'DilaksanakanSecara': survivee,
                                    'NyalakanNotifikasi': nilaiCheckbox,
                                  });
                                  namaAgenda = controllernama.text;
                                  waktuAgenda = controllerwaktu.text;
                            

                                  hapusValue();
                                },
                                onDelete: () {
                                  Agenda.doc(e.id).delete();
                                },
                              ),
                            )
                            .toList(),
                      )
                    : Text('Loading');
                  },
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  static final List<Widget> tabBar = [
    Tab(text: "Peringatan Hari Besar"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabBar.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Lainnya"),
          backgroundColor: Color.fromARGB(255, 15, 162, 108),
          bottom: TabBar(tabs: tabBar),
        ),
        body: ListView(
        children: [
          Column(
            children: [
              
              Text("\t\t \n Sabtu, 1 Januari 2022: Tahun Baru 2022 Masehi"),
              Text("\n Selasa, 1 Februari 2022: Tahun Baru Imlek 2573 Kongzili "),
              Text("\n Senin, 28 Februari 2022: Isra Mikraj Nabi Muhammad SAW"),
              Text("\n Kamis, 3 Maret : Hari Suci Nyepi Tahun Baru Saka 1944"),
              Text("\n Jumat, 15 April : Wafat Isa Almasih"),
              Text("\n Minggu, 1 Mei : Hari Buruh Internasional"),
              Text("\n Senin-Selasa, 2-3 Mei : Hari Raya Idul Fitri 1443 Hijriyah"),
              Text("\n Senin, 16 Mei : Hari Raya Waisak 2566 BE"),
              Text("\n Kamis, 26 Mei : Kenaikan Isa Almasih"),
              Text("\n Rabu, 1 Juni : Hari Lahir Pancasila"),
              Text("\n Sabtu, 9 Juli : Hari Raya Idul Adha 1443 Hijriyah"),
              Text("\n Sabtu, 30 Juli : Tahun Baru Islam 1444 Hijriyah"),
              Text("\n Rabu, 17 Agustus : Hari Kemerdekaan RI"),
              Text("\n Sabtu, 8 Oktober : Maulid Nabi Muhammad SAW"),
              Text("\n Minggu, 25 Desember : Hari Raya Natal \t "),
              ],
            ),
          ],
        ),
        drawer: MyDrawer(),
      ),
    );
  }
}