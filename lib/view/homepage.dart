import 'package:flutter/material.dart';
import 'package:video_streaming_bloc_017/config/color/color.dart';
import 'package:video_streaming_bloc_017/view/widgets/profile/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video"),
        backgroundColor: AppColors.blueColor,

        // actions: [
        //   InkWell(
        //     onTap: () {
        //      const ProfileClass();
        //     },
        //     child:const Text("Click"),
        //   )
        // ],
      ),
      endDrawer: const ProfileClass(),
      body: Column(),
    );
  }
}
