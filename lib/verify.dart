

import 'package:flutter/material.dart';
import 'smsOTP.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class VerifyScreen extends StatefulWidget {
	@override
	State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
	File? _idCardImage;
	final ImagePicker _picker = ImagePicker();

	Future<void> _pickImage() async {
		final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
		if (pickedFile != null) {
			setState(() {
				_idCardImage = File(pickedFile.path);
			});
		}
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Color(0xFF181818),
			body: SafeArea(
				child: Padding(
					padding: const EdgeInsets.symmetric(horizontal: 24.0),
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.center,
						children: [
											SizedBox(height: 32),
											Text(
												'Verify your personal information',
												style: TextStyle(
													color: Colors.white,
													fontSize: 18,
													fontWeight: FontWeight.w600,
												),
												textAlign: TextAlign.center,
											),
											SizedBox(height: 50),
															Expanded(
																child: Center(
																	child: Container(
																		width: double.infinity,
																		padding: EdgeInsets.symmetric(vertical: 32, horizontal: 50),
																		decoration: BoxDecoration(
																			color: Color(0xFF232323),
																			borderRadius: BorderRadius.circular(50),
																		),
																		child: Center(
																			child: Column(
																				mainAxisSize: MainAxisSize.min,
																				children: [
																					GestureDetector(
																						onTap: _pickImage,
																						child: Container(
																							width: 100,
																							height: 100,
																							decoration: BoxDecoration(
																								color: Color(0xFF232323),
																								borderRadius: BorderRadius.circular(50),
																								border: Border.all(color: Colors.grey.shade700, width: 2),
																							),
																							child: _idCardImage == null
																									? Icon(Icons.camera_alt_outlined, color: Colors.grey.shade600, size: 50)
																									: ClipRRect(
																											borderRadius: BorderRadius.circular(12),
																											child: Image.file(_idCardImage!, fit: BoxFit.cover),
																										),
																						),
																					),
																					SizedBox(height: 50),
																					Text(
																						_idCardImage == null ? 'Select a file from your phone' : 'ID Card selected',
																						style: TextStyle(
																							color: Colors.grey.shade400,
																							fontSize: 16,
																						),
																					),
																				],
																			),
																		),
																	),
																),
															),
							Spacer(),
							SizedBox(
								width: double.infinity,
								child: ElevatedButton(
														onPressed: () {
															Navigator.push(
																context,
																MaterialPageRoute(
																	builder: (context) => SMSOTPScreen(phoneNumber: ''),
																),
															);
														},
									style: ElevatedButton.styleFrom(
										backgroundColor: Color(0xFFF3C892),
										foregroundColor: Colors.black,
										padding: EdgeInsets.symmetric(vertical: 16),
										shape: RoundedRectangleBorder(
											borderRadius: BorderRadius.circular(10),
										),
									),
									child: Text(
										'Next',
										style: TextStyle(
											fontSize: 16,
											fontWeight: FontWeight.w600,
										),
									),
								),
							),
							SizedBox(height: 32),
						],
					),
				),
			),
		);
	}
}
