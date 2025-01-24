
import 'package:flutter/material.dart';
import '../../service/admin/counseling_service.dart';

class CounselingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EDULEARN'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Pilihlah bimbingan konselingmu sesuai yang kamu mau',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Tambah Konseling'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: CounselingService.availableCounselors.length,
              itemBuilder: (context, index) {
                final counselor = CounselingService.availableCounselors[index];
                return Card(
                  child: ListTile(
                    title: Text(counselor['name']!),
                    subtitle: Text('Jam Kerja: ${counselor['hours']}'),
                    trailing: ElevatedButton(
                      onPressed: () {},
                      child: Text('Chat'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Konseling'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Learn'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User'),
        ],
      ),
    );
  }
}