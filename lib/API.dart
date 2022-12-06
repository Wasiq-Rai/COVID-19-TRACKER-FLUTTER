import 'dart:convert';

import 'WorldDataModel.dart';
import 'package:http/http.dart' as http;
import 'URLs.dart';

class APIs {

  Future<WorldDataModel> worldData () async{
    final response = await http.get(Uri.parse(URLs.WorldData));

    if(response.statusCode==200){
      var data = jsonDecode(response.body);
      return WorldDataModel.fromJson(data);
    }
    else{
      throw Exception('Error');
    }
  }
  Future<List<dynamic>> countriesData () async {
    final response = await http.get(Uri.parse(URLs.CountriesData));
    if(response.statusCode==200 ){
      var data = jsonDecode(response.body);
      return data;
    }
    else{
      throw Exception('Error');
    }
  }


}