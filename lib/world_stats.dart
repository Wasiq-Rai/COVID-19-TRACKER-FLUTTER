import 'package:covid_19_tracker/API.dart';
import 'package:covid_19_tracker/CountriesList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';
import 'WorldDataModel.dart';

class WorldStats extends StatefulWidget {
  const WorldStats({Key? key}) : super(key: key);

  @override
  State<WorldStats> createState() => _WorldStatsState();
}

class _WorldStatsState extends State<WorldStats> with TickerProviderStateMixin {

  APIs world_Api = APIs();

  late final AnimationController _controller =  AnimationController(
      duration: Duration(seconds: 3),
      vsync: this)..repeat();

  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height:
                MediaQuery.of(context).size.height* .05,),
              FutureBuilder(
                future: world_Api.worldData(),
                  builder: (context,AsyncSnapshot<WorldDataModel>snapshot) {
                  if(!snapshot.hasData){
                    return Column(
                      children: [
                        SpinKitFadingCircle(
                          color: Colors.red,
                          size: 50,
                          controller: _controller,
                        ),
                        Text('Make Sure Your Internet is Connected')
                      ],
                    );
                  }else{
                    return Column(
                      children: [
                        PieChart(dataMap:{
                          'Total': double.parse(snapshot.data!.cases.toString()),
                          'Recovered':  double.parse(snapshot.data!.recovered.toString()),
                          'Deaths':  double.parse(snapshot.data!.deaths.toString())
                        },
                          chartValuesOptions: ChartValuesOptions(
                            showChartValuesInPercentage: true,
                          ),
                          animationDuration: Duration(seconds: 2),
                          chartType: ChartType.disc,),
                        SizedBox(height: MediaQuery.of(context).size.height*.02,),
                        Card(
                          color: Colors.white60,

                          child: Column(
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height *0.02),
                               DataCard(title: 'Total', value: int.parse(snapshot.data!.cases.toString())),
                               DataCard(title: 'Recovered', value: int.parse(snapshot.data!.recovered.toString())),
                               DataCard(title: 'Deaths', value: int.parse(snapshot.data!.deaths.toString())),
                               DataCard(title: 'Today Cases', value: int.parse(snapshot.data!.todayCases.toString())),
                               DataCard(title: 'Today Deaths', value: int.parse(snapshot.data!.todayDeaths.toString())),
                               DataCard(title: 'Active', value: int.parse(snapshot.data!.active.toString())),
                               DataCard(title: 'Critical', value: int.parse(snapshot.data!.critical.toString())),

                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*.05,

                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context)=> CountriesList(),));
                            },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height*.05,
                              child: Center(
                                child: Text(
                                    'World Data'
                                ),

                              ),
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                          ),

                        ),
                      ],
                    );

                  }

                  }),




            ],
          ),
        ),
      ),
    );
  }
}

class DataCard extends StatelessWidget {
  final String title;
  final int value;
  const DataCard({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value.toString()),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height *0.01,


          ),
          Divider(),
        ],
      ),
    );
  }
}

