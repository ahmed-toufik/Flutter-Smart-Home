import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthome/pages/smart_device_box.dart';

class HomemPage extends StatefulWidget {
  const HomemPage({super.key});

  @override
  State<HomemPage> createState() => _HomemPageState();
}

class _HomemPageState extends State<HomemPage> {
  //padding constants
  final double horizontalpadding = 40;
  final double verticalpadding = 25;

  //List of Smart Devices
  List mySmartDevices = [
    // [ smartDeviceName, iconPath, powerstatus]
    ["Smart Light", "icons/light-bulb.png", true],
    ["Smart AC", "icons/air-conditioner.png", false],
    ["Smart TV", "icons/smart-tv.png", false],
    ["Smart Fan", "icons/fan.png", false],
  ];

  //power button switched
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //custom appbar
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalpadding, vertical: verticalpadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //menu icon
                  Image.asset(
                    "icons/menu.png",
                    height: 45,
                    color: Colors.grey[800],
                  ),

                  //account icon
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //welcome home TOUFIK
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalpadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Home",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[700]),
                  ),
                  Text(
                    "TOUFIK AHMED",
                    style: GoogleFonts.lora(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            //Divider

            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalpadding),
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),

            //smart devices + grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalpadding),
              child: Text(
                "Smart Devices",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.grey[800]),
              ),
            ),

            Expanded(
              child: GridView.builder(
                itemCount: mySmartDevices.length,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                    onChanged: (value) => powerSwitchChanged(value, index),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
