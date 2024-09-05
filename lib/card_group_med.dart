import 'package:flutter/material.dart';

class CardGroupMed extends StatelessWidget {
  final String date;
  const CardGroupMed({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black.withOpacity(0.3),
          )),
      width: MediaQuery.of(context).size.width - .1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Medicação'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 15,
                        width: 15,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 6),
                      const Text('Nome do receituário')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 40,
                width: 40,
              )
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Medicação'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(Icons.access_time),
                      const SizedBox(width: 6),
                      Text(date)
                    ],
                  )
                ],
              ),
              Checkbox(
                value: true,
                onChanged: (value) {},
                activeColor: Colors.green,
                focusColor: Colors.green,
              )
            ],
          ),
        ],
      ),
    );
  }
}
