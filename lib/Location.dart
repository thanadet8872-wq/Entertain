import 'package:flutter/material.dart';
class LocationScreen extends StatefulWidget {
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  TextEditingController areaController = TextEditingController();
  String selectedProvince = 'Bangkok';
  String selectedDistrict = 'Nong Khaem';
  final List<String> allAreas = ['Bang Bon', 'Bang Khae', 'Bang Khun Thian'];
  String searchText = '';

  @override
  void dispose() {
    areaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 32),
                Image.asset('image/Location.png', width: 70, height: 70),
                SizedBox(height: 18),
                Text(
                  'Select your address zone',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  "We need your location to determine if it's available in your area.",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 28),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Province',
                    style: TextStyle(
                      color: Color(0xFFF3C892),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 6),
                Container(
                  width: 320,
                  decoration: BoxDecoration(
                    color: Color(0xFFF3E2B7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedProvince,
                      isExpanded: true,
                      items: ['Bangkok']
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedProvince = value!;
                        });
                      },
                      dropdownColor: Color(0xFFF3E2B7),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'District',
                    style: TextStyle(
                      color: Color(0xFFF3C892),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 6),
                Container(
                  width: 320,
                  decoration: BoxDecoration(
                    color: Color(0xFFF3E2B7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedDistrict,
                      isExpanded: true,
                      items: ['Nong Khaem']
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedDistrict = value!;
                        });
                      },
                      dropdownColor: Color(0xFFF3E2B7),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Other areas',
                    style: TextStyle(
                      color: Color(0xFFF3C892),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 6),
                Container(
                  width: 320,
                  decoration: BoxDecoration(
                    color: Color(0xFFF3E2B7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: areaController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchText = value.trim();
                      });
                    },
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: 320,
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: allAreas
                        .where((area) => searchText.isEmpty || area.toLowerCase().contains(searchText.toLowerCase()))
                        .map((area) => Chip(
                              label: Text(area),
                              backgroundColor: Color(0xFFF3E2B7),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(height: 40),
                Center(
                  child: SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/welcome');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF3C892),
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        shadowColor: Colors.black,
                        elevation: 8,
                      ),
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
