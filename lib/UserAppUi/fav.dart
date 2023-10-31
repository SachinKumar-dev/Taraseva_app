import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Models/HotelModel/Hotel.dart';

class FavoriteHotelsPage extends StatelessWidget {
  final List<Hotel> favoriteHotels;

  const FavoriteHotelsPage({Key? key, required this.favoriteHotels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0E6B56),
        title: const Text('Favorite Hotels'),
      ),
      body: favoriteHotels.isEmpty
          ? const Center(
        child: Text(
          'No favorite hotels',
          style: TextStyle(fontSize: 20),
        ),
      )
          : ListView.builder(
        itemCount: favoriteHotels.length,
        itemBuilder: (context, index) {
          Hotel hotel = favoriteHotels[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
                width: 380,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.white,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 2,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Container(
                                  height: 110,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(hotel.img),
                                    ),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Text(
                                    hotel.hotelName,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(hotel.location),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text("4.8 ratings"),
                              ],
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  hotel.rent,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff0E6B56),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text("/night"),
                                const SizedBox(
                                  height: 25,
                                ),
                                // Customize the bookmark icon for tapping
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
