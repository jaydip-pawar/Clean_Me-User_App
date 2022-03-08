import 'dart:math';

import 'package:flutter/material.dart';

bool toggle = true;

class AnimatedFAB extends StatefulWidget {
  const AnimatedFAB({Key? key}) : super(key: key);

  @override
  State<AnimatedFAB> createState() => _AnimatedFABState();
}

class _AnimatedFABState extends State<AnimatedFAB> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
      reverseDuration: const Duration(milliseconds: 275),
    );

    _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeIn
    );

    _controller.addListener(() {
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Alignment alignment1 = Alignment.bottomCenter;
  Alignment alignment2 = Alignment.bottomCenter;
  double size1 = 50;
  double size2 = 50;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Container(
        height: 250,
        width: 250,
        // color: Colors.black,
        child: Stack(
          children: [
            AnimatedAlign(
              duration: toggle ? const Duration(milliseconds: 275) : const Duration(milliseconds: 875),
              alignment: alignment1,
              curve: toggle ? Curves.easeIn : Curves.elasticOut,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 275),
                curve: toggle ? Curves.easeIn : Curves.easeOut,
                height: size1,
                width: size1,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Icon(Icons.message, color: Colors.white,),
              ),
            ),
            AnimatedAlign(
              duration: toggle ? const Duration(milliseconds: 275) : const Duration(milliseconds: 875),
              alignment: alignment2,
              curve: toggle ? Curves.easeIn : Curves.elasticOut,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 275),
                curve: toggle ? Curves.easeIn : Curves.easeOut,
                height: size2,
                width: size2,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Icon(Icons.message, color: Colors.white,),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Transform.rotate(
                angle: _animation.value * pi * (3 / 4),
                child: AnimatedContainer(
                  duration: const Duration(microseconds: 375),
                  curve: Curves.easeOut,
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: Colors.yellow[600],
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: IconButton(
                      splashColor: Colors.black54,
                      splashRadius: 25,
                      onPressed: () {
                        setState(() {
                          if(toggle) {
                            toggle = !toggle;
                            _controller.forward();
                            Future.delayed(const Duration(milliseconds: 10), () {
                              alignment1 = const Alignment(-0.5, 0);
                              size1 = 50;
                            });
                            Future.delayed(const Duration(milliseconds: 100), () {
                              alignment2 = const Alignment(0.5, 0);
                              size2 = 50;
                            });
                          } else {
                            toggle = !toggle;
                            _controller.reverse();
                            alignment1 = Alignment.bottomCenter;
                            alignment2 = Alignment.bottomCenter;
                            size1 = size2 = 20;
                          }
                        });
                      },
                      icon: const Icon(Icons.add, size: 27),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
