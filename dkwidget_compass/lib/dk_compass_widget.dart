library dkwidget_compass;

import 'dart:math';

import 'package:dkwidget_compass/dk_compass_controller.dart';
import 'package:flutter/material.dart';

class DkCompassWidget extends StatefulWidget {
	@override
	State<StatefulWidget> createState() => DkCompassWidgetState();
}

class DkCompassWidgetState extends State<DkCompassWidget> with SingleTickerProviderStateMixin {
	DkCompassController mController;
	AnimationController mAnimController;
	Animation<double> mAnimation;

	@override
	void initState() {
		super.initState();

		mController = new DkCompassController(this);

		mAnimController = AnimationController(vsync: this, duration: Duration(seconds: 5));
		mAnimation = Tween<double>(begin: 1, end: 200).animate(mAnimController)
			..addListener(() {
				setState(() {
					// freely to setup something
				});
			})
			..addStatusListener((status) {
				if (status == AnimationStatus.completed) {
//					mAnimController.reverse();
				}
				else if (status == AnimationStatus.dismissed) {
//					mAnimController.forward();
				}
			});
		mAnimController.forward();
	}

	@override
	Widget build(BuildContext context) {
		return Center(
			child: Container(
				width: 400,
				height: 400,
				child: CustomPaint(
					foregroundPainter: _CompassPainter(Colors.amber, mAnimation),
				)
			),
		);
	}
}

class _CompassPainter extends CustomPainter {
	Paint mPaint;
	Random mRnd = Random(100);
	double mRadius;

	_CompassPainter(Color color, Animation animation) {
		mRadius = animation.value;
		mPaint = Paint()
			..color = color
			..strokeWidth = 1
			..style = PaintingStyle.stroke;
	}

	@override
	bool shouldRepaint(CustomPainter oldDelegate) {
		return true;
	}

	@override
	void paint(Canvas canvas, Size size) {
		Offset offset = Offset(size.width / 2, size.height / 2);
		canvas.drawCircle(offset, mRadius, mPaint);
	}
}
