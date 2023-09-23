import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePagePandit extends StatefulWidget {
  const HomePagePandit({super.key});

  @override
  State<HomePagePandit> createState() => _HomePagePanditState();
}

class _HomePagePanditState extends State<HomePagePandit> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 20.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.0.w),
                  child: SizedBox(
                    height: 180.h,
                    width: 180.w,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset("assets/images/pandit.jpg")),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 18.0.w),
                      child: Text(
                        "Contact:",
                        style: GoogleFonts.signikaNegative(fontSize: 20.sp),
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding: EdgeInsets.only(left: 18.0.w),
                      child: Text(
                        "Vishwasrao",
                        style: GoogleFonts.signikaNegative(fontSize: 20.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 18.0.w, top: 20.h),
                      child: Text(
                        "+91-8123918202",
                        style: GoogleFonts.signikaNegative(fontSize: 20.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 18.0.w, top: 20.h),
                      child: Text(
                        "devsadhu@gmail.com",
                        style: GoogleFonts.signikaNegative(fontSize: 20.sp),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              height: 50.h,
              thickness: 1,
              endIndent: 20,
              indent: 20,
              color: Colors.green,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0.w),
              child: Text(
                "Experiences:",
                style: GoogleFonts.signikaNegative(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0.w, right: 2.w),
              child: Text(
                "°Ritual Expertise: Hindu priests are expected to have a deep understanding of Hindu scriptures, rituals, and traditions. They must know the proper procedures and mantras for various ceremonies and worship rituals.",
                style:
                GoogleFonts.signikaNegative(fontSize: 17, letterSpacing: 1),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0.w, right: 2.w),
              child: Text(
                "°Purification Rituals: Before any worship or ceremony, priests often perform purification rituals. This involves cleansing themselves, the worship area, and the offerings to ensure a spiritually pure environment.",
                style:
                GoogleFonts.signikaNegative(fontSize: 17, letterSpacing: 1),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0.w, right: 2.w),
              child: Text(
                "°Chanting Mantras: During the worship, priests chant Vedic mantras and prayers that are believed to invoke divine blessings. The pronunciation and intonation of these mantras are crucial, and priests are responsible for their proper recitation.",
                style:
                GoogleFonts.signikaNegative(fontSize: 17, letterSpacing: 1),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0.w, right: 2.w),
              child: Text(
                "°Symbolic Actions: Hindu rituals often involve symbolic actions such as lighting lamps, making offerings, and circumambulating sacred idols or fire. Priests perform these actions with precision and devotion.",
                style:
                GoogleFonts.signikaNegative(fontSize: 17, letterSpacing: 1),
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
