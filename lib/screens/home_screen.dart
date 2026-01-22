import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // Add current time tracking
  late String _currentTime;
  late String _currentTemp;
  late String _currentImage;
  late String _img;

  @override
  void initState() {
    super.initState();

    // Initialize with default values
    _currentTime = '11 AM - 12 PM';
    _currentTemp = '28°C';
    _currentImage = 'assets/t_1.png';
    _img='asset/sun.png';
    _updateCurrentTime();
    // Update time every minute
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateCurrentTime();
    });
  }
  int _currentIndex = 0;// Add this variable

  void _updateCurrentTime() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % 3;

      switch (_currentIndex) {
        case 0:
          _currentTime = '11AM-12PM';
          _currentTemp = '28°C';
          _currentImage = 'assets/t_1.png';
          _img='assets/mid_day.png';
          break;
        case 1:
          _currentTime = '12PM-1PM';
          _currentTemp = '32°C';
          _currentImage = 'assets/t_2.png';
          _img='assets/moon.png';
          break;
        case 2:
          _currentTime = '2PM-3PM';
          _currentTemp = '30°C';
          _currentImage = 'assets/t_3.png';
          _img='assets/sun.png';
          break;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // Define screen width helpers if needed, using standard padding from image
    const double horizontalPadding = 16.0;

    return Scaffold(
      backgroundColor: const Color(0xFFD3DFF0), // Light greyish-blue background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1F2937)),
          onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false),
        ),
        title: const Text(
          '1st Page',
          style: TextStyle(
            color: Color(0xFF1F2937),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none_outlined,
                    color: Color(0xFF1F2937), size: 26),
                onPressed: () {},
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEF4444),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            const SizedBox(height: 8),

            // 1. Navigation Button (Cyan Gradient)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Container(
                height: 36,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00C1E8), Color(0xFF00A9D4)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF00C1E8).withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(context, '/summary'),
                    borderRadius: BorderRadius.circular(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          '2nd Page Navigate',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // 2. Metrics Grid (3x2)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildMetricCard(
                          value: '10000 kW',
                          label: 'Live AC Power',
                          assetName: 'assets/u_1.png',
                          icon: Icons.bolt,
                          color: const Color(0xFF22C55E), // Green
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: _buildMetricCard(
                          value: '82.58 %',
                          label: 'Plant Generation',
                          assetName: 'assets/u_2.png',
                          icon: Icons.factory_outlined,
                          color: const Color(0xFF00C1E8), // Cyan
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: _buildMetricCard(
                          value: '85.61 %',
                          label: 'Live PR',
                          assetName: 'assets/u_3.png',
                          icon: Icons.pie_chart_outline,
                          color: const Color(0xFF8B5CF6), // Purple
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(
                        child: _buildMetricCard(
                          value: '27.58 %',
                          label: 'Cumulative PR',
                          assetName: 'assets/u_4.png',
                          icon: Icons.speed,
                          color: const Color(0xFF3B82F6), // Blue
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: _buildMetricCard(
                          value: '10000 ৳',
                          label: 'Return Pv',
                          assetName: 'assets/u_5.png',
                          icon: Icons.currency_exchange,
                          color: const Color(0xFFF97316), // Orange
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: _buildMetricCard(
                          value: '10000 kWh',
                          label: 'Total Energy',
                          assetName: 'assets/u_6.png',
                          icon: Icons.hub_outlined,
                          color: const Color(0xFFD946EF), // Magenta
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // 3. Weather Widget (Split Card)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Row(
                    children: [
                      // Left: Temperature
                      Expanded(
                        flex: 5,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          color: Colors.white,
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _currentTemp,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF00C1E8), // Cyan text
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    _currentTime,
                                    style: TextStyle(
                                      fontSize: 11,
                                      height: 1.2,
                                      color: Color(0xFF6B7280),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 8),
                              SizedBox(
                                height: 60,
                                width: 30,
                                child: Image.asset(
                                  _currentImage,
                                  width: 30,
                                  height: 60,
                                  fit: BoxFit.contain,
                                  errorBuilder: (c, e, s) => const Icon(Icons.device_thermostat, color: Colors.orange, size: 40),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Right: Wind/Irradiation (Purple Gradient)
                      Expanded(
                        flex: 6,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF8B5CF6), Color(0xFFA78BFA)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    '26 MPH / NW',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Wind Speed & Direction',
                                    style: TextStyle(fontSize: 9, color: Colors.white70),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '15.20 w/m²',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Effective Irradiation',
                                    style: TextStyle(fontSize: 9, color: Colors.white70),
                                  ),
                                ],
                              ),
                              Image.asset(
                                _img,
                                width: 40,
                                height: 40,
                                errorBuilder: (c,e,s) => const Icon(Icons.wb_sunny, color: Colors.yellow, size: 30),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // 4. Data Comparison Table
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
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
                    // Table Header
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                      child: Row(
                        children: const [
                          Expanded(flex: 3, child: SizedBox()), // Spacer for label col
                          Expanded(flex: 2, child: Text("Yesterday's Data", textAlign: TextAlign.center, style: TextStyle(fontSize: 11, color: Color(0xFF4B5563), fontWeight: FontWeight.w600))),
                          Expanded(flex: 2, child: Text("Today's Data", textAlign: TextAlign.center, style: TextStyle(fontSize: 11, color: Color(0xFF4B5563), fontWeight: FontWeight.w600))),
                        ],
                      ),
                    ),
                    const Divider(height: 1, color: Color(0xFFE5E7EB)),
                    _buildTableRow('AC Max Power', '1636.50 kW', '2121.88 kW'),
                    const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFF3F4F6)),
                    _buildTableRow('Net Energy', '6439.16 kWh', '4875.77 kWh'),
                    const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFF3F4F6)),
                    _buildTableRow('Specific Yield', '1.25 kWh/kWp', '0.94 kWh/kWp'),
                    const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFF3F4F6)),
                    _buildTableRow('Net Energy', '6439.16 kWh', '4875.77 kWh'),
                    const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFF3F4F6)),
                    _buildTableRow('Specific Yield', '1.25 kWh/kWp', '0.94 kWh/kWp'),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 8),

            // 5. Info Banner
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white, // Light blue tint
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue.withOpacity(0.1)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Image.asset(
                        'assets/solar_power.png',  // or your preferred asset name
                        width: 20,
                        height: 20,
                        errorBuilder: (c, e, s) => const Icon(Icons.solar_power, color: Color(0xFF3B82F6), size: 20),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Total Num of PV Module  :  6372 pcs. (585 Wp each)',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 8),

            // 6. Info Grid (3x2)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: _buildInfoCard('Total AC Capacity', '3000 KW', Icons.speed, Colors.cyan, assetName: 'assets/p_1.png')),
                      const SizedBox(width: 12),
                      Expanded(child: _buildInfoCard('Total DC Capacity', '3.727 MWp', Icons.memory, Colors.blue, assetName: 'assets/p_2.png')),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _buildInfoCard('Date of Commissioning', '17/07/2024', Icons.calendar_today, Colors.blue,assetName: 'assets/p_3.png')),
                      const SizedBox(width: 12),
                      Expanded(child: _buildInfoCard('Number of Inverter', '30', Icons.dns, Colors.blue,assetName: 'assets/p_4.png')),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _buildInfoCard('Total AC Capacity', '3000 KW', Icons.speed, Colors.blue,assetName: 'assets/p_1.png')),
                      const SizedBox(width: 12),
                      Expanded(child: _buildInfoCard('Total DC Capacity', '3.727 MWp', Icons.memory, Colors.blue,assetName: 'assets/p_2.png')),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // 7. Expandable Energy Cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                children: [
                  _buildEnergyCard(title: 'LT_01', power: '495.505 kWp / 440 kW'),
                  const SizedBox(height: 12),
                  _buildEnergyCard(title: 'LT_02', power: '495.505 kWp / 440 kW'),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _buildMetricCard({required String value, required String label, required String assetName, required IconData icon, required Color color}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 6, offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          // Icon on left
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              assetName,
              width: 20,
              height: 20,
              errorBuilder: (c, e, s) => Icon(icon, size: 20, color: color),
            ),
          ),
          const SizedBox(width: 8),
          // Text on right
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Color(0xFF1F2937)),
                ),
                const SizedBox(height: 2),
                Text(
                  label,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 10, color: Color(0xFF6B7280), fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableRow(String label, String val1, String val2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF374151))),
          ),
          Expanded(
            flex: 2,
            child: Text(val1, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF1F2937))),
          ),
          Expanded(
            flex: 2,
            child: Text(val2, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: Color(0xFF1F2937))),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String value, IconData icon, Color color, {String? assetName}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          // Icon/Image on left
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: assetName != null
                ? Image.asset(
              assetName,
              width: 22,
              height: 22,
              errorBuilder: (c, e, s) => Icon(icon, size: 18, color: color),
            )
                : Icon(icon, size: 18, color: color),
          ),
          const SizedBox(width: 10),
          // Text on right
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 10, color: Color(0xFF6B7280), fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text(value, style: const TextStyle(fontSize: 14, color: Color(0xFF1F2937), fontWeight: FontWeight.w700)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEnergyCard({required String title, required String power}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 6, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          // Title left, Power right
          Row(
            children: [
              // Title on left
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Color(0xFF1F2937)),
                ),
              ),
              // Power info on right
              Row(
                children: [
                  const Icon(Icons.bolt, color: Color(0xFF3B82F6), size: 16),
                  const SizedBox(width: 4),
                  Text(power, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF3B82F6))),
                ],
              ),
            ],
          ),
          const SizedBox(height: 6),
          // 2x2 Grid of components (keep your current grid)
          Row(
            children: [
              Expanded(child: _buildComponentItem(assetName: 'assets/d_1.png', label: 'Lifetime Energy', value: '352.96 MWh')),
              const SizedBox(width: 12),
              Expanded(child: _buildComponentItem(assetName: 'assets/d_2.png', label: 'Today Energy', value: '273.69 kWh')),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(child: _buildComponentItem(assetName: 'assets/d_3.png', label: 'Live Power', value: '352.96 MWh')),
              const SizedBox(width: 12),
              Expanded(child: _buildComponentItem(assetName: 'assets/d_4.png', label: 'CO₂ Saved', value: '352.96 MWh')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildComponentItem({IconData? icon, String? assetName, required String label, required String value}) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xFFE0F2FE),
            borderRadius: BorderRadius.circular(4),
          ),
          child: assetName != null
              ? Image.asset(
            assetName,
            width: 16,
            height: 16,
            errorBuilder: (c, e, s) => Icon(icon ?? Icons.help_outline, size: 16, color: const Color(0xFF0284C7)),
          )
              : Icon(icon ?? Icons.help_outline, size: 16, color: const Color(0xFF0284C7)),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontSize: 10, color: Color(0xFF6B7280))),
              Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFF1F2937))),
            ],
          ),
        ),
      ],
    );
  }
}