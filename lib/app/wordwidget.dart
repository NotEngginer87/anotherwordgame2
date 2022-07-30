import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class wordwidget extends StatefulWidget {
  const wordwidget(this.id, this.long, this.word,{Key? key}) : super(key: key);
  final String word;
  final int id,long;

  @override
  State<wordwidget> createState() => _wordwidgetState();
}

class _wordwidgetState extends State<wordwidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ListView(
          shrinkWrap:true,
        children: [
          Text(widget.word),
          for (int i = 1; i <= 6; i++)
            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (int i = 1; i <= widget.long; i++)
                    Card(
                        elevation: 4,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SizedBox(
                          height: 48,
                          width: 48,
                          child: TextField(
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.text,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                            ],
                          ),
                        )),

                ],
              ),
            ),
          ElevatedButton(onPressed: (){}, child: Text('Submit'))
        ],
      ),
    );
  }
}
