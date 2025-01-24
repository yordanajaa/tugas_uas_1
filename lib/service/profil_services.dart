import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

// Model untuk User
class User {
  final String name;
  final String profileImage;
  final String lastMood;
  final List<String> tags;
  final List<Note> notes;

  User({
    required this.name,
    required this.profileImage,
    required this.lastMood,
    required this.tags,
    required this.notes,
  });
}

// Model untuk Note
class Note {
  final String date;
  final String content;

  Note({
    required this.date,
    required this.content,
  });
}

class UserService {
  Future<User> getUserData() async {
    await Future.delayed(const Duration(seconds: 2));

    return User(
      name: "Berkah Yordan Santoso",
      profileImage: "assets/profile_image.png",
      lastMood: "Pekerjaan",
      tags: ["Pekerjaan", "Kesehatan", "Hubungan", "Kepuasan Hidup"],
      notes: [
        Note(date: "Rabu 23 Okt 24", content: "Lorem ipsum dolor sit amet..."),
        Note(date: "Selasa 22 Okt 24", content: "Consectetur adipiscing elit..."),
      ],
    );
  }

  // Simulate updating user data
  Future<void> updateUserProfile(User updatedUser) async {
    // Simulated delay
    await Future.delayed(const Duration(seconds: 1));

    // Log to console for demonstration purposes
    if (kDebugMode) {
      print("User updated: ${updatedUser.name}");
    }
  }
}
