import 'package:flutter/material.dart';
import 'booking3.dart';

class BookingDetailsPage extends StatefulWidget {
  @override
  State<BookingDetailsPage> createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends State<BookingDetailsPage> {
  final _nameController = TextEditingController();
  final _contactController = TextEditingController();
  final _phoneController = TextEditingController();
  final _eventController = TextEditingController();
  final _detailsController = TextEditingController();
  
  String? _selectedWorkType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF232323),
      appBar: AppBar(
        backgroundColor: Color(0xFF232323),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Booking Details',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'Kanit',
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Job Information Title
            Text(
              'Job Information',
              style: TextStyle(
                color: Color(0xFFEBDFC5),
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Kanit',
              ),
            ),
            SizedBox(height: 16),

            // Name Field
            _buildLabel('Name'),
            SizedBox(height: 8),
            _buildTextField(
              controller: _nameController,
              hintText: 'Enter your employer name or company name',
            ),
            SizedBox(height: 16),

            // Contact Name Field
            _buildLabel('Contact name'),
            SizedBox(height: 8),
            _buildTextField(
              controller: _contactController,
              hintText: 'Enter your contact name',
            ),
            SizedBox(height: 16),

            // Phone Number Field
            _buildLabel('Phone number'),
            SizedBox(height: 8),
            _buildTextField(
              controller: _phoneController,
              hintText: 'Enter your phone number',
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16),

            // Work Type Dropdown
            _buildLabel('Work Type'),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                value: _selectedWorkType,
                hint: Text(
                  'Select work type',
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Kanit',
                  ),
                ),
                items: ['Wedding', 'Corporate', 'Birthday', 'Other'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        value,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Kanit',
                        ),
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedWorkType = newValue;
                  });
                },
                isExpanded: true,
                underline: SizedBox(),
              ),
            ),
            SizedBox(height: 16),

            // Event Field
            _buildLabel('Event'),
            SizedBox(height: 8),
            _buildTextField(
              controller: _eventController,
              hintText: 'Enter your event name',
            ),
            SizedBox(height: 16),

            // Job Details Field
            _buildLabel('Job details'),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _detailsController,
                maxLines: 5,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Kanit',
                ),
                decoration: InputDecoration(
                  hintText: 'Enter your job details',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Kanit',
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(12),
                ),
              ),
            ),
            SizedBox(height: 32),

            // Continue Button
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LocationDetailsPage()),
                );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Color(0xFFE8B574),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Color(0xFF232323),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Kanit',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Text(
      label,
      style: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontFamily: 'Kanit',
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Kanit',
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontFamily: 'Kanit',
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    _phoneController.dispose();
    _eventController.dispose();
    _detailsController.dispose();
    super.dispose();
  }
}
