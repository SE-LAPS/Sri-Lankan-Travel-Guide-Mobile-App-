import 'package:flutter/material.dart';
import 'package:nereye_gitmeli_app/Classes/Sehir/Sehir.dart';
import 'package:nereye_gitmeli_app/Constants/RouteNames.dart' as myRouteNames;

class SehirCard extends StatelessWidget {
  final Sehir sehirData;

  SehirCard({
    Key key,
    this.sehirData
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 180,
      child: Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, myRouteNames.cityDetailRoute, arguments: sehirData),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Hero(
                tag: 'city-img-${sehirData.id}',
                child: Image(
                  image: AssetImage(
                      'assets/images/${sehirData.type == 1 ? 'Yurtici' : 'Yurtdisi'}/${sehirData.adi.toLowerCase()}.jpg'),
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 10,
                right: 16,
                left: 16,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Text(
                        sehirData.adi,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Text(
                        sehirData.ulke,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
