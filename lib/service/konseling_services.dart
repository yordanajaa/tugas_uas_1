import '../models/konseling_model.dart';

class KonselingService {
  static List<KonselingModel> fetchKonselingData() {
    return [
      KonselingModel(
        id: '1',
        name: 'Dr. Iqbal',
        image: 'images/d1.jpg',
        availableTime: '10.00 - 12.00',
      ),
      KonselingModel(
        id: '2',
        name: 'Dr. Abdul',
        image: 'images/d1.jpg',
        availableTime: '10.00 - 12.00',
      ),
      KonselingModel(
        id: '3',
        name: 'Dr. Aziz',
        image: 'images/d1.jpg',
        availableTime: '10.00 - 12.00',
      ),
      KonselingModel(
        id: '4',
        name: 'Dr. Fiko',
        image: 'images/d1.jpg',
        availableTime: '10.00 - 12.00',
      ),
      KonselingModel(
        id: '5',
        name: 'Dr. Yordan',
        image: 'images/d1.jpg',
        availableTime: '10.00 - 12.00',
      ),
    ];
  }
}
