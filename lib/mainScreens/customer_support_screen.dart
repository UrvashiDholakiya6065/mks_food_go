import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerSupportScreen extends StatelessWidget {
  const CustomerSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
  actions:  [

          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Image.asset('assets/msg/draw.png',height: 10,)
          ),
        ],
      ),

      body: Column(
        children: [

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [

                supportMessage("Hi, how can I help you?"),

                userMessage(
                  "Hello, I ordered two fried\nchicken burgers. Can I\nknow how much time it\nwill get to arrive?",
                ),
                supportMessage("Ok, please let me check!"),

                userMessage("Sure..."),

                supportMessage(
                  "It’ll get 25 minutes to\narrive to your address",
                  time: "26 minutes ago",
                ),

                userMessage("Ok, thanks you for your\nsupport"),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Type here...",
                      hintStyle: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding:
                       EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                 SizedBox(width: 10),
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    color:  Color(0xffEF2A39),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset('assets/msg/send.png',),
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget supportMessage(String text, {String? time}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           CircleAvatar(
            radius: 18,
            backgroundColor: Color(0xff3C2F2F),
            child: Image.asset('assets/bottomBar/person.png',height: 16,),
            // child: Icon(Icons.person, color: Colors.white, size: 16),
          ),
           SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  text,
                  style: GoogleFonts.roboto(fontSize: 13),
                ),
              ),
              if (time != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    time,
                    style: GoogleFonts.roboto(
                      fontSize: 11,
                      color: Colors.grey,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget userMessage(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color:  Color(0xffEF2A39),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  text,
                  style: GoogleFonts.roboto(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
           SizedBox(width: 10),
          CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xffEF2A39),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('assets/profile/profile_img.png'),
            ),
          ),

          // CircleAvatar(
          //   radius: 18,
          //   backgroundImage:
          //   AssetImage('assets/profile/profile_img.png'),
          // ),
        ],
      ),
    );
  }
}
