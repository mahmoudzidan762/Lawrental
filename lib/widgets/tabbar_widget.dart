import 'package:flutter/material.dart';
import 'package:lawrental/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  List<String> tabBar = ['All', 'man','woman'];
  int current = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.h,
      child: ListView.builder(
        // physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: tabBar.length,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                current = index;
              });
            },
            child: AnimatedContainer(
              margin: const EdgeInsets.all(5),
              width: 32.w,
              // height: 10.h,
              decoration: BoxDecoration(
                color:
                    current == index ? const Color(0xFF14213D) : Colors.white,
                borderRadius: BorderRadius.circular(60),
                border: Border.all(
                  color: KPrimaryColor,
                  style: BorderStyle.solid,
                  width: 0.5.w,
                ),
              ),
              duration: const Duration(milliseconds: 300),
              child: Center(
                child: Text(
                  tabBar[index],
                  style: TextStyle(
                    fontFamily: "medium",
                    fontSize: 18.sp,
                    // fontWeight: FontWeight.bold,
                    color: current == index
                        ? Colors.white
                        : const Color(0xFF14213D),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
