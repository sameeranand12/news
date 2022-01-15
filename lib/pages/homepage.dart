import 'package:flutter/material.dart';
import 'package:news_demo/models/newsinfo.dart';
import 'package:news_demo/services/api_manager.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<NewsModel>? _newsModel;

  @override
  void initState() {
    _newsModel = API_Manager().getNews();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: Container(
        child: FutureBuilder<NewsModel>(
          future: _newsModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {

              print('ubascuab');
              return ListView.builder(
                
                itemCount: snapshot.data!.articles.length,
                itemBuilder: (context, index) {
                  var article = snapshot.data!.articles[index]; 
                  return Container(
                    height: 100,
                    margin: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          
                           
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.network(article.urlToImage,
                            fit: BoxFit.cover,
                            ),),
                         // color: Colors.tealAccent,
                        ),
                        SizedBox(width: 16),
                        Flexible(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(article.title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight : FontWeight.bold,
                            ),
                            ),
                            Text( article.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                          ],
                        ),)
                      ],
                    ),
                  );
                },
              );
            } else
              return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
