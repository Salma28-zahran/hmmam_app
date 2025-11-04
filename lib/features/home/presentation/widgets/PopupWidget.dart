import 'package:flutter/material.dart';
import 'package:hmmam_app/features/home/presentation/views/wheelchair_detail.dart';
import 'package:hmmam_app/features/home/presentation/widgets/wheelchair_detail_args.dart';
import '../../../../core/route/routes.dart';

class PopupWidget extends StatefulWidget {
  const PopupWidget({super.key});

  @override
  State<PopupWidget> createState() => _PopupWidgetState();
}

class _PopupWidgetState extends State<PopupWidget> {
  bool showRecent = true;
  String searchQuery = "";

  final List<Map<String, String>> allCities = [
    {'city': 'Jakarta', 'country': 'Indonesia', 'airport': 'All airports in Jakarta'},
    {'city': 'Tokyo', 'country': 'Japan', 'airport': 'All airports in Tokyo'},
    {'city': 'Singapore', 'country': 'Singapore', 'airport': 'All airports in Singapore'},
    {'city': 'Bali / Denpasar', 'country': 'Indonesia', 'airport': 'Ngurah Rai International Airport'},
    {'city': 'Surabaya', 'country': 'Indonesia', 'airport': 'Juanda International Airport'},
    {'city': 'Medan', 'country': 'Indonesia', 'airport': 'Kualanamu International Airport'},
    {'city': 'Yogyakarta', 'country': 'Indonesia', 'airport': 'Adisutjipto International Airport'},
    {'city': 'Korea', 'country': 'South Korea', 'airport': 'All airports in Korea'},
    {'city': 'Manila', 'country': 'Philippines', 'airport': 'Ninoy Aquino International Airport'},
    {'city': 'Bangkok', 'country': 'Thailand', 'airport': 'Suvarnabhumi Airport'},
  ];

  void _goToDetail({
    required String cityName,
    required String airport,
    required String terminalGate,
    required String date,
    required String time,
    required String passengerName,
    required String wheelchairType,
    required String seatType,
    required String totalPrice,
  }) {
    Navigator.pop(context); // 👈 نقفل الـ popup الأول

    Navigator.pushNamed(
      context,
      PageRouteName.details,
      arguments: WheelchairDetailArgs(
        cityName: cityName,
        airport: airport,
        terminalGate: terminalGate,
        date: date,
        time: time,
        passengerName: passengerName,
        wheelchairType: wheelchairType,
        seatType: seatType,
        totalPrice: totalPrice,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> filteredCities = allCities
        .where((city) => city['city']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.9,
      minChildSize: 0.6,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ===== الخط الرمادي =====
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(top: 8, bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                // ===== العنوان و زر الإغلاق =====
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Select a City or Airport",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // ===== مربع البحث =====
                TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                      showRecent = value.isEmpty;
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search city or airport',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                // ===== نتائج البحث =====
                if (searchQuery.isNotEmpty) ...[
                  if (filteredCities.isEmpty)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "No results found",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    )
                  else
                    ...filteredCities.map(
                          (city) => InkWell(
                        onTap: () => _goToDetail(
                          cityName: city['city']!,
                          airport: city['airport']!,
                          terminalGate: 'Terminal 3 - Gate A',
                          date: 'Monday, 10 May 2023',
                          time: '08:00 am',
                          passengerName: 'Ahmed',
                          wheelchairType: 'Foldable',
                          seatType: 'Wide seat',
                          totalPrice: 'Rp920.000',
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${city['city']}, ${city['country']}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                city['airport']!,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 13,
                                ),
                              ),
                              const Divider(thickness: 1, color: Color(0xFFE0E0E0)),
                            ],
                          ),
                        ),
                      ),
                    ),
                ] else ...[
                  if (showRecent) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Recent Searches',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showRecent = false;
                            });
                          },
                          child: const Text(
                            'Clear',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    InkWell(
                      onTap: () => _goToDetail(
                        cityName: 'Jakarta',
                        airport: 'All airports in Jakarta',
                        terminalGate: 'Terminal 3 - Gate A',
                        date: 'Monday, 10 May 2023',
                        time: '08:00 am',
                        passengerName: 'Ahmed',
                        wheelchairType: 'Foldable',
                        seatType: 'Wide seat',
                        totalPrice: 'Rp920.000',
                      ),
                      child: const _RecentItem(
                        title: 'Jakarta, Indonesia',
                        subtitle: 'All airports in Jakarta',
                      ),
                    ),
                    const _DividerLine(),
                    InkWell(
                      onTap: () => _goToDetail(
                        cityName: 'Tokyo',
                        airport: 'All airports in Tokyo',
                        terminalGate: 'Terminal 2 - Gate B',
                        date: 'Tuesday, 11 May 2023',
                        time: '09:30 am',
                        passengerName: 'Sara',
                        wheelchairType: 'Electric',
                        seatType: 'Compact seat',
                        totalPrice: '¥12,000',
                      ),
                      child: const _RecentItem(
                        title: 'Tokyo, Japan',
                        subtitle: 'All airports in Tokyo',
                      ),
                    ),
                    const _DividerLine(),
                    InkWell(
                      onTap: () => _goToDetail(
                        cityName: 'Singapore',
                        airport: 'All airports in Singapore',
                        terminalGate: 'Terminal 1 - Gate C',
                        date: 'Wednesday, 12 May 2023',
                        time: '10:45 am',
                        passengerName: 'Omar',
                        wheelchairType: 'Manual',
                        seatType: 'Wide seat',
                        totalPrice: 'S\$350.00',
                      ),
                      child: const _RecentItem(
                        title: 'Singapore, Singapore',
                        subtitle: 'All airports in Singapore',
                      ),
                    ),
                    const SizedBox(height: 25),
                  ],

                  const Text(
                    'Popular Destinations',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final city in [
                        'Jakarta',
                        'Surabaya',
                        'Medan',
                        'Yogyakarta',
                        'Denpasar - Bali',
                        'Singapore',
                        'Tokyo',
                        'Korea',
                        'Manila',
                        'Bangkok',
                      ])
                        GestureDetector(
                          onTap: () => _goToDetail(
                            cityName: city,
                            airport: 'Main Airport of $city',
                            terminalGate: 'Terminal 1 - Gate A',
                            date: 'Thursday, 13 May 2023',
                            time: '11:00 am',
                            passengerName: 'Guest',
                            wheelchairType: 'Foldable',
                            seatType: 'Wide seat',
                            totalPrice: '\$1000',
                          ),
                          child: _ChipItem(city),
                        ),
                    ],
                  ),
                  const SizedBox(height: 50),
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}

class _RecentItem extends StatelessWidget {
  final String title;
  final String subtitle;
  const _RecentItem({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
          const SizedBox(height: 4),
          Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
        ],
      ),
    );
  }
}

class _DividerLine extends StatelessWidget {
  const _DividerLine();
  @override
  Widget build(BuildContext context) {
    return Divider(color: Colors.grey[300], thickness: 1);
  }
}

class _ChipItem extends StatelessWidget {
  final String label;
  const _ChipItem(this.label);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.grey[200],
      labelStyle: const TextStyle(fontWeight: FontWeight.w500),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}
