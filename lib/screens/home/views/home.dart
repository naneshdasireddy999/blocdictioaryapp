import 'package:blocdictionarysapp/screens/home/bloc/dictionary_cubit.dart';
import 'package:blocdictionarysapp/screens/list/views/lists_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  final qc = TextEditingController();
  Home({Key? key}) : super(key: key);
  getDictionaryFormWidget(BuildContext context) {
    final cubit = context.watch<DictioaryCubit>();
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Spacer(),
          const Text(
            "Dictionary App",
            style: TextStyle(
              color: Colors.deepOrangeAccent,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Search any word you want quickly",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          TextField(
            controller: qc,
            decoration: InputDecoration(
              hintText: "Search a word",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              fillColor: Colors.grey[100],
              filled: true,
              prefixIcon: const Icon(Icons.search),
              hintStyle: const TextStyle(color: Colors.white),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                cubit.getwordsearched(qc.text);
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrangeAccent,
                  padding: const EdgeInsets.all(16)),
              child: const Text("SEARCH"),
            ),
          ),
        ],
      ),
    );
  }

  getloadingwidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  geterrorwidget(BuildContext context) {
    final cubit = context.watch<DictioaryCubit>();
    return Center(
      child: Column(
        children: [
          TextButton(
              onPressed: () {
                cubit.setright();
              },
              child: const Text('go back')),
          const Text('something went wrong'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DictioaryCubit>();
    return BlocListener(
      bloc: cubit,
      listener: (context, state) async {
        if (state is Wordsearchedstate) {
          await Navigator.push(context, MaterialPageRoute(builder: (ctx) {
            return Lview(
              lw: cubit.wrl,
            );
          }));
        }
      },
      child: Scaffold(
        body: cubit.state is Wordsearchingstate
            ? getloadingwidget()
            : cubit.state is Errorstate
                ? geterrorwidget(context)
                : getDictionaryFormWidget(context),
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          title: const Text('home'),
        ),
      ),
    );
  }
}
