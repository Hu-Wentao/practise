// Created by Hu Wentao.
// Email: hu.wentao@outlook.com
// Date : 2019-11-25
// Time : 20:17

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // todo
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("主页"),
        ),
        body: OrientationBuilder(
          builder: (ctx, ori) =>
              ori == Orientation.portrait ? _Vertical() : _Horizontal(),
        ),
      ),
    );
  }
}

class _Horizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _getFirstBlock(context),
          ],
        ),
      );
}

class _Vertical extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: _getFirstBlock(context),
            ),
          )),
        ],
      );
}

_getFirstBlock(BuildContext context) => <Widget>[
      Container(),
    ];
