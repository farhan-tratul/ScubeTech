import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/reusable_components.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLT01Expanded = false;
  bool _isLT02Expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          '1st Page',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined,
                    color: AppColors.textPrimary),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),

            // Navigate to 2nd Page Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: NavigateButton(
                text: '2nd Page Navigate',
                onPressed: () {
                  Navigator.pushNamed(context, '/summary');
                },
              ),
            ),

            const SizedBox(height: 16),

            // Metrics Grid (3 columns)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: MetricCard(
                          value: '10000 kW',
                          label: 'Live AC Power',
                          icon: Icons.bolt,
                          iconColor: AppColors.green,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: MetricCard(
                          value: '82.58 %',
                          label: 'Plant Generation',
                          icon: Icons.factory,
                          iconColor: AppColors.blue,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: MetricCard(
                          value: '85.61 %',
                          label: 'Live PR',
                          icon: Icons.analytics,
                          iconColor: AppColors.purple,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: MetricCard(
                          value: '27.58 %',
                          label: 'Cumulative PR',
                          icon: Icons.water_drop,
                          iconColor: AppColors.blue,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: MetricCard(
                          value: '10000 t',
                          label: 'Return Inv',
                          icon: Icons.refresh,
                          iconColor: AppColors.orange,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: MetricCard(
                          value: '10000 kWh',
                          label: 'Total Energy',
                          icon: Icons.energy_savings_leaf,
                          iconColor: AppColors.pink,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Weather Widget
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: WeatherWidget(
                temperature: '30°C',
                windSpeed: '26 MPH / NW',
                irradiance: '15.20 W/m²',
              ),
            ),

            const SizedBox(height: 16),

            // Data Comparison Table
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Header
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: AppColors.border),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Text(
                            'Metrics',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Yesterday's Data",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textSecondary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Today's Data",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textSecondary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Data Rows
                  const DataComparisonRow(
                    label: 'AC Max Power',
                    yesterdayValue: '1636.50 kW',
                    todayValue: '2121.88 kW',
                  ),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  const DataComparisonRow(
                    label: 'Net Energy',
                    yesterdayValue: '6439.16 kWh',
                    todayValue: '4875.77 kWh',
                  ),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  const DataComparisonRow(
                    label: 'Specific Yield',
                    yesterdayValue: '1.25 kWh/kWp',
                    todayValue: '0.94 kWh/kWp',
                  ),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  const DataComparisonRow(
                    label: 'Net Energy',
                    yesterdayValue: '6439.16 kWh',
                    todayValue: '4875.77 kWh',
                  ),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  const DataComparisonRow(
                    label: 'Specific Yield',
                    yesterdayValue: '1.25 kWh/kWp',
                    todayValue: '0.94 kWh/kWp',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // System Info Cards
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.lightBlue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.lightBlue.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.solar_power,
                    size: 24,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Total Num of PV Module  :  6372 pcs. (585 Wp each)',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Grid of Info Cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InfoCard(
                          icon: Icons.ac_unit,
                          title: 'Total AC Capacity',
                          value: '3000 KW',
                          iconColor: AppColors.cyan,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: InfoCard(
                          icon: Icons.electrical_services,
                          title: 'Total DC Capacity',
                          value: '3.727 KW',
                          iconColor: AppColors.blue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: InfoCard(
                          icon: Icons.calendar_today,
                          title: 'Date of Commissioning',
                          value: '17/07/2024',
                          iconColor: AppColors.blue,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: InfoCard(
                          icon: Icons.memory,
                          title: 'Number of Inverter',
                          value: '30',
                          iconColor: AppColors.blue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: InfoCard(
                          icon: Icons.power,
                          title: 'Total AC Capacity',
                          value: '3000 KW',
                          iconColor: AppColors.blue,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: InfoCard(
                          icon: Icons.flash_on,
                          title: 'Total DC Capacity',
                          value: '3.727 MWp',
                          iconColor: AppColors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Expandable Energy Cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  ExpandableEnergyCard(
                    title: 'LT_01',
                    powerValue: '495.505 kWp / 440 kW',
                    isExpanded: _isLT01Expanded,
                    onTap: () {
                      setState(() {
                        _isLT01Expanded = !_isLT01Expanded;
                      });
                    },
                    metrics: {
                      'Lifetime Energy': '352.96 MWh',
                      'Prev. Meter Energy': '0.00 MWh',
                      'Today Energy': '273.69 kWh',
                      'Live Power': '352.96 MWh',
                    },
                  ),
                  const SizedBox(height: 12),
                  ExpandableEnergyCard(
                    title: 'LT_01',
                    powerValue: '495.505 kWp / 440 kW',
                    isExpanded: _isLT02Expanded,
                    onTap: () {
                      setState(() {
                        _isLT02Expanded = !_isLT02Expanded;
                      });
                    },
                    metrics: {
                      'Lifetime Energy': '352.96 MWh',
                      'Prev. Meter Energy': '0.00 MWh',
                      'Today Energy': '273.69 kWh',
                      'Live Power': '352.96 MWh',
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}