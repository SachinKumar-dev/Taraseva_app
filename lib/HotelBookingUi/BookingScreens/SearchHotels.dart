import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitson/HotelBookingUi/BookingScreens/HotelPreview.dart';
import 'package:gitson/HotelBookingUi/ModesOfBooking/Completed.dart';
import 'package:gitson/HotelBookingUi/ProfileScreens/ProfilePage.dart';
import 'package:gitson/Models/HotelModel/Hotel.dart';
import 'package:gitson/Services/ServicesOpt.dart';

class SearchHotels extends StatefulWidget {
  const SearchHotels({Key? key}) : super(key: key);

  @override
  State<SearchHotels> createState() => _SearchHotelsState();
}

class _SearchHotelsState extends State<SearchHotels> {
  //container OnTap handling
  int tappedContainerIndex = -1;

  void _handleTap(int index) {
    setState(() {
      tappedContainerIndex = index;
    });
  }

  //handling taps of navBar
  int selectedIndex=0;

  //handling the navBar
  void onTap(int index){
    setState(() {
      selectedIndex = index;
    });
    if(selectedIndex==3){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ServicesOpt()));
    }
    if(selectedIndex==2){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProfilePage()));
    }
    if(selectedIndex==1){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const CompletedBookings()));
    }
  }

  @override
  Widget build(BuildContext context) {

    List<Hotel> hotels = Hotel.hotels;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding:  EdgeInsets.only(left: 5.0.w),
                child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.93,
                  child: TextFormField(
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: const Icon(
                        Icons.search_rounded,
                        color: Colors.grey,
                      ),
                      suffixIcon: const Icon(
                        Icons.menu,
                        color: Colors.green,
                      ),
                      fillColor: Colors.grey.shade300,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => _handleTap(0),
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width*0.3,
                        decoration: BoxDecoration(
                          color: tappedContainerIndex == 0
                              ? Colors.green
                              : Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.green),
                        ),
                        child: Center(
                          child: Text(
                            "All Hotel",
                            style: TextStyle(
                              color: tappedContainerIndex == 0
                                  ? Colors.white
                                  : Colors.green,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _handleTap(1),
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width*0.3,
                        decoration: BoxDecoration(
                          color: tappedContainerIndex == 1
                              ? Colors.green
                              : Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.green),
                        ),
                        child: Center(
                          child: Text(
                            "Recommended",
                            style: TextStyle(
                              color: tappedContainerIndex == 1
                                  ? Colors.white
                                  : Colors.green,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _handleTap(2),
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width*0.3,
                        decoration: BoxDecoration(
                          color: tappedContainerIndex == 2
                              ? Colors.green
                              : Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.green),
                        ),
                        child: Center(
                          child: Text(
                            "Popular",
                            style: TextStyle(
                              color: tappedContainerIndex == 2
                                  ? Colors.white
                                  : Colors.green,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 22.0.w),
                    child: const Text(
                      "Recommended (586,379)",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                      SizedBox(width: 50.w,),
                  const Icon(
                    Icons.featured_play_list,
                    color: Colors.green,
                    size: 30,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: 18.0.w),
                    child: const Icon(
                      Icons.grid_view,
                      size: 30,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: hotels.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 150,
                          width: 380,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const HotelPreview()));
                            },
                            child: Card(
                              color: Colors.white,
                              shadowColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 0.2,
                              child: Stack(
                                children: [
                                  Row(
                                    children: [
                                      Center(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15.0),
                                          child: Container(
                                            height: 110,
                                            width: 120,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                  hotels[index].img,
                                                ),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 20.0),
                                            child: Text(
                                              hotels[index].hotelName,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Text(hotels[index].location),
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
                                            hotels[index].rent,
                                            style: const TextStyle(fontWeight: FontWeight.bold,
                                                color: Colors.green),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Text("/night"),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          const Icon(
                                              Icons.bookmark_border_rounded),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Add a SizedBox with height 20 after each item
                      ],
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.green,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_rounded),
            label: "Booking",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/logos/img_10.png"),
              color: Colors.grey,
            ),
            label: "Return",
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onTap,
      ),
    );
  }
}
