import 'package:flutter/material.dart';
import '../models/salesModel.dart';

class SalesWidget extends StatelessWidget {
  const SalesWidget({super.key, required this.model});
  final SalesModel model;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: width / 2,
        child:Text('NoteList:\n${model.notesList()}',
                    maxLines: 8,)),
       
        SizedBox(
          width: width / 4,
          child: Text(
            model.totalSales().toString(),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
