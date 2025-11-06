import 'package:flutter/material.dart';
import 'JobCardWidget.dart';
import 'Profilepertty1.dart';
import 'MenuDrawer.dart';


class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _showJobCard = false;
  int _selectedCategory = 0;
  int _selectedGender = 0;
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Search state
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  final List<String> _searchHistory = [];
  final List<String> _defaultSuggestions = [
    'MC',
    'Product Consultant',
    'Promotion Girl',
    'Bangkok',
    'Part-time',
    'Singer',
    'Dancer',
  ];
  List<String> _filteredSuggestions = [];
  bool _showSuggestions = false;

  void _updateSuggestions(String query) {
    final base = [..._searchHistory, ..._defaultSuggestions];
    final seen = <String>{};
    final unique = base.where((e) => seen.add(e));
    List<String> result;
    if (query.trim().isEmpty) {
      result = _searchHistory.isEmpty ? _defaultSuggestions : _searchHistory;
    } else {
      final q = query.toLowerCase();
      result = unique.where((e) => e.toLowerCase().contains(q)).toList();
    }
    setState(() {
      _filteredSuggestions = result.take(8).toList();
      _showSuggestions = _filteredSuggestions.isNotEmpty;
    });
  }

  void _onSubmitSearch(String value) {
    final q = value.trim();
    if (q.isEmpty) return;
    // Update history (most recent first, de-dup, keep up to 10)
    _searchHistory.removeWhere((e) => e.toLowerCase() == q.toLowerCase());
    _searchHistory.insert(0, q);
    if (_searchHistory.length > 10) _searchHistory.removeLast();
    setState(() {
      _showSuggestions = false;
    });
    Navigator.pushNamed(context, '/favorite');
  }

  void _onSuggestionTap(String text) {
    _searchController.text = text;
    _onSubmitSearch(text);
  }

  @override
  void initState() {
    super.initState();
    _searchFocusNode.addListener(() {
      if (!_searchFocusNode.hasFocus) {
        setState(() => _showSuggestions = false);
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  final List<String> categories = [
    'ALL',
    'MC',
    'Product Consultant',
    'Promotion Girl',
  ];
  final List<String> genders = ['Girl', 'Boy'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFF181818),
      endDrawer: MenuDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFF181818),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(Icons.notifications_none, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/notification');
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusScope.of(context).unfocus();
              setState(() => _showSuggestions = false);
            },
            child: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Color(0xFFF3C892)),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Location',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Bangkok, Prawet.',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.search, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Welcome to Entertain—\nconnecting you with the best talents!',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextField(
                      controller: _searchController,
                      focusNode: _searchFocusNode,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.white54),
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xFFF3C892),
                        ),
                        contentPadding: EdgeInsets.all(16),
                      ),
                      onTap: () {
                        if (_searchController.text.trim().isNotEmpty) {
                          _updateSuggestions(_searchController.text);
                        } else {
                          setState(() => _showSuggestions = false);
                        }
                      },
                      onChanged: _updateSuggestions,
                      onSubmitted: _onSubmitSearch,
                    ),
                  ),
                  if (_showSuggestions && _filteredSuggestions.isNotEmpty) ...[
                    SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      constraints: BoxConstraints(maxHeight: 240),
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        shrinkWrap: true,
                        itemCount: _filteredSuggestions.length,
                        separatorBuilder: (_, __) => Divider(color: Colors.white12, height: 1),
                        itemBuilder: (context, index) {
                          final text = _filteredSuggestions[index];
                          final inHistory = _searchHistory.any((e) => e.toLowerCase() == text.toLowerCase());
                          return ListTile(
                            dense: true,
                            leading: Icon(inHistory ? Icons.history : Icons.search, color: Color(0xFFF3C892)),
                            title: Text(text, style: TextStyle(color: Colors.white, fontFamily: 'Kanit')),
                            onTap: () => _onSuggestionTap(text),
                          );
                        },
                      ),
                    ),
                  ],
                  SizedBox(height: 24),
                  // การ์ดงานจะแสดงเมื่อกดการ์ด talent
                  if (_showJobCard) ...[
                    const JobCardWidget(),
                    SizedBox(height: 24),
                  ],
                  Text(
                    'Category',
                    style: TextStyle(
                      color: Color(0xFFF3C892),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(categories.length, (i) {
                        final selected = _selectedCategory == i;
                        return Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: ChoiceChip(
                            label: Text(
                              categories[i],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            selected: selected,
                            selectedColor: Color(0xFFF3E2B7),
                            backgroundColor: Color(0xFFF3E2B7),
                            labelStyle: TextStyle(
                              color: selected ? Colors.black : Colors.black54,
                            ),
                            onSelected: (_) {
                              setState(() => _selectedCategory = i);
                            },
                            // ไม่มี avatar
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Gender',
                    style: TextStyle(
                      color: Color(0xFFF3C892),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: List.generate(genders.length, (i) {
                      final selected = _selectedGender == i;
                      return Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: ChoiceChip(
                          label: Text(
                            genders[i],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          selected: selected,
                          selectedColor: Color(0xFFF3E2B7),
                          backgroundColor: Color(0xFFF3E2B7),
                          labelStyle: TextStyle(
                            color: selected ? Colors.black : Colors.black54,
                          ),
                          onSelected: (_) {
                            setState(() => _selectedGender = i);
                          },
                          // ไม่มี avatar
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Most Popular',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 12),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const Profilepertty1()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF232323),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(
                                    'image/pretty.png',
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Melisa',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: Color(0xFFF3C892),
                                          size: 16,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          'Prawet, Bangkok',
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Start: 3,000 ฿',
                                      style: TextStyle(
                                        color: Color(0xFFF3C892),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 24),
                  // เพิ่ม Section For you
                  Text(
                    'For you',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 12),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const Profilepertty1()),
                          );
                        },
                        child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF232323),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.asset(
                                      'image/pretty.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Color(0xFFF3C892),
                                            size: 16,
                                          ),
                                          SizedBox(width: 2),
                                          Text(
                                            '4.5',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(width: 4),
                                          Icon(
                                            Icons.verified,
                                            color: Color(0xFFF3C892),
                                            size: 16,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Melisa',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: Color(0xFFF3C892),
                                            size: 16,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            'Prawet, Bangkok',
                                            style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Start: 2,500 ฿',
                                        style: TextStyle(
                                          color: Color(0xFFF3C892),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      );
                    },
                  ),
                  SizedBox(height: 80),
                ],
              ),
            ),
          ),
          ),
          // Floating action buttons ด้านขวาล่าง
          Positioned(
            bottom: 90,
            right: 16,
            child: Column(
              children: [
                FloatingActionButton(
                  heroTag: 'chat',
                  backgroundColor: Color(0xFFF3E2B7),
                  onPressed: () {
                    Navigator.pushNamed(context, '/chat');
                  },
                  child: Image.asset(
                    'image/chat.png',
                    width: 28,
                    height: 28,
                  ),
                ),
                SizedBox(height: 16),
                FloatingActionButton(
                  heroTag: 'line',
                  backgroundColor: Color(0xFFF3E2B7),
                  onPressed: () {},
                  child: Image.asset(
                    'image/line.png',
                    width: 28,
                    height: 28,
                  ),
                ),
                SizedBox(height: 16),
                FloatingActionButton(
                  heroTag: 'search',
                  backgroundColor: Color(0xFFF3E2B7),
                  onPressed: () {},
                  child: Icon(Icons.search, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF232323),
        selectedItemColor: Color(0xFFF3C892),
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);
          if (index == 1) {
            Navigator.pushNamed(context, '/chat');
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Image.asset(
              'image/chat.png',
              width: 24,
              height: 24,
              color: _selectedIndex == 1 ? Color(0xFFF3C892) : Colors.white,
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_fire_department),
            label: 'myJob',
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
 