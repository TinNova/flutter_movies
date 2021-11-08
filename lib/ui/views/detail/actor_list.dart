import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/domain/models/actor.dart';

import '../../../dimens.dart';

class ActorList extends StatelessWidget {
  final List<Actor> actors;

  ActorList(this.actors);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: ListView.builder(
          padding: EdgeInsets.only(right: margin),
          scrollDirection: Axis.horizontal,
          itemCount: actors.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int i) {
            Actor actor = actors[i];
            return Container(
              margin: EdgeInsets.only(left: margin),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 45,
                    foregroundImage: NetworkImage(actor.profilePath),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: marginHalf),
                    width: 70,
                    child: Text(
                      actor.name,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
