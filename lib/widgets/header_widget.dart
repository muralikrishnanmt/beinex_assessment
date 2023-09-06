import 'package:beinex_test/widgets/header_item.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const HeaderItem(label: 'ID', width: 100),
        const SizedBox(
          width: 2,
        ),
        const HeaderItem(label: 'Item ID', width: 100),
        const SizedBox(
          width: 2,
        ),
        const HeaderItem(label: 'Title', width: 200),
        const SizedBox(
          width: 2,
        ),
        const HeaderItem(label: 'Date', width: 140),
        const SizedBox(
          width: 2,
        ),
        const HeaderItem(label: 'Status', width: 150),
        const SizedBox(
          width: 2,
        ),
        Container(
          height: 50,
          width: 300,
          color: const Color.fromARGB(255, 9, 80, 138),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Item Types',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                color: Colors.white,
                // width: 2,
                height: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Item1",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    width: 2,
                    height: 20,
                  ),
                  const Text(
                    "Item2",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        Container(
          height: 50,
          width: 400,
          color: const Color.fromARGB(255, 9, 80, 138),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Levels',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                color: Colors.white,
                // width: 2,
                height: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Level 1",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    width: 2,
                    height: 20,
                  ),
                  const Text(
                    "Level 2",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
