import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  
  double _slideValue = 100.0;
  bool _blockCheckBox = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sliders')),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckBox(),
            _createSwitch(),
            Expanded(child: _createImage()),
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.teal,
      label: 'Tamaño de la imagen',
      // divisions: 20,
      value: _slideValue,
      min: 100.0,
      max: 400.0,
      onChanged: (_blockCheckBox) ? null : (data) => setState(() => _slideValue = data),
    );
  }

  Widget _createCheckBox() {
    // return Checkbox(
    //   activeColor: Colors.teal,
    //   // checkColor: Colors.white,
    //   value: _blockCheckBox,
    //   onChanged: (data) => setState(() => _blockCheckBox = data)
    // );

    return CheckboxListTile(
      activeColor: Colors.teal,
      // checkColor: Colors.white,
      title: Text('Bloquear slider'),
      value: _blockCheckBox,
      onChanged: (data) => setState(() => _blockCheckBox = data!)
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      activeColor: Colors.teal,
      // checkColor: Colors.white,
      title: Text('Bloquear slider'),
      value: _blockCheckBox,
      onChanged: (data) => setState(() => _blockCheckBox = data)
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage('https://c4.wallpaperflare.com/wallpaper/332/915/762/one-piece-roronoa-zoro-hd-wallpaper-preview.jpg'),
      width: _slideValue,
      fit: BoxFit.contain,
    );
  }
}