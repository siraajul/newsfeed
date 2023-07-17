import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Feed',
      home: NewsFeed(),
    );
  }
}

class NewsFeed extends StatefulWidget {
  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return _buildPortraitLayout();
        } else {
          return _buildLandscapeLayout();
        }
      },
    );
  }

  Widget _buildPortraitLayout() {
    return ListView(
      children: [
        _buildNewsArticle('Headline 1',
            'https://www.daily-sun.com/assets/news_images/2022/06/05/Sheikh_Hasina.jpg'),
        _buildNewsArticle('Headline 2',
            'https://www.newagebd.com/files/records/news/202304/200018_180.jpg'),
        _buildNewsArticle('Headline 3',
            'https://www.mindinventory.com/blog/wp-content/uploads/2022/10/flutter-3.png'),
      ],
    );
  }

  Widget _buildLandscapeLayout() {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
      ),
      children: [
        _buildNewsArticle('Headline 1',
            'https://www.daily-sun.com/assets/news_images/2022/06/05/Sheikh_Hasina.jpg'),
        _buildNewsArticle('Headline 2',
            'https://www.newagebd.com/files/records/news/202304/200018_180.jpg'),
        _buildNewsArticle('Headline 3',
            'https://www.mindinventory.com/blog/wp-content/uploads/2022/10/flutter-3.png'),
      ],
    );
  }

  Widget _buildNewsArticle(String headline, String imageUrl) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Card(
        child: Column(
          children: [
            Image.network(imageUrl),
            Text(headline),
          ],
        ),
      ),
    );
  }
}
