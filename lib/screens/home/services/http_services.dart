import 'dart:convert';
import 'dart:io';

import 'package:blocdictionarysapp/screens/home/model/word_response.dart';

import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();
  static Future<List<WordResponse>?> fetchwordsfromdictionary(
      String endpoint) async {
    try {
      var response = await client.get(Uri.parse(
          'https://api.dictionaryapi.dev/api/v2/entries/en/$endpoint'));
      if (response.statusCode == 200) {
        print(response.body);
        var jsonstring = response.body;
        return wordResponseFromJson(jsonstring);
      } else {
        return null;
      }
    } on SocketException catch (e) {
      throw e;
    } on HttpException catch (e) {
      throw e;
    } on FormatException catch (e) {
      throw e;
    } on Exception catch (e) {
      throw e;
    }
  }
}
