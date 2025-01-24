import 'package:flutter/material.dart';
import '../../models/admin/psychiatrist_model.dart';
import '../../service/admin/psychiatrist_service.dart';


class AddPsychiatristScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _workingHoursController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Psikiater'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nama Lengkap'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama harus diisi';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'No Telp'),
                keyboardType: TextInputType.phone,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Alamat Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                controller: _genderController,
                decoration: InputDecoration(labelText: 'Jenis Kelamin'),
              ),
              TextFormField(
                controller: _workingHoursController,
                decoration: InputDecoration(labelText: 'Jam Kerja'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newPsychiatrist = Psychiatrist(
                      name: _nameController.text,
                      phoneNumber: _phoneController.text,
                      email: _emailController.text,
                      gender: _genderController.text,
                      workingHours: _workingHoursController.text,
                      profilePhoto: '',
                    );
                    PsychiatristService.addPsychiatrist(newPsychiatrist);
                    Navigator.pop(context);
                  }
                },
                child: Text('Tambah Psikiater'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
