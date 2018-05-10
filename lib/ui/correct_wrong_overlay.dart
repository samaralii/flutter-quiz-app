import 'package:flutter/material.dart';
import 'dart:math';

class CorrectWrongOverlay extends StatefulWidget {
  final bool _isCorrect;
  final VoidCallback _onTap;

  CorrectWrongOverlay(this._isCorrect, this._onTap);

  @override
  State<StatefulWidget> createState() {
    return CorrectWrongOverlayState();
  }
}

class CorrectWrongOverlayState extends State<CorrectWrongOverlay>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    _iconAnimation = CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.elasticOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
    void dispose() {
      _iconAnimationController.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => widget._onTap(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Transform.rotate(
                  angle: _iconAnimation.value * 2 * PI,
                  child: Icon(
                    widget._isCorrect ? Icons.done : Icons.cancel,
                    size: _iconAnimation.value * 80.0,
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(bottom: 24.0),
            ),
            Text(
              widget._isCorrect ? 'Correct!' : 'Wrong!',
              style: TextStyle(fontSize: 30.0, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
