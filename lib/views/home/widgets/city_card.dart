import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final String name;
  final String image;
  final bool checked;
  final VoidCallback? updateChecked;

  const CityCard({super.key, required this.name, required this.image, required this.checked, this.updateChecked});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
        child: SizedBox(
          height: 150,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Ink.image(
                fit: BoxFit.cover,
                image: AssetImage(image),   // 'assets/images/ville3.jpg'
                child: InkWell(
                  onTap: updateChecked,
                ),
              ),
              // Image.asset('assets/images/ville2.jpg', fit: BoxFit.cover),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            checked ? Icons.star : Icons.star_border,
                            size: 40,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          name,
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
