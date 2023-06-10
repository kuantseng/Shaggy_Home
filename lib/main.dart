import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'bloc/app_bloc.dart';
import 'bloc/app_event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '圖片展示首頁',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //backgroundColor: Colors.black,
      ),
      home: BlocProvider(
        create: (context) => AppBloc(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    ImageGalleryPage(),
    Text('分頁 1'),
    Text('分頁 2'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('圖片展示首頁'),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首頁',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_album),
            label: '分頁 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '分頁 2',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ImageGalleryPage extends StatelessWidget {
  const ImageGalleryPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 400.0, autoPlay: true),
      items: [
        'https://picsum.photos/id/100/900/400',
        'https://picsum.photos/id/200/900/400',
        'https://picsum.photos/id/300/900/400',
      ].map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: Image.network(imageUrl, fit: BoxFit.cover),
            );
          },
        );
      }).toList(),
    );
  }
}
