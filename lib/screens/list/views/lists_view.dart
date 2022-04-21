import 'package:blocdictionarysapp/screens/detail/views/detail_view.dart';
import 'package:blocdictionarysapp/screens/home/model/word_response.dart';
import 'package:flutter/material.dart';

class Lview extends StatelessWidget {
  final List<WordResponse>? lw;
  const Lview({Key? key, required this.lw}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('listsview'),
      ),
      body: ListView.separated(
          itemBuilder: (ctx, index) => GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                    return DetailView(lw: (lw?[index].word)!);
                  }));
                },
                child: ListTile(
                  title: Text((lw?[index].word)!),
                ),
              ),
          separatorBuilder: (ctx, index) {
            return const Divider(
              color: Colors.grey,
            );
          },
          itemCount: (lw?.length)!),
    );
  }
}
