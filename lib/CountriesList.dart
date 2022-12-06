import 'package:covid_19_tracker/CountryData.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_tracker/API.dart';
import 'package:shimmer/shimmer.dart';
class CountriesList extends StatefulWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController _textEditingController = TextEditingController();
  APIs countriesData = APIs();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Countries List'),
        backgroundColor: Theme.of(context).backgroundColor ,
      ),
     body: SafeArea(

       child: Column(

         children: [
           Padding(
             padding: const EdgeInsets.all(10.0),
             child: TextFormField(
               controller: _textEditingController,
               onChanged: (value){
                    setState(() {

                    });
               },
               decoration: InputDecoration(
                 hintText: 'Search with country name',
                 prefixIcon: Icon(Icons.search),
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(20)
                 )
               ),


             ),
           ),
           Expanded(
             child: FutureBuilder(
                 future: countriesData.countriesData() ,
               builder: (context, AsyncSnapshot<List<dynamic>> snapshot ){
                   if(!snapshot.hasData){
                     return ListView.builder(
                         itemCount: 7,
                         itemBuilder: (context,index){
                                  return Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.white30,


                                  child: Column(
                                  children: [
                                  ListTile(
                                  leading: Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.white

                                  ),
                                  title: Container(
                                  height: 20,
                                  width: 89,
                                  color: Colors.white
                                  ),
                                  subtitle: Container(
                                  height: 10,
                                  width: 89,
                                  color: Colors.white
                                  ),

                                  ),
                                  ],
                                  )
                                  );
                                  }

                                  );



                   }else{
                     return ListView.builder(
                         itemCount: snapshot.data!.length,
                         itemBuilder: (context,index){
                           String name = snapshot.data![index]['country'];
                           if(_textEditingController.text.isEmpty){
                             return Column(
                               children: [
                                 GestureDetector(
                                   onTap: (){
                                     Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryData(
                                         name: snapshot.data![index]['country'].toString(),
                                         total: snapshot.data![index]['cases'].toString(),
                                         recovered: snapshot.data![index]['recovered'].toString(),
                                         deaths: snapshot.data![index]['deaths'].toString(),
                                         today_cases: snapshot.data![index]['todayCases'].toString(),
                                         today_deaths: snapshot.data![index]['todayDeaths'].toString(),
                                         active: snapshot.data![index]['active'].toString(),
                                         critical: snapshot.data![index]['critical'].toString(),
                                         flag: snapshot.data![index]['countryInfo']['flag']
                                     )));
                                   },
                                   child: ListTile(
                                     leading: Image(
                                       height: 50,
                                       width: 50,
                                       image: NetworkImage(snapshot.data![index]['countryInfo']['flag'].toString()),
                                     ),
                                     title: Text(snapshot.data![index]['country'].toString()),
                                     subtitle: Text(snapshot.data![index]['cases'].toString()),
                                   ),
                                 ),
                               ],
                             );
                           }
                           else if(name.toLowerCase().contains(_textEditingController.text.toLowerCase())){
                             return Column(
                               children: [
                                 GestureDetector(
                                   onTap: (){
                                     Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryData(
                                         name: snapshot.data![index]['country'].toString(),
                                         total: snapshot.data![index]['cases'].toString(),
                                         recovered: snapshot.data![index]['recovered'].toString(),
                                         deaths: snapshot.data![index]['deaths'].toString(),
                                         today_cases: snapshot.data![index]['todayCases'].toString(),
                                         today_deaths: snapshot.data![index]['todayDeaths'].toString(),
                                         active: snapshot.data![index]['active'].toString(),
                                         critical: snapshot.data![index]['critical'].toString(),
                                         flag: snapshot.data![index]['countryInfo']['flag']
                                     )));
                                   },
                                   child: ListTile(
                                     leading: Image(
                                       height: 50,
                                       width: 50,
                                       image: NetworkImage(snapshot.data![index]['countryInfo']['flag'].toString()),
                                     ),
                                     title: Text(snapshot.data![index]['country'].toString()),
                                     subtitle: Text(snapshot.data![index]['cases'].toString()),
                                   ),
                                 ),
                               ],
                             );
                           }
                           else{
                             return Container();
                           }

                         }
                     );
                   }

             }
             ),
           ),
         ],
       ),
     ),
    );
  }
}
