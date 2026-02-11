import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../widgets/actions/bla_button.dart';
import '../../../data/dummy_data.dart';
import '../../../model/ride/locations.dart';

class RideSearchScreen extends StatefulWidget {
  const RideSearchScreen({super.key});

  @override
  State<RideSearchScreen> createState() => _RideSearchScreenState();
}

class _RideSearchScreenState extends State<RideSearchScreen> {
  Location? fromLocation;
  Location? toLocation;
  DateTime selectedDate = DateTime.now();
  int numberOfPeople = 1;

  Future<void> _pickLocation(bool isFrom) async {
    final picked = await showDialog<Location>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isFrom ? 'From' : 'To'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: fakeLocations.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(fakeLocations[index].name),
              onTap: () => Navigator.pop(context, fakeLocations[index]),
            ),
          ),
        ),
      ),
    );

    if (picked != null) {
      setState(() {
        if (isFrom) {
          fromLocation = picked;
        } else {
          toLocation = picked;
        }
      });
    }
  }

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _swapLocations() {
    setState(() {
      final temp = fromLocation;
      fromLocation = toLocation;
      toLocation = temp;
    });
  }

  bool _canSearch() {
    return fromLocation != null && toLocation != null;
  }

  Widget _field(IconData icon, String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey),
            const SizedBox(width: 16),
            Text(text, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Ride')),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _field(
                  Icons.circle_outlined,
                  fromLocation?.name ?? 'From',
                  () => _pickLocation(true),
                ),
                const Divider(height: 1),
                Stack(
                  children: [
                    _field(
                      Icons.circle_outlined,
                      toLocation?.name ?? 'To',
                      () => _pickLocation(false),
                    ),
                    Positioned(
                      right: 8,
                      top: 0,
                      bottom: 0,
                      child: IconButton(
                        icon: const Icon(Icons.swap_vert),
                        onPressed: _swapLocations,
                      ),
                    ),
                  ],
                ),
                const Divider(height: 1),
                _field(
                  Icons.calendar_today,
                  DateFormat('MMM dd, yyyy').format(selectedDate),
                  _selectDate,
                ),
                const Divider(height: 1),
                _field(Icons.person, '$numberOfPeople', () {
                  setState(() {
                    if (numberOfPeople < 8) {
                      numberOfPeople = numberOfPeople + 1;
                    } else {
                      numberOfPeople = 1;
                    }
                  });
                }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: BlaButton(
              label: 'Search',
              icon: Icons.search,
              onPressed: _canSearch()
                  ? () {
                      print('Search: $fromLocation → $toLocation');
                    }
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
