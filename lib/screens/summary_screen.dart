import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../theme/app_theme.dart';
import '../widgets/reusable_components.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isSourceSelected = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final horizontalPadding = isTablet ? 24.0 : 12.0;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          '2nd Page',
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
                    color: AppColors.textPrimary, size: 24),
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
          SizedBox(width: isTablet ? 16 : 8),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: isTablet ? 16 : 8),

          // ===== NAVIGATE TO 1ST PAGE BUTTON =====
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isTablet ? 14.0 : 10.0),
            child: SizedBox(
              height: 36,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00C1E8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                  padding: EdgeInsets.zero,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '1st Page Navigate',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: isTablet ? 10 : 8),

          // ===== WHITE CONTAINER WITH TABS + DATA CARDS ONLY =====
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isTablet ? 30.0 : 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
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
                    // ===== TABS =====
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        height: 38,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TabBar(
                          controller: _tabController,
                          indicator: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelColor: Colors.white,
                          unselectedLabelColor: AppColors.textSecondary,
                          labelStyle: TextStyle(
                            fontSize: isTablet ? 16 : 15,
                            fontWeight: FontWeight.w600,
                          ),
                          unselectedLabelStyle: TextStyle(
                            fontSize: isTablet ? 16 : 15,
                            fontWeight: FontWeight.normal,
                          ),
                          tabs: const [
                            Tab(text: 'Summary'),
                            Tab(text: 'SLD'),
                            Tab(text: 'Data'),
                          ],
                        ),
                      ),
                    ),

                    // ===== TAB CONTENT =====
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          _buildSummaryTab(isTablet, horizontalPadding),
                          _buildSLDTab(),
                          _buildDataTab(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ACTION BUTTONS GRID
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isTablet ? 30.0 : 20.0),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: isTablet ? 3 : 2,
              mainAxisSpacing: isTablet ? 12 : 5,
              crossAxisSpacing: isTablet ? 12 : 10,
              childAspectRatio: isTablet ? 2.2 : 3.0,
              children: [
                _buildActionButtonWithImage(
                  imagePath: 'assets/1.png',
                  label: 'Analysis Pro',
                  isTablet: isTablet,
                ),
                _buildActionButtonWithImage(
                  imagePath: 'assets/2.png',
                  label: 'G. Generator',
                  isTablet: isTablet,
                ),
                _buildActionButtonWithImage(
                  imagePath: 'assets/3.png',
                  label: 'Plant Summary',
                  isTablet: isTablet,
                ),
                _buildActionButtonWithImage(
                  imagePath: 'assets/4.png',
                  label: 'Natural Gas',
                  isTablet: isTablet,
                ),
                _buildActionButtonWithImage(
                  imagePath: 'assets/2.png',
                  label: 'D. Generator',
                  isTablet: isTablet,
                ),
                _buildActionButtonWithImage(
                  imagePath: 'assets/6.png',
                  label: 'Water Process',
                  isTablet: isTablet,
                ),
              ],
            ),
          ),

          SizedBox(height: isTablet ? 12 : 10),
        ],
      ),
    );
  }

  // ===== WIDGET #3: SINGLE CHILD SCROLL VIEW (SCROLLABLE CONTENT) =====
  Widget _buildSummaryTab(bool isTablet, double horizontalPadding) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Column(
        children: [
          // ===== ELECTRICITY SECTION =====
          Column(
            children: [
              Text(
                'Electricity',
                style: TextStyle(
                  fontSize: isTablet ? 14 : 13,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Divider(thickness: 1, color: Colors.grey[300]),

              // Circular Progress Chart
              SizedBox(
                width: isTablet ? 200 : 140,
                height: isTablet ? 200 : 140,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: Size(isTablet ? 200 : 160, isTablet ? 200 : 160),
                      painter: CircularProgressPainter(
                        progress: 0.65,
                        backgroundColor: AppColors.lightBlue.withOpacity(0.3),
                        progressColor: AppColors.primary,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Total Power',
                          style: TextStyle(
                            fontSize: isTablet ? 14 : 12,
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '5.53 kw',
                          style: TextStyle(
                            fontSize: isTablet ? 24 : 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: isTablet ? 20 : 10),

              // Source/Load Toggle with Capsule Shape
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.all(0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSourceSelected = true;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: isTablet ? 10 : 9,
                          ),
                          decoration: BoxDecoration(
                            color: _isSourceSelected
                                ? AppColors.primary
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Source',
                            style: TextStyle(
                              fontSize: isTablet ? 14 : 13,
                              fontWeight: FontWeight.w600,
                              color: _isSourceSelected
                                  ? Colors.white
                                  : AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSourceSelected = false;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: isTablet ? 10 : 9,
                          ),
                          decoration: BoxDecoration(
                            color: !_isSourceSelected
                                ? AppColors.primary
                                : Colors.transparent,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Load',
                            style: TextStyle(
                              fontSize: isTablet ? 14 : 13,
                              fontWeight: FontWeight.w600,
                              color: !_isSourceSelected
                                  ? Colors.white
                                  : AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Divider(thickness: 1, color: Colors.grey[300]),

          // ===== WIDGET #4: DATA VIEW CARDS =====
          _buildDataViewCard(
            icon: null,
            imagePath: 'assets/solar.png',
            title: 'Data View',
            data1: '55505.63',
            data2: '58805.63',
            status: 'Active',
            statusColor: Colors.blue,
            iconColor: AppColors.blue,
            isTablet: isTablet,
          ),

          SizedBox(height: isTablet ? 10 : 4),

          _buildDataViewCard(
            icon: null,
            imagePath: 'assets/tawer.png',
            title: 'Data Type 2',
            data1: '55505.63',
            data2: '58805.63',
            status: 'Active',
            statusColor: Colors.blue,
            iconColor: AppColors.orange,
            isTablet: isTablet,
          ),

          SizedBox(height: isTablet ? 10 : 4),

          _buildDataViewCard(
            icon: null,
            imagePath: 'assets/Batery.png',
            title: 'Data Type 3',
            data1: '55505.63',
            data2: '58805.63',
            status: 'Inactive',
            statusColor: Colors.red,
            iconColor: AppColors.cyan,
            isTablet: isTablet,
          ),
        ],
      ),
    );
  }

  // ===== BUILD DATA VIEW CARD WIDGET (FIXED) =====
  Widget _buildDataViewCard({
    IconData? icon,
    required String title,
    required String data1,
    required String data2,
    required String status,
    required Color statusColor,
    required Color iconColor,
    required bool isTablet,
    String? imagePath,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFE6F5FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon Container
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(6),
            child: imagePath != null
                ? Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  )
                : Icon(
                    icon,
                    color: iconColor,
                    size: 24,
                  ),
          ),
          const SizedBox(width: 12),

          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: isTablet ? 14 : 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: statusColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  'Data 1 : $data1',
                  style: TextStyle(
                    fontSize: isTablet ? 12 : 11,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'Data 2 : $data2',
                  style: TextStyle(
                    fontSize: isTablet ? 12 : 11,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Chevron Arrow
          Icon(
            Icons.chevron_right,
            color: AppColors.textSecondary.withOpacity(0.5),
            size: 20,
          ),
        ],
      ),
    );
  }

  // ===== BUILD ACTION BUTTON WITH IMAGE =====
  Widget _buildActionButtonWithImage({
    required String imagePath,
    required String label,
    required bool isTablet,
  }) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$label tapped')),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.08),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey.withOpacity(0.15),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: isTablet ? 32 : 28,
              height: isTablet ? 32 : 28,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.image_not_supported,
                  size: isTablet ? 32 : 28,
                  color: Colors.grey,
                );
              },
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isTablet ? 12 : 11,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===== BUILD SLD TAB =====
  Widget _buildSLDTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.electrical_services,
            size: 64,
            color: AppColors.textHint,
          ),
          const SizedBox(height: 16),
          Text(
            'Single Line Diagram',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Coming Soon',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  // ===== BUILD DATA TAB =====
  Widget _buildDataTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.table_chart,
            size: 64,
            color: AppColors.textHint,
          ),
          const SizedBox(height: 16),
          Text(
            'Data View',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Coming Soon',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

// ===== CUSTOM PAINTER FOR CIRCULAR PROGRESS =====
class CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color backgroundColor;
  final Color progressColor;

  CircularProgressPainter({
    required this.progress,
    required this.backgroundColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final strokeWidth = 20.0;

    // Background circle
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius - strokeWidth / 2, backgroundPaint);

    // Progress circle
    final progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final startAngle = -math.pi / 2;
    final sweepAngle = 2 * math.pi * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
