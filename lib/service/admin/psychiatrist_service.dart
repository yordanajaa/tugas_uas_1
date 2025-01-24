import '../../models/admin/psychiatrist_model.dart';


class PsychiatristService {
  static final List<Psychiatrist> psychiatrists = [];

  static void addPsychiatrist(Psychiatrist psychiatrist) {
    psychiatrists.add(psychiatrist);
  }
}
