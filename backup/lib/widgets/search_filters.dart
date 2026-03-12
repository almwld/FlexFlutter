import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SearchFilters extends StatefulWidget {
  const SearchFilters({super.key});

  @override
  State<SearchFilters> createState() => _SearchFiltersState();
}

class _SearchFiltersState extends State<SearchFilters> {
  RangeValues _priceRange = const RangeValues(0, 1000000);
  String _selectedCity = 'صنعاء';
  final List<String> _cities = ['صنعاء', 'عدن', 'تعز', 'إب', 'حضرموت', 'مأرب'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: Text('تصفية النتائج', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          const SizedBox(height: 20),
          
          const Text('المدينة', style: TextStyle(fontWeight: FontWeight.bold)),
          Wrap(
            spacing: 8,
            children: _cities.map((city) => ChoiceChip(
              label: Text(city),
              selected: _selectedCity == city,
              selectedColor: AppTheme.goldColor,
              onSelected: (bool selected) {
                setState(() { if (selected) _selectedCity = city; });
              },
            )).toList(),
          ),
          
          const SizedBox(height: 20),
          const Text('نطاق السعر (ريال يمني)', style: TextStyle(fontWeight: FontWeight.bold)),
          RangeSlider(
            values: _priceRange,
            max: 5000000,
            divisions: 50,
            activeColor: AppTheme.goldColor,
            labels: RangeLabels('${_priceRange.start.round()}', '${_priceRange.end.round()}'),
            onChanged: (RangeValues values) { setState(() { _priceRange = values; }); },
          ),
          
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(backgroundColor: AppTheme.goldColor, foregroundColor: Colors.black),
              child: const Text('تطبيق الفلاتر', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
