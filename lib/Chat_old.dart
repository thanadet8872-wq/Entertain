import 'package:flutter/material.dart';
import 'booking.dart';

class ChatScreen extends StatelessWidget {
	final List<Map<String, String>> chats = [
		{
			'name': 'น้องจิน',
			'image': 'image/pretty2.png',
			'message': 'สวัสดีคะ',
		},
		{
			'name': 'น้องพลอพ',
			'image': 'image/pretty4.png',
			'message': 'ยินดีที่ได้รู้จักคะ',
		},
		{
			'name': 'น้องสตางค์',
			'image': 'image/pretty3.png',
			'message': 'พี่ว่างไหมคะ',
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
				centerTitle: true,
				title: Text('Chat', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22, fontFamily: 'Kanit')),
				actions: [
					IconButton(
						icon: Icon(Icons.menu, color: Colors.white),
						onPressed: () {},
					),
				],
			),
			body: ListView(
				padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
				children: [
					// Section: Recent Jobs
					Text(
						'Recent Jobs',
						style: TextStyle(
							color: Colors.white,
							fontSize: 18,
							fontWeight: FontWeight.bold,
							fontFamily: 'Kanit',
						),
					),
					SizedBox(height: 12),
					_buildJobCard(
						title: 'Entertain',
						name: 'Nay X',
						date: '20/10/2025',
						code: 'WRD',
						price: '฿ 4,000',
						checkIn: '05:00 น.',
						checkOut: '09:00 น.',
						status: 'สำเร็จสิ้น',
						statusColor: Colors.green,
						tag: 'สำเร็จสิ้น',
						tagColor: Colors.green,
					),
					SizedBox(height: 12),
					_buildJobCard(
						title: 'Entertain',
						name: 'Nay X',
						date: '20/10/2025',
						code: 'WRD',
						price: '฿ 4,000',
						checkIn: '10:00 น.',
						checkOut: '14:00 น.',
						status: 'ยังไม่ชำระ',
						statusColor: Color(0xFFF3C892),
						tag: 'ยังไม่ชำระ',
						tagColor: Color(0xFFF3C892),
					),
					SizedBox(height: 12),
					_buildJobCard(
						title: 'Entertain',
						name: 'Nay X',
						date: '20/10/2025',
						code: 'WRD',
						price: '฿ 4,000',
						checkIn: '00:00 น.',
						checkOut: '04:00 น.',
						status: 'ยกเลิกแล้ว',
						statusColor: Colors.red,
						tag: 'ยกเลิกแล้ว',
						tagColor: Colors.red,
					),
					SizedBox(height: 24),
					// Section: Messages
					Text(
						'Messages',
						style: TextStyle(
							color: Colors.white,
							fontSize: 18,
							fontWeight: FontWeight.bold,
							fontFamily: 'Kanit',
						),
					),
				SizedBox(height: 12),
				..._buildChatsList(context),
				],
			),
			bottomNavigationBar: BottomNavigationBar(
				backgroundColor: Color(0xFF232323),
				selectedItemColor: Color(0xFFF3C892),
				unselectedItemColor: Colors.white,
				type: BottomNavigationBarType.fixed,
				currentIndex: 1,
				onTap: (index) {
					// Map bottom nav indices to named routes to match other screens
					if (index == 0) {
						Navigator.pushNamed(context, '/welcome');
						return;
					}
					if (index == 1) {
						// already on Chat
						return;
					}
					if (index == 2) {
						Navigator.pushNamed(context, '/myjob');
						return;
					}
					if (index == 3) {
						Navigator.pushNamed(context, '/favorite');
						return;
					}
					if (index == 4) {
						Navigator.pushNamed(context, '/profile');
						return;
					}
				},
				items: [
					BottomNavigationBarItem(
						icon: Icon(Icons.home),
						label: 'Home',
					),
					BottomNavigationBarItem(
						icon: Image.asset(
							'image/chat.png',
							width: 24,
							height: 24,
							color: Color(0xFFF3C892),
						),
						label: 'Chat',
					),
					BottomNavigationBarItem(
						icon: Icon(Icons.local_fire_department),
						label: 'My Job',
					),
					BottomNavigationBarItem(
						icon: Icon(Icons.favorite_border),
						label: 'Favorite',
					),
					BottomNavigationBarItem(
						icon: Icon(Icons.person_outline),
						label: 'Profile',
					),
				],
			),
		);
	}

	List<Widget> _buildChatsList(BuildContext context) {
		return List.generate(
			chats.length,
			(index) {
				final chat = chats[index];
				return GestureDetector(
					onTap: () {
						Navigator.push(
							context,
							MaterialPageRoute(
								builder: (context) => ChatDetailScreen(
									name: chat['name'] ?? '',
									image: chat['image'] ?? '',
								),
							),
						);
					},
					child: Container(
						margin: EdgeInsets.only(bottom: 12),
						decoration: BoxDecoration(
							color: Color(0xFF2D2D2D),
							borderRadius: BorderRadius.circular(12),
						),
						child: ListTile(
							leading: CircleAvatar(
								backgroundImage: AssetImage(chat['image'] ?? ''),
								radius: 24,
							),
							title: Text(chat['name'] ?? '', style: TextStyle(color: Color(0xFFF3C892), fontWeight: FontWeight.bold, fontFamily: 'Kanit')),
							subtitle: Text(chat['message'] ?? '', style: TextStyle(color: Colors.white)),
							trailing: Icon(Icons.chevron_right, color: Colors.white),
						),
					),
				);
			},
		);
	}

	Widget _buildJobCard({
		required String title,
		required String name,
		required String date,
		required String code,
		required String price,
		required String checkIn,
		required String checkOut,
		required String status,
		required Color statusColor,
		required String tag,
		required Color tagColor,
	}) {
		return Container(
			decoration: BoxDecoration(
				color: Color(0xFF2D2D2D),
				borderRadius: BorderRadius.circular(12),
			),
			padding: EdgeInsets.all(16),
			child: Row(
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
				children: [
					// Left side: Job details
					Expanded(
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								Text(
									title,
									style: TextStyle(
										color: Colors.white,
										fontWeight: FontWeight.bold,
										fontSize: 16,
										fontFamily: 'Kanit',
									),
								),
								SizedBox(height: 4),
								Text(
									name,
									style: TextStyle(
										color: Colors.white,
										fontSize: 13,
										fontFamily: 'Kanit',
									),
								),
								SizedBox(height: 2),
								Text(
									date,
									style: TextStyle(
										color: Colors.white70,
										fontSize: 12,
										fontFamily: 'Kanit',
									),
								),
								SizedBox(height: 2),
								Text(
									code,
									style: TextStyle(
										color: Colors.white70,
										fontSize: 12,
										fontFamily: 'Kanit',
									),
								),
								SizedBox(height: 2),
								Text(
									price,
									style: TextStyle(
										color: Colors.white,
										fontSize: 13,
										fontFamily: 'Kanit',
									),
								),
							],
						),
					),
					// Right side: Status, times, and button
					Column(
						crossAxisAlignment: CrossAxisAlignment.end,
						children: [
							// Status with icon
							Row(
								children: [
									Text(
										status,
										style: TextStyle(
											color: statusColor,
											fontWeight: FontWeight.bold,
											fontSize: 12,
											fontFamily: 'Kanit',
										),
									),
									SizedBox(width: 4),
									if (statusColor == Colors.green)
										Icon(Icons.circle, color: Colors.green, size: 10)
									else if (statusColor == Color(0xFFF3C892))
										Icon(Icons.circle, color: Color(0xFFF3C892), size: 10)
									else if (statusColor == Colors.red)
										Icon(Icons.circle, color: Colors.red, size: 10),
								],
							),
							SizedBox(height: 8),
							// Check in
							Row(
								children: [
									Text(
										'Check in ',
										style: TextStyle(
											color: Colors.white70,
											fontSize: 11,
											fontFamily: 'Kanit',
										),
									),
									Text(
										checkIn,
										style: TextStyle(
											color: Colors.white,
											fontSize: 11,
											fontWeight: FontWeight.bold,
											fontFamily: 'Kanit',
										),
									),
								],
							),
							SizedBox(height: 2),
							// Check out
							Row(
								children: [
									Text(
										'Check Out ',
										style: TextStyle(
											color: Colors.white70,
											fontSize: 11,
											fontFamily: 'Kanit',
										),
									),
									Text(
										checkOut,
										style: TextStyle(
											color: Colors.white,
											fontSize: 11,
											fontWeight: FontWeight.bold,
											fontFamily: 'Kanit',
										),
									),
								],
							),
							SizedBox(height: 8),
							// Details button
							Container(
								padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
								decoration: BoxDecoration(
									color: Colors.grey[600],
									borderRadius: BorderRadius.circular(8),
								),
								child: Text(
									'รายละเอียด',
									style: TextStyle(
										color: Colors.white,
										fontSize: 11,
										fontFamily: 'Kanit',
									),
								),
							),
						],
					),
				],
			),
		);
	}
}

