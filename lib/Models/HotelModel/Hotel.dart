class Hotel {
  final String img;
  final String hotelName;
  final String location;
  final String rent;

  Hotel(
      {required this.img,
      required this.hotelName,
      required this.location,
      required this.rent});

  static List<Hotel> hotels = [
    Hotel(
      img: 'assets/images/H-one.jpg',
      hotelName: 'Le Bristol Hotel',
      location: 'Istanbul, Turkey',
      rent: '\$27',
    ),
    Hotel(
      img: 'assets/images/H-Two.jpg',
      hotelName: 'Plaza Athenee',
      location: 'Paris, France',
      rent: '\$35',
    ),
    Hotel(
      img: 'assets/images/H-Three.jpg',
      hotelName: 'Plaza Athenee',
      location: 'Paris, France',
      rent: '\$32',
    ),
    Hotel(
      img: 'assets/images/H-Four.jpg',
      hotelName: 'Plaza Athenee',
      location: 'Istanbul, Turkey',
      rent: '\$36',
    ),
  ];
}
