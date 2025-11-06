import 'package:flutter/material.dart';

class BookingDetailsScreen extends StatefulWidget {
	@override
	State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
	// ข้อมูลการจอง
	List<Map<String, dynamic>> workingDates = [
		{
			'date': '2025-09-29',
			'startTime': '10:00',
			'hours': '4',
		},
		{
			'date': '2025-09-30',
			'startTime': '09:30',
			'hours': '6',
		},
	];

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
						// ข้อมูลผู้จอง
						Container(
							padding: EdgeInsets.all(16),
							decoration: BoxDecoration(
								color: Color(0xFF2D2D2D),
								borderRadius: BorderRadius.circular(12),
							),
							child: Row(
								children: [
									// รูปโปรไฟล์
									CircleAvatar(
										backgroundImage: AssetImage('image/pretty2.png'),
										radius: 32,
									),
									SizedBox(width: 16),
									// ชื่อและ rating
									Column(
										crossAxisAlignment: CrossAxisAlignment.start,
										children: [
											Text(
												'Alena Brown',
												style: TextStyle(
													color: Color(0xFFF3C892),
													fontSize: 18,
													fontWeight: FontWeight.bold,
													fontFamily: 'Kanit',
												),
											),
											SizedBox(height: 4),
											Row(
												children: [
													Icon(Icons.star, color: Color(0xFFF3C892), size: 16),
													SizedBox(width: 4),
													Text(
														'4.2 Rating',
														style: TextStyle(
															color: Colors.white70,
															fontFamily: 'Kanit',
														),
													),
												],
											),
										],
									),
								],
							),
						),
						SizedBox(height: 24),

						// ราคาและรายละเอียด package
						Container(
							padding: EdgeInsets.all(16),
							decoration: BoxDecoration(
								color: Color(0xFF2D2D2D),
								borderRadius: BorderRadius.circular(12),
							),
							child: Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								children: [
									Row(
										mainAxisAlignment: MainAxisAlignment.spaceBetween,
										children: [
											Text(
												'MC 4 hours.',
												style: TextStyle(
													color: Colors.white,
													fontSize: 16,
													fontWeight: FontWeight.bold,
													fontFamily: 'Kanit',
												),
											),
											Text(
												'Price : 4,000',
												style: TextStyle(
													color: Color(0xFFF3C892),
													fontSize: 16,
													fontWeight: FontWeight.bold,
													fontFamily: 'Kanit',
												),
											),
										],
									),
									SizedBox(height: 8),
									Text(
										'4 hours',
										style: TextStyle(
											color: Colors.white70,
											fontSize: 12,
											fontFamily: 'Kanit',
										),
									),
									SizedBox(height: 12),
									Text(
										'Package Details such as Ideal for large conferences, festivals or corporate events. The transaction time does not exceed 8 hours.',
										style: TextStyle(
											color: Colors.white70,
											fontSize: 13,
											fontFamily: 'Kanit',
											height: 1.5,
										),
									),
								],
							),
						),
						SizedBox(height: 24),

						// Working Dates Section
						Text(
							'Working Date',
							style: TextStyle(
								color: Colors.white,
								fontSize: 16,
								fontWeight: FontWeight.bold,
								fontFamily: 'Kanit',
							),
						),
						SizedBox(height: 12),

						// List of working dates
						ListView.builder(
							shrinkWrap: true,
							physics: NeverScrollableScrollPhysics(),
							itemCount: workingDates.length,
							itemBuilder: (context, index) {
								final dateInfo = workingDates[index];
								return Padding(
									padding: EdgeInsets.only(bottom: 16),
									child: Container(
										padding: EdgeInsets.all(16),
										decoration: BoxDecoration(
											color: Color(0xFF2D2D2D),
											borderRadius: BorderRadius.circular(12),
										),
										child: Column(
											crossAxisAlignment: CrossAxisAlignment.start,
											children: [
												Text(
													'Start Date',
													style: TextStyle(
														color: Colors.white70,
														fontSize: 12,
														fontFamily: 'Kanit',
													),
												),
												SizedBox(height: 8),
												Row(
													children: [
														// Start Date Input
														Expanded(
															flex: 2,
															child: Container(
																padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
																decoration: BoxDecoration(
																	color: Color(0xFF1A1A1A),
																	borderRadius: BorderRadius.circular(8),
																	border: Border.all(color: Colors.white24),
																),
																child: Row(
																	children: [
																		Text(
																			dateInfo['date'] ?? '',
																			style: TextStyle(
																				color: Colors.white,
																				fontFamily: 'Kanit',
																			),
																		),
																		Spacer(),
																		Icon(Icons.calendar_today, color: Color(0xFFF3C892), size: 16),
																	],
																),
															),
														),
														SizedBox(width: 8),
														// Start Time Input
														Expanded(
															flex: 1,
															child: Container(
																padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
																decoration: BoxDecoration(
																	color: Color(0xFF1A1A1A),
																	borderRadius: BorderRadius.circular(8),
																	border: Border.all(color: Colors.white24),
																),
																child: Row(
																	mainAxisAlignment: MainAxisAlignment.spaceBetween,
																	children: [
																		Text(
																			dateInfo['startTime'] ?? '',
																			style: TextStyle(
																				color: Colors.white,
																				fontFamily: 'Kanit',
																				fontSize: 12,
																			),
																		),
																		Icon(Icons.arrow_drop_down, color: Color(0xFFF3C892), size: 16),
																	],
																),
															),
														),
														SizedBox(width: 8),
														// Working Hours Input
														Expanded(
															flex: 1,
															child: Container(
																padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
																decoration: BoxDecoration(
																	color: Color(0xFF1A1A1A),
																	borderRadius: BorderRadius.circular(8),
																	border: Border.all(color: Colors.white24),
																),
																child: Row(
																	mainAxisAlignment: MainAxisAlignment.spaceBetween,
																	children: [
																		Text(
																			dateInfo['hours'] ?? '',
																			style: TextStyle(
																				color: Colors.white,
																				fontFamily: 'Kanit',
																				fontSize: 12,
																			),
																		),
																		Icon(Icons.arrow_drop_down, color: Color(0xFFF3C892), size: 16),
																	],
																),
															),
														),
													],
												),
											],
										),
									),
								);
							},
						),
						SizedBox(height: 16),

						// Add Day Button
						GestureDetector(
							onTap: () {
								// ฟังก์ชันเพิ่มวันใหม่
								print('Add Day tapped');
							},
							child: Container(
								padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
								decoration: BoxDecoration(
									color: Color(0xFFF3C892),
									borderRadius: BorderRadius.circular(20),
								),
								child: Text(
									'+Add Day',
									style: TextStyle(
										color: Color(0xFF232323),
										fontWeight: FontWeight.bold,
										fontFamily: 'Kanit',
									),
								),
							),
						),
						SizedBox(height: 32),

						// Continue Button
						GestureDetector(
							onTap: () {
								// ฟังก์ชันดำเนินการต่อ
								print('Continue tapped');
							},
							child: Container(
								width: double.infinity,
								padding: EdgeInsets.symmetric(vertical: 14),
								decoration: BoxDecoration(
									color: Color(0xFFF3C892),
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
}
