import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sms/models/user.dart';
import 'package:sms/providers/user_provider.dart';
import '../theme/color.dart';

class UpdateUserScreen extends StatefulWidget {
  final User user;
  const UpdateUserScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();
  final _residenceController = TextEditingController();

  void _submitForm(userProvider) {
    if (_formKey.currentState!.validate()) {
      userProvider.updateUser(
        widget.user.id,
        _nameController.text,
        _emailController.text,
        int.parse(_ageController.text),
        _residenceController.text,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.user.name;
    _emailController.text = widget.user.email;
    _ageController.text = widget.user.age.toString();
    _residenceController.text = widget.user.residence;
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.tintedBg,
      appBar: AppBar(
        title: const Text('Update User'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                const Text(
                  "Name",
                  style: TextStyle(fontSize: 14, color: AppColors.tintedBlack),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  enabled: !userProvider.isFormLoading,
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: "John Doe",
                    hintStyle: const TextStyle(color: AppColors.mutedText),
                    filled: true,
                    fillColor: AppColors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty){
                      return 'Name is a required field.';
                    }return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  "Email address",
                  style: TextStyle(fontSize: 14, color: AppColors.tintedBlack),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  enabled: !userProvider.isFormLoading,
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Jamessup",
                    hintStyle: const TextStyle(color: AppColors.mutedText),
                    filled: true,
                    fillColor: AppColors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty){
                      return 'Email is a required field';
                    }if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),
                const Text(
                  "Age",
                  style: TextStyle(fontSize: 14, color: AppColors.tintedBlack),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  enabled: !userProvider.isFormLoading,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: _ageController,
                  decoration: InputDecoration(
                    hintText: "12",
                    hintStyle: const TextStyle(color: AppColors.mutedText),
                    filled: true,
                    fillColor: AppColors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty){
                      return 'Age is a required field.';
                    }return null;
                  },
                ),

                const SizedBox(height: 20),
                const Text(
                  "Residence",
                  style: TextStyle(fontSize: 14, color: AppColors.tintedBlack),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  enabled: !userProvider.isFormLoading,
                  controller: _residenceController,
                  decoration: InputDecoration(
                    hintText: "UAE",
                    hintStyle: const TextStyle(color: AppColors.mutedText),
                    filled: true,
                    fillColor: AppColors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty){
                      return 'Register is a required field.';
                    }return null;
                  },
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child:
                      userProvider.isFormLoading
                          ? const Center(child: CircularProgressIndicator())
                          : ElevatedButton(
                            onPressed: () => _submitForm(userProvider),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.tintedBlack,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              "Submit",
                              style: TextStyle(color: AppColors.white),
                            ),
                          ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
