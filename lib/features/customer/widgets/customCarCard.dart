import 'package:carrental/core/models/veihcle.dart';
import 'package:carrental/core/utils/assets.dart';
import 'package:carrental/features/customer/bookingCarView.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCarCard extends StatelessWidget {
  const CustomCarCard({
    super.key,
    required this.vehicle,
  });
  final Vehicle vehicle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BookingCarView()),
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.grey.withOpacity(.2),
                spreadRadius: 0,
                offset: const Offset(5, 0),
              )
            ]),
            child: Card(
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${vehicle.priceToRent}',
                        ),
                        const Text(r' $'),
                      ],
                    ),
                    Text(vehicle.currentCity!),
                    const SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          vehicle.model!,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 20,
            //top: -20,
            bottom: 70,
            child: Image.asset(
              AssetsData.logo,
              height: 60,
            ),
          ),
        ],
      ),
    );
  }
}
