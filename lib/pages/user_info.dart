import 'package:flutter/material.dart';

class UserInfoPage extends StatefulWidget {
  final String userEmail;

  const UserInfoPage({Key? key, required this.userEmail}) : super(key: key);

  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  late TextEditingController _emailController;
  late TextEditingController _dobController;
  late TextEditingController _genderController;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: widget.userEmail);
    _dobController = TextEditingController();
    _genderController = TextEditingController();
    _selectedDate = DateTime.now();
  }

  String formatDate(DateTime date) {
    return '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Information'),
        backgroundColor: Colors.purple[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              readOnly: true,
              controller: _dobController,
              decoration: InputDecoration(
                labelText: 'Date of Birth',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null && pickedDate != _selectedDate) {
                      setState(() {
                        _selectedDate = pickedDate;
                        _dobController.text = formatDate(_selectedDate);
                      });
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _genderController,
              decoration: const InputDecoration(
                labelText: 'Gender',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Retrieve updated information
                String newEmail = _emailController.text.trim();
                String newGender = _genderController.text.trim();
                int age = DateTime.now().year - _selectedDate.year;

                // Update user profile using your logic
                // For example:
                // updateUserInfo(newEmail, _selectedDate, age, newGender);

                // Show a success message or navigate back
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Profile updated successfully')),
                );
              },
              child: Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _dobController.dispose();
    _genderController.dispose();
    super.dispose();
  }
}
