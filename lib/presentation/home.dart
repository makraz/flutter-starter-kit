import 'package:flutter/material.dart';
import '../widget/button.dart';
import '../widget/input_text.dart';
import '../widget/slider.dart';
import '../widget/tabs_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final TextEditingController _textController = TextEditingController();

  static const List<String> _pageTitles = [
    'Home Page',
    'Search Page',
    'Profile Page',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildHomeContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to the Home Page',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          CarouselSlider(
            items: List.generate(
              5,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Color(0xFF42A5F5)
                      .withOpacity(0.1 * (index + 1)),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Center(
                  child: Text(
                    'Item ${index + 1}',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            height: 250.0, 
            viewportFraction: 0.7, 
            padding: const EdgeInsets.all(8.0), 
            activeIndicatorColor: Colors.red, 
            inactiveIndicatorColor:
                Colors.black12, 
            indicatorHeight: 12.0, 
            indicatorWidth: 24.0, 
            indicatorDuration: const Duration(
                milliseconds: 500), 
            autoSlide: true, 
            autoSlideInterval: Duration(
                seconds: 5), 
          )

          ,
          SizedBox(height: 16),
          CustomTextFormField(
            controller: _textController,
            hintText: 'Enter your email',
            prefixIcon: Icon(Icons.email_outlined),
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          CustomElevatedButton(
            text: 'Submit',
            onPressed: () {
              final inputText = _textController.text;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('You entered: $inputText')),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _getPageContent() {
    switch (_selectedIndex) {
      case 0:
        return _buildHomeContent();
      case 1:
        return  CustomTabsWidget(
        tabTitles: ['Tab 1', 'Tab 2', 'Tab 3'],
        tabContents: [
          Center(
            child: Text(
              'Content of Tab 1',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Center(
            child: Text(
              'Content of Tab 2',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Center(
            child: Text(
              'Content of Tab 3',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
        indicatorColor: Colors.red, 
        selectedLabelColor: Colors.white, 
        unselectedLabelColor: Colors.grey, 
        tabHeight: 200.0, 
        tabBarHeight: 50.0, 
      
    );
  
      case 2:
        return Center(
          child: Text(
            'Profile Page',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        );
      default:
        return SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageTitles[_selectedIndex]),
        backgroundColor: Colors.blue,
      ),
      body: _getPageContent(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
