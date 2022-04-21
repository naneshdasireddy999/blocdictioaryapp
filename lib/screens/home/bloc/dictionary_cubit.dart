import 'package:blocdictionarysapp/screens/home/model/word_response.dart';
import 'package:blocdictionarysapp/screens/home/services/http_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DictioaryCubit extends Cubit<DictionaryState> {
  DictioaryCubit() : super(Nowordsearchedstate());
  List<WordResponse>? wrl = [WordResponse()];
  Future getwordsearched(String t) async {
    emit(Wordsearchingstate());

    try {
      wrl = (await RemoteServices.fetchwordsfromdictionary(t));
      if (wrl == null) {
        emit(Errorstate());
      } else {
        emit(Wordsearchedstate());
      }
    } on Exception catch (e) {
      emit(Errorstate());
    }
  }

  void setright() {
    emit(Nowordsearchedstate());
  }
}

abstract class DictionaryState {}

class Nowordsearchedstate extends DictionaryState {}

class Wordsearchingstate extends DictionaryState {}

class Wordsearchedstate extends DictionaryState {}

class Errorstate extends DictionaryState {}
