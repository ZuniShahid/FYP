import 'package:flutter/material.dart';
import 'dashboardHeader.dart';
import 'package:fl_chart/fl_chart.dart';


class dashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.grey[500],
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Text("Users Type",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  ),
                  SizedBox(
                    height: 400,
                    child:
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PieChart(
                        PieChartData(
                          sections: [
                            PieChartSectionData(
                              color: Colors.orangeAccent,
                              value: 25,
                              showTitle: false,
                              radius: 25,
                            ),
                            PieChartSectionData(
                              color: Colors.black,
                              value: 25,
                              showTitle: false,
                              radius: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


