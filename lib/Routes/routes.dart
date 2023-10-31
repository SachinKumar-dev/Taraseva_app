import 'package:gitson/AuthLogic/InputOTP.dart';
import 'package:gitson/ChattingScreens/InsideChatPagePreview.dart';
import 'package:gitson/ChattingScreens/InsideChatPagePreviewTwo.dart';
import 'package:gitson/HotelBookingUi/AccountScreens/LogInPage.dart';
import 'package:gitson/HotelBookingUi/AccountScreens/PanditInfo.dart';
import 'package:gitson/HotelBookingUi/AccountScreens/PanditShowDetails.dart';
import 'package:gitson/HotelBookingUi/AccountScreens/SignUpPage.dart';
import 'package:gitson/HotelBookingUi/AccountScreens/UserInfo.dart';
import 'package:gitson/HotelBookingUi/AccountScreens/UserShowDetails.dart';
import 'package:gitson/HotelBookingUi/BookingScreens/SearchHotels.dart';
import 'package:gitson/HotelBookingUi/ModesOfBooking/Bookings.dart';
import 'package:gitson/HotelBookingUi/ModesOfBooking/Cancelled.dart';
import 'package:gitson/HotelBookingUi/ModesOfBooking/Complete.dart';
import 'package:gitson/HotelBookingUi/OnboardingScreens/OnboardScreenOne.dart';
import 'package:gitson/HotelBookingUi/PaymentScreens/CancelBooking.dart';
import 'package:gitson/HotelBookingUi/ProfileScreens/ProfilePage.dart';
import 'package:gitson/Pandits/PanditChat.dart';
import 'package:gitson/Pandits/UserChat.dart';
import 'package:gitson/Services/Onboard.dart';
import 'package:gitson/Services/ServicesOpt.dart';
import 'package:gitson/UserAppUi/ManualBooking.dart';
import 'package:gitson/UserAppUi/Menu.dart';
import 'package:gitson/UserAppUi/ProfileForCab.dart';
import 'package:gitson/UserAppUi/TripsHistory.dart';
import 'package:go_router/go_router.dart';
import '../HotelBookingUi/ModesOfBooking/Ongoing.dart';
import '../HotelBookingUi/PaymentScreens/AdvancePayment.dart';
import '../UserAppUi/TripsTwo.dart';

class AppRouter {
    static final GoRouter router = GoRouter(
        initialLocation: '/onboard',
        routes: [
        GoRoute(path: '/',builder: ((context,state)=> const Ongoing())),
        GoRoute(path: '/onboard',builder: ((context,state)=>const Onboard())),
        GoRoute(path: '/signup',builder: ((context,state)=>const SignUp())),
        GoRoute(path: '/login',builder: ((context,state)=>const LogIn())),
        GoRoute(path: '/inputOtp',builder: ((context,state)=>const InputScreen())),
        GoRoute(path: '/userMainScreen',builder: ((context,state)=>const ServicesOpt())),
        GoRoute(path: '/profile',builder: ((context,state)=>const ProfilePage())),
        GoRoute(path: '/panditInfo',builder: ((context,state)=>const PanditInfo())),
        GoRoute(path: '/panditShowDetails',builder: ((context,state)=>const PanditShowDetails())),
        GoRoute(path: '/userInfo',builder: ((context,state)=>const UserInformation())),
        GoRoute(path: '/menu',builder: ((context,state)=>const Menu())),
        GoRoute(path: '/hotel',builder: ((context,state)=>const OnboardOne())),
        GoRoute(path: '/userchat',builder: ((context,state)=>const UserChat())),
        GoRoute(path: '/panditchat',builder: ((context,state)=>const PanditChat())),
        GoRoute(path: '/searchHotels',builder: ((context,state)=>const SearchHotels())),
        GoRoute(path: '/OngoingBookings',builder: ((context,state)=>const NewBookings())),
        GoRoute(path: '/canceled',builder: ((context,state)=>const Cancelled())),
        GoRoute(path: '/completed',builder: ((context,state)=>const Completed())),
        GoRoute(path: '/refund',builder: ((context,state)=>const CancelBooking())),
        GoRoute(path: '/showDetails',builder: ((context,state)=>const ShowDetails())),
        GoRoute(path: '/cabBooking',builder: ((context,state)=>const Menu())),
        GoRoute(path: '/trips',builder: ((context,state)=>const TripHistory())),
        GoRoute(path: '/tripsTwo',builder: ((context,state)=> const TripsTwo())),
        GoRoute(path: '/pay',builder: ((context,state)=> const Payment())),
        GoRoute(path: '/manualBooking',builder: ((context,state)=> const ManualBooking())),
        GoRoute(path: '/cabProfile',builder: ((context,state)=> const ProfileCab())),
        GoRoute(path: '/preview',builder: ((context,state)=> Preview())),
        GoRoute(path: '/previewTwo',builder: ((context,state)=> const PreviewTwo())),
    ],
    );
}
