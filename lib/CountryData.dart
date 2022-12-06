import 'package:flutter/material.dart';
import 'world_stats.dart';

class CountryData extends StatelessWidget {
  final String name,total,recovered,deaths,today_cases,today_deaths,active,critical;
  final String flag;
  const CountryData({Key? key, required this.name, required this.total, required this.recovered, required this.deaths, required this.today_cases, required this.today_deaths, required this.active, required this.critical, required this.flag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Divider(
              thickness: 3,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.08,
          ),
          Stack(alignment: Alignment.topCenter,
            children: [

              Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.067),
                child: Card(
                  color: Colors.white24,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),
                      DataCard(title: 'Total', value: int.parse(total)),
                      DataCard(title: 'Recovered', value: int.parse(recovered)),
                      DataCard(title: 'Deaths', value: int.parse(deaths)),
                      DataCard(title: 'Today Cases', value: int.parse(today_cases)),
                      DataCard(title: 'Today Deaths', value: int.parse(today_deaths)),
                      DataCard(title: 'Active', value: int.parse(active)),
                      DataCard(title: 'Critical', value: int.parse(critical)),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(flag),

              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.08,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Divider(
              thickness: 3,
              color: Colors.grey,
            ),
          ),

        ],
      ),
    );
  }
}
