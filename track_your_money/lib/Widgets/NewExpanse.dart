import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:track_your_money/Models/Model_Expanse.dart';
import 'package:track_your_money/Widgets/GradientButton.dart';
import 'package:track_your_money/Widgets/TexfieldWithShadow.dart';

class NewExpanse extends StatefulWidget {
  const NewExpanse({required this.addExpanse, super.key});
  final void Function(
      String title, double amount, DateTime date, Category category) addExpanse;
  @override
  State<NewExpanse> createState() => _NewExpanseState();
}

class _NewExpanseState extends State<NewExpanse> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  var _selectedCategory = Category.food;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  DateTime? _selectedDate;

  void datePicker() async {
    int now = DateTime.now().year - 1;
    int end = DateTime.now().year + 2;
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(now),
      lastDate: DateTime(end),
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  String Formatter(DateTime date) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(date);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              TextFieldWithShadow("",
                  text: "Title", controller: _titleController),
              Spacer(),
              Text(_selectedDate == null
                  ? "no selected date"
                  : Formatter(_selectedDate!)),
              IconButton(
                  onPressed: datePicker,
                  icon: Icon(Icons.calendar_month_outlined))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              TextFieldWithShadow("\$",
                  text: "Amount", controller: _amountController),
              Spacer(),
              DropdownButton(
                alignment: Alignment.center,
                dropdownColor: Color.fromARGB(255, 239, 239, 239),
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          GradientButton(
              onPressed: () {
                widget.addExpanse(
                    _titleController.text,
                    double.tryParse(_amountController.text)!,
                    _selectedDate!,
                    _selectedCategory);
              },
              text: "Add")
        ],
      ),
    );
  }
}
