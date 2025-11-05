import 'package:flutter/material.dart';

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
			body: ListView.builder(
				padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
				itemCount: chats.length,
				itemBuilder: (context, index) {
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
				items: const [
					BottomNavigationBarItem(
						icon: Icon(Icons.home),
						label: 'Home',
					),
					BottomNavigationBarItem(
						icon: Icon(Icons.chat_bubble_outline),
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

		void _sendMessage() {
			if (_controller.text.trim().isNotEmpty) {
				setState(() {
					messages.add({'from': 'me', 'text': _controller.text.trim()});
					_controller.clear();
				});
				Future.delayed(Duration(milliseconds: 500), () {
					setState(() {
						messages.add({'from': 'bot', 'text': 'มีอะไรให้หนูช่วยไหมคะ'});
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
			body: Column(
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
								Padding(
									padding: EdgeInsets.all(16),
									child: Row(
										children: [
											Expanded(
												child: TextField(
													controller: _controller,
													style: TextStyle(color: Colors.white, fontFamily: 'Kanit'),
													decoration: InputDecoration(
														hintText: 'พิมพ์ข้อความ...',
														hintStyle: TextStyle(color: Colors.white54),
														filled: true,
														fillColor: Color(0xFF2D2D2D),
														border: OutlineInputBorder(
															borderRadius: BorderRadius.circular(16),
															borderSide: BorderSide.none,
														),
													),
													onSubmitted: (value) => _sendMessage(),
												),
											),
											SizedBox(width: 8),
											ElevatedButton(
												style: ElevatedButton.styleFrom(
													backgroundColor: Color(0xFFF3C892),
													shape: RoundedRectangleBorder(
														borderRadius: BorderRadius.circular(16),
													),
												),
												onPressed: _sendMessage,
												child: Icon(Icons.send, color: Color(0xFF232323)),
											),
										],
									),
								),
				],
			),
		);
	}
}
