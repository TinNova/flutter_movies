import 'package:flutter/material.dart';
import 'package:movies/data/models/spring_actor.dart';
import 'package:movies/domain/models/actor.dart';

import '../../../colours.dart';
import '../../../dimens.dart';

class ActorList extends StatelessWidget {
  final List<SpringActor> actors;

  ActorList(this.actors);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152,
      child: ListView.builder(
          padding: EdgeInsets.only(right: margin, top: margin, bottom: margin),
          scrollDirection: Axis.horizontal,
          itemCount: actors.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int i) {
            SpringActor actor = actors[i];
            return Container(
              margin: EdgeInsets.only(left: margin),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(actor.profilePath)),
                      boxShadow: [
                        BoxShadow(
                            color: primaryColourShadow4,
                            blurRadius: blurRadius,
                            spreadRadius: spreadRadius)
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(actor.profilePath),
                    ),
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