class ChatDetailScreen extends StatefulWidget {
	final String name;
	final String image;
	const ChatDetailScreen({required this.name, required this.image});

	@override
	State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
	TextEditingController _controller = TextEditingController();
	List<Map<String, String>> messages = [];
	bool _showActionBar = false;

	void _sendMessage() {
		if (_controller.text.trim().isNotEmpty) {
			setState(() {
				messages.add({'from': 'me', 'text': _controller.text.trim()});
				_controller.clear();
				_showActionBar = false;
			});
			Future.delayed(Duration(milliseconds: 500), () {
				setState(() {
					messages.add({'from': 'bot', 'text': 'How can I help you?'});
				});
			});
		}
	}

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
				title: Text(widget.name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Kanit')),
			),
			body: Stack(
				children: [
					Column(
						children: [
							SizedBox(height: 24),
							CircleAvatar(
								backgroundImage: AssetImage(widget.image),
								radius: 48,
							),
							SizedBox(height: 16),
							Text(widget.name, style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Kanit')),
							Expanded(
								child: ListView.builder(
									padding: EdgeInsets.all(16),
									itemCount: messages.length,
									itemBuilder: (context, index) {
										final msg = messages[index];
										final isMe = msg['from'] == 'me';
										return Align(
											alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
											child: Container(
												margin: EdgeInsets.symmetric(vertical: 4),
												padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
												decoration: BoxDecoration(
													color: isMe ? Color(0xFFF3C892) : Color(0xFF2D2D2D),
													borderRadius: BorderRadius.circular(16),
												),
												child: Text(msg['text'] ?? '', style: TextStyle(color: isMe ? Color(0xFF232323) : Colors.white, fontFamily: 'Kanit')),
											),
										);
									},
								),
							),
							Container(
								color: Color(0xFF1A1A1A),
								padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
								child: Column(
									children: [
										// แถวป้อนข้อมูลที่มีช่องข้อความและปุ่มส่ง
										Row(
											children: [
												// ปุ่มการกระทำ (menu/more options)
												GestureDetector(
													onTap: () {
														setState(() => _showActionBar = !_showActionBar);
													},
													child: Container(
														width: 40,
														height: 40,
														decoration: BoxDecoration(
															color: Color(0xFFF3C892),
															shape: BoxShape.circle,
														),
														child: Icon(
															Icons.add,
															color: Color(0xFF232323),
															size: 20,
														),
													),
												),
												SizedBox(width: 8),
												// ช่องป้อนข้อความ
												Expanded(
													child: Container(
														decoration: BoxDecoration(
															color: Color(0xFF2D2D2D),
															borderRadius: BorderRadius.circular(24),
														),
														child: TextField(
															controller: _controller,
															style: TextStyle(color: Colors.white, fontFamily: 'Kanit'),
															decoration: InputDecoration(
																hintText: 'พิมพ์ข้อความ...',
																hintStyle: TextStyle(color: Colors.white54, fontFamily: 'Kanit'),
																filled: true,
																fillColor: Color(0xFF2D2D2D),
																border: OutlineInputBorder(
																	borderRadius: BorderRadius.circular(24),
																	borderSide: BorderSide.none,
																),
																contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
															),
															onSubmitted: (value) => _sendMessage(),
														),
													),
												),
												SizedBox(width: 8),
												// ปุ่มส่ง
												GestureDetector(
													onTap: _sendMessage,
													child: Container(
														width: 40,
														height: 40,
														decoration: BoxDecoration(
															color: Color(0xFFF3C892),
															shape: BoxShape.circle,
														),
														child: Icon(
															Icons.send,
															color: Color(0xFF232323),
															size: 20,
														),
													),
												),
											],
										),
										// แถบการกระทำ - แสดงเมื่อเปิด
										if (_showActionBar)
											Column(
												children: [
													SizedBox(height: 12),
													Row(
														mainAxisAlignment: MainAxisAlignment.spaceAround,
														children: [
										// ปุ่มแนบไฟล์
										_buildActionButton(
											icon: Icons.attach_file,
											label: '',
											onTap: () {
												print('Attachment tapped');
												setState(() => _showActionBar = false);
											},
										),
										// กล้อง
										_buildActionButton(
											icon: Icons.camera_alt,
											label: '',
											onTap: () {
												print('Camera tapped');
												setState(() => _showActionBar = false);
											},
										),
										// ที่ตั้ง
										_buildActionButton(
											icon: Icons.location_on,
											label: '',
											onTap: () {
												print('Location tapped');
												setState(() => _showActionBar = false);
											},
										),
										// ปุ่มจองเลย
										_buildBookNowButton(),
													],
												),
											],
											),
									],
								),
							),
						],
					),
				],
			),
		);
	}Widget _buildActionButton({required IconData icon, required String label, required VoidCallback onTap}) {
	return GestureDetector(
		onTap: onTap,
		child: Container(
			width: 56,
			height: 56,
			decoration: BoxDecoration(
				color: Color(0xFF2D2D2D),
				borderRadius: BorderRadius.circular(12),
			),
			child: Icon(icon, color: Colors.white, size: 24),
		),
	);
}

Widget _buildBookNowButton() {
	return GestureDetector(
		onTap: () {
			print('Book now tapped');
			setState(() => _showActionBar = false);
			// ไปยังหน้า Booking Details
			Navigator.push(
				context,
				MaterialPageRoute(
					builder: (context) => BookingDetailsScreen(),
				),
			);
		},
		child: Container(
			padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
			decoration: BoxDecoration(
				color: Color(0xFFF3C892),
				borderRadius: BorderRadius.circular(12),
			),
			child: Text(
				'Book now',
				style: TextStyle(
					color: Color(0xFF232323),
					fontWeight: FontWeight.bold,
					fontFamily: 'Kanit',
					fontSize: 12,
				),
			),
		),
	);
}
}

