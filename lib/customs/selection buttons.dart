import 'package:flutter/material.dart';

enum Gender { male, female, other }

class GenderSelection extends StatefulWidget {
  final ValueChanged<Gender> onGenderSelected;

  GenderSelection({required this.onGenderSelected});

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  Gender? selectedGender;

  void _selectGender(Gender gender) {
    setState(() {
      selectedGender = gender;
      widget.onGenderSelected(gender);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildGenderOption(Gender.male, 'Male'),
        _buildGenderOption(Gender.female, 'Female'),
        _buildGenderOption(Gender.other, 'Other'),
      ],
    );
  }

  Widget _buildGenderOption(Gender gender, String label) {
    return GestureDetector(
      onTap: () => _selectGender(gender),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: selectedGender == gender ? Colors.indigo : Colors.grey,
          border: Border.all(
            color: Colors.indigo,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: selectedGender == gender ? Colors.white: Colors.indigo,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
