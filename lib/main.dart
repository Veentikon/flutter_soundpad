import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Color blue = Color(0xffADCBFC);
    final Color blueOutline = Color(0xff067CCB);
    final Color red = Color(0xffff2525);
    final Color redOutline = Color(0xffc40050);
    final Color purple = Color(0xffE247FC);
    final Color purpleOutline = Color(0xffA23AB7);
    return MaterialApp(
      title: "LauchPad",
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "LaunchPad",
              style: GoogleFonts.orbitron(color: Colors.white),
            ),
            backgroundColor: Colors.black,
          ),
          backgroundColor: Colors.black,
          body: Center(
            child: Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                Pad(blue, blueOutline, '1.mp3'),
                Pad(red, redOutline, '2.mp3'),
                Pad(blue, blueOutline, '3.mp3'),
                Pad(purple, purpleOutline, '4.mp3'),
                Pad(blue, blueOutline, '5.mp3'),
                Pad(red, redOutline, '6.mp3'),
                Pad(blue, blueOutline, '7.mp3'),
                Pad(purple, purpleOutline, '8.mp3'),
                Pad(blue, blueOutline, '9.mp3'),
                Pad(red, redOutline, '10.mp3'),
                Pad(blue, blueOutline, '11.mp3'),
                Pad(purple, purpleOutline, '12.mp3'),
                Pad(blue, blueOutline, '13.mp3'),
                Pad(red, redOutline, '14.mp3'),
                Pad(blue, blueOutline, '15.mp3'),
                Pad(purple, purpleOutline, '16.mp3'),
                Pad(blue, blueOutline, '17.mp3'),
                Pad(red, redOutline, '18.mp3'),
                Pad(blue, blueOutline, '19.mp3'),
                Pad(purple, purpleOutline, '20.wav'),
                Pad(blue, blueOutline, '21.mp3'),
                Pad(red, redOutline, '22.wav'),
                Pad(blue, blueOutline, '23.wav'),
                Pad(purple, purpleOutline, '24.wav'),
                Pad(blue, blueOutline, '25.wav'),
                Pad(red, redOutline, '26.wav'),
                Pad(blue, blueOutline, '27.wav'),
                Pad(purple, purpleOutline, '28.wav'),
              ],
            ),
          )
        ),
      ),
    );
  }
}

class Pad extends StatefulWidget {
  final colorCenter;
  final colorOutline;
  final note;
  const Pad(this.colorCenter, this.colorOutline, this.note, {super.key});

  @override
  State<Pad> createState() => _PadState();
}

class _PadState extends State<Pad> {
  late Color _colorCenter;
  late Color _colorOutline;
  final player = AudioPlayer();
  @override
  void initState() {
    _colorCenter=widget.colorCenter;
    _colorOutline=widget.colorOutline;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () async {
        setState(() {
          _colorCenter = Colors.white;
          _colorOutline = Colors.white;
          player.play(AssetSource(widget.note),
          );
        });
        await Future.delayed(Duration(milliseconds: 160));
        setState(() {
          _colorCenter=widget.colorCenter;
          _colorOutline=widget.colorOutline;
        });
      },
      child: Container(
        height: height/8.2,
        width: width/4.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          gradient: RadialGradient(colors: [_colorCenter,_colorOutline], 
            radius: 0.5
          ),
          boxShadow: [BoxShadow(color: Colors.pink, blurRadius: 5.0)]
        ),
      ),
    );
  }
}
