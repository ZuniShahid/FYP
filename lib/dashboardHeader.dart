import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Dashboard',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(color: Color(0xFF2A2D3E),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.white10)
          ),
          child: Row(
            children: [
              Image.asset('assets/images/meri-.png',
                height: 40,),
              Padding(padding: EdgeInsets.symmetric(
                horizontal: 50,
              ),
                child: Text("Zunair",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Icon(Icons.keyboard_arrow_down_rounded),
            ],
          ),
        )
      ],
    );
  }
}