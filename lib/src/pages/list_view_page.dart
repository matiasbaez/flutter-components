import 'package:flutter/material.dart';

import 'dart:async';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _numberList = [];
  int _lastItem = 0;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _addItems(10);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        // _addItems(5);
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista y Scroll')),
      body: Stack(
        children: <Widget>[
          _createList(),
          _createLoading()
        ],
      ),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: _resetItems,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _numberList.length,
        itemBuilder: (BuildContext context, int index) {
          final _image = _numberList[index];
          return FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage('https://picsum.photos/id/$_image/500/300.jpg')
          );
        },
      ),
    );
  }

  Future<void> _resetItems() async {

    final _duration = new Duration(seconds: 2);
    new Timer(_duration, () {
      _numberList.clear();
      _lastItem++;
      _addItems(10);
    });
    
    return Future.delayed(_duration);
  }

  void _addItems(int amount) {
    for (var i = 0; i < amount; i++) {
      _numberList.add(_lastItem++);
    }
    setState(() {});
  }

  Future _fetchData() async {
    _loading = true;
    setState(() {});

    final _duration = Duration(seconds: 2);

    return new Timer(_duration, _requestHTTP );
  }

  void _requestHTTP() {
    _loading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn
    );
    _addItems(5);
  }

  Widget _createLoading() {
    if (_loading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(
                
              ),
            ],
          ),
          SizedBox(height: 15.0),
        ],
      );
    }

    return Container();
  }
}