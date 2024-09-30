import 'package:flutter/material.dart';
import '../models/place_model.dart';
import '../services/api_service.dart';
import '../widgets/popular_destination_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService apiService = ApiService();
  late Future<List<Place>> futurePlaces;

  @override
  void initState() {
    super.initState();
    futurePlaces = apiService.getAllPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi Guy!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Where are you going next?'),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search your destination',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategoryButton(title: 'Hotels', icon: Icons.hotel),
                CategoryButton(title: 'Flights', icon: Icons.flight),
                CategoryButton(title: 'All', icon: Icons.explore),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<Place>>(
                future: futurePlaces,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return PopularDestinationWidget(
                          place: snapshot.data![index],
                        );
                      },
                    );
                  } else {
                    return Text('No places available');
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'SEARCH',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'PROFILE',
          ),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String title;
  final IconData icon;

  CategoryButton({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 32),
        Text(title),
      ],
    );
  }
}
