import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../style.dart';

class DashboardScreen extends StatelessWidget {
  String _greeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopNav(),
            Padding(
              padding: EdgeInsets.only(
                  left: 10.0,
                  top: 20.0,
                  bottom: 20.0), // Adjust top and bottom margin as needed
              child: Text(
                'Today\'s Weathers',
                style: AppStyles.greetingTextStyle,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: WeatherSummary(),
            ),
            FarmAnalytics(
              seriesList:FarmAnalytics._createSampleData(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.dashboard),
              onPressed: () {
                Navigator.pushNamed(context, '/dashboard');
              },
            ),
            IconButton(
              icon: Icon(Icons.cloud),
              onPressed: () {
                Navigator.pushNamed(context, '/weather');
              },
            ),
            IconButton(
              icon: Icon(Icons.analytics),
              onPressed: () {
                Navigator.pushNamed(context, '/farm');
              },
            ),
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () {
                Navigator.pushNamed(context, '/camera');
              },
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Navigator.pushNamed(context, '/my_account');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TopNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppStyles.topNavBackgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                  'assets/profile.jpg', // Replace with user's profile image URL
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    'Mihigo Prince ', // Replace with dynamic user name
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.notifications, color: Colors.black),
              SizedBox(width: 20), // Adjust the width as needed
              Icon(Icons.more_vert, color: Colors.black),
            ],
          ),
        ],
      ),
    );
  }
}

class WeatherSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9, // 90% of the parent's width
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0), // Reduced bottom margin
        padding: EdgeInsets.all(15.0), // Reduced padding
        decoration: BoxDecoration(
          color: Colors.lightBlue, // Background color
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kigali, Rwanda',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0, // Reduced font size
                      ),
                    ),
                    SizedBox(height: 3.0), // Reduced height
                    Text(
                      '02/July/2024', // Replace with actual date
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.0, // Reduced font size
                      ),
                    ),
                  ],
                ),
                Image.network(
                  'assets/weather_icon.png', // Replace with actual cloud image asset
                  width: 100,
                  height: 60,
                ),
              ],
            ),
            SizedBox(height: 5.0), // Reduced height
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '25°C',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0, // Reduced font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 3.0), // Reduced height
                    Text(
                      'Humidity: 60%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0, // Reduced font size
                      ),
                    ),
                  ],
                ),
                Text(
                  'Cloudy', // Replace with actual weather condition
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0, // Reduced font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0), // Reduced height
            Divider(
              color: Colors.white,
              height: 10.0,
              thickness: 1.0,
            ),
            SizedBox(height: 5.0), // Reduced height
            Text(
              'Weather condition description or time info', // Replace with actual weather info text
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0, // Reduced font size
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FarmAnalytics extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  FarmAnalytics({required this.seriesList, this.animate = false});

  /// Create sample data
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 100),
      new LinearSales(3, 75),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppStyles.contentMargin,
      padding: AppStyles.contentPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Farm Analytics',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 200.0,
            child: charts.LineChart(
              _createSampleData(),
              animate: animate,
              behaviors: [
                new charts.SeriesLegend(
                  position: charts.BehaviorPosition.bottom,
                  horizontalFirst: false,
                  cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                ),
                new charts.ChartTitle(
                  'Rate of Rice Production',
                  behaviorPosition: charts.BehaviorPosition.top,
                  titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
                ),
                new charts.ChartTitle(
                  'Year',
                  behaviorPosition: charts.BehaviorPosition.bottom,
                  titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
                ),
                new charts.ChartTitle(
                  'Rate',
                  behaviorPosition: charts.BehaviorPosition.start,
                  titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Chance to Overcome Pests and Diseases',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 200.0,
            child: charts.LineChart(
              _createSampleData(),
              animate: animate,
              behaviors: [
                new charts.SeriesLegend(
                  position: charts.BehaviorPosition.bottom,
                  horizontalFirst: false,
                  cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                ),
                new charts.ChartTitle(
                  'Pest and Disease Control',
                  behaviorPosition: charts.BehaviorPosition.top,
                  titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
                ),
                new charts.ChartTitle(
                  'Year',
                  behaviorPosition: charts.BehaviorPosition.bottom,
                  titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
                ),
                new charts.ChartTitle(
                  'Control Rate',
                  behaviorPosition: charts.BehaviorPosition.start,
                  titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
