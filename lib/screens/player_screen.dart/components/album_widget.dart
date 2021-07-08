import 'package:flutter/material.dart';
import 'package:indaband_app/models/player_model.dart';

class AlbumWidget extends StatefulWidget {
  final PlayerModel playS;
/*   final QuestionModel music;
  final QuestionModel band; */
  const AlbumWidget({
    Key? key,
    required this.playS,
    /*   required this.music,
    required this.band, */
  }) : super(key: key);

  @override
  _AlbumWidgetState createState() => _AlbumWidgetState();
}

class _AlbumWidgetState extends State<AlbumWidget> {
  // AnswerModel answers(int index) => widget.question.answers[index];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          child: Stack(
            children: [
              Image.asset(
                widget.playS.title,
                width: MediaQuery.of(context).size.width * 343,
                height: MediaQuery.of(context).size.height * .368,
                fit: BoxFit.cover,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.grey[300],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 184,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF0F152C).withOpacity(0),
                        Color(0xFF0F152C),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        /*  TextWidget(
          title: widget.question.music,
          textStyle: textCategories,
        ),
        TextWidget(
          title: widget.question.band,
          textStyle: bandTitle,
        ) */
        /*  for (var i = 0; i < widget.question.answers.length; i++)
          DetailMusci(
            answer: answers(i),
          ) */
      ],
    );
  }
}
