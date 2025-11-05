import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Color(0xFF181818),
			appBar: AppBar(
				backgroundColor: Color(0xFF181818),
				elevation: 0,
				leading: IconButton(
					icon: Icon(Icons.arrow_back, color: Colors.white),
					onPressed: () => Navigator.pop(context),
				),
				centerTitle: true,
				title: Text('Notification', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22, fontFamily: 'Kanit')),
				actions: [
					IconButton(
						icon: Icon(Icons.menu, color: Colors.white),
						onPressed: () {},
					),
				],
			),
			body: Padding(
				padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
				child: ListView.builder(
					itemCount: 4,
					itemBuilder: (context, index) {
						return Container(
							margin: EdgeInsets.only(bottom: 16),
							decoration: BoxDecoration(
								color: Color(0xFF232323),
								borderRadius: BorderRadius.circular(12),
								border: Border.all(color: Colors.black, width: 1),
							),
							child: Padding(
								padding: const EdgeInsets.all(12.0),
								child: Row(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: [
										Container(
											width: 40,
											height: 40,
											decoration: BoxDecoration(
												color: Colors.white,
												shape: BoxShape.circle,
											),
										),
										SizedBox(width: 12),
										Expanded(
											child: Column(
												crossAxisAlignment: CrossAxisAlignment.start,
												children: [
													Text('Booking', style: TextStyle(color: Color(0xFFF3C892), fontWeight: FontWeight.bold, fontSize: 16, fontFamily: 'Kanit')),
													SizedBox(height: 2),
													Text('Booking No.: 2156325, Job Title : ABCDEFG, Product Consultant. Pretty : Alena, Bitec Bangna 27 sep 2025', style: TextStyle(color: Colors.white, fontSize: 13, fontFamily: 'Kanit')),
													SizedBox(height: 2),
													Text('10/10/2025 19:00 น.', style: TextStyle(color: Color(0xFFF3C892), fontSize: 12, fontFamily: 'Kanit')),
												],
											),
										),
									],
								),
							),
						);
					},
				),
			),
			bottomNavigationBar: BottomNavigationBar(
				backgroundColor: Color(0xFF232323),
				selectedItemColor: Color(0xFFF3C892),
				unselectedItemColor: Colors.white,
				type: BottomNavigationBarType.fixed,
				currentIndex: 0,
				onTap: (index) {
					if (index == 0) {
						Navigator.pushNamed(context, '/welcome');
					}
				},
				items: const [
					BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
					BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Chat'),
					BottomNavigationBarItem(icon: Icon(Icons.local_fire_department), label: 'My Job'),
					BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favorite'),
					BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
				],
			),
		);
	}
}
