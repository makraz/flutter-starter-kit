import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widget/text_field.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _disabledController = TextEditingController();
  final TextEditingController _readonlyController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('TextField Demo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldWidget(
              controller: _nameController,
              hintText: "Enter your name",
              labelText: "Name",
              textFieldType: TextFieldType.outlined,
            ),
            const SizedBox(height: 16),
            TextFieldWidget(
              controller: _emailController,
              hintText: "Enter your email",
              labelText: "Email",
              prefixIcon: const Icon(Icons.email),
              textFieldType: TextFieldType.filled,
            ),
            const SizedBox(height: 16),

            TextFieldWidget(
              controller: _searchController,
              hintText: "Search here",
              labelText: "Search",
              suffixIcon: const Icon(Icons.search),
              textFieldType: TextFieldType.underlined,
            ),
            const SizedBox(height: 16),
            TextFieldWidget(
              controller: _passwordController,
              hintText: "Enter your password",
              labelText: "Password",
              prefixIcon: const Icon(Icons.lock),
              textFieldType: TextFieldType.outlined,
              obscureText: true,
            ),
            const SizedBox(height: 16),

            TextFieldWidget(
              controller: _addressController,
              hintText: "Enter your address",
              labelText: "Address",
              textFieldType: TextFieldType.filled,
              maxLines: 5,
            ),
            const SizedBox(height: 16),

            TextFieldWidget(
              controller: _phoneNumberController,
              hintText: "Enter a number",
              labelText: "Numeric Input",
              textFieldType: TextFieldType.underlined,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],

            ),
            const SizedBox(height: 16),
            TextFieldWidget(
              controller: _disabledController,
              hintText: "This field is disabled",
              labelText: "Disabled",
              textFieldType: TextFieldType.outlined,
              enabled: false,
            ),
            const SizedBox(height: 16),
            TextFieldWidget(
              controller: _readonlyController..text = "Read-only content",
              hintText: "This field is read-only",
              labelText: "Read-Only",
              textFieldType: TextFieldType.outlined,
              readOnly: true,
            ),
            const SizedBox(height: 16),

            TextFieldWidget(
              controller: _commentsController,
              hintText: "Enter your comments",
              labelText: "Comments",
              textFieldType: TextFieldType.filled,
              maxLines: 3,
            ),
            const SizedBox(height: 16),
           TextFieldWidget(
              controller: _feedbackController,
              hintText: "Custom styled input",
              textFieldType: TextFieldType.outlined,
              backgroundColor: Colors.grey,
              borderColor: Colors.blue,
              focusedBorderColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
