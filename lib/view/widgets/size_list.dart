import 'package:flutter/material.dart';
import 'package:st/utils/thems.dart';

class SizedList extends StatefulWidget {
  SizedList({Key? key}) : super(key: key);

  @override
  State<SizedList> createState() => _SizedListState();
}

final List<String> Listsized = ['S', 'M', 'L', 'XL', 'XXL'];
var currentSelected = 0;

class _SizedListState extends State<SizedList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListView.separated(
        itemCount: Listsized.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentSelected = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: currentSelected == index
                    ? mainColor.withOpacity(0.4)
                    : Colors.white,
                borderRadius: BorderRadius.circular(15),
                border:
                    Border.all(color: Colors.grey.withOpacity(0.4), width: 2),
              ),
              child: Text(
                Listsized[index],
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }),
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
      ),
    );
  }
}
