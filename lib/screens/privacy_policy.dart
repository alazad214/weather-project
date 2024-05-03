import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy-Policy"),
        titleSpacing: 0,
      ),
      
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Text("আমার আবহাওয়া অ্যাপের প্রাইভেসি নীতি:"
                  "\n"
                  "আমার আবহাওয়া অ্যাপে আপনার ব্যক্তিগত আবহাওয়া সহকারী। স্থানীয় আবহাওয়ার পূর্বাভাসের সাথে, আপনি আত্মবিশ্বাসের সাথে ভ্রমণ করতে পারেন। এটি আবহাওয়ার তথ্য এবং আবহাওয়ার ডেটা ব্রাউজিং, 24 ঘন্টার মধ্যে সঠিক আবহাওয়ার পূর্বাভাস তথ্য, ভবিষ্যতে অনেক দিনের জন্য সঠিক পূর্বাভাস সরবরাহ করে।"
                  "\n"
                  "এছাড়া এই অ্যাপের মাধ্যমে বাংলাদেশের সকল আপডেট আবহাওয়্র খবর আপনি জানতে পারবেন।", style: TextStyle(
                fontSize: 18
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
