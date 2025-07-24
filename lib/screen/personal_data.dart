import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PersonalData extends StatefulWidget {
  @override
  _PersonalDataState createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  final TextEditingController nameController = TextEditingController(
    text: "Albert Stevano Bajefski",
  );
  final TextEditingController dobController = TextEditingController(
    text: "19/06/1999",
  );
  final TextEditingController phoneController = TextEditingController(
    text: "+1 325-433-7656",
  );
  final TextEditingController emailController = TextEditingController(
    text: "Albertstevano@gmail.com",
  );
  String selectedGender = "Male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'text_appbar_Personal'.tr(),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 240, 238, 238),
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/person2.png"),
                ),
                Positioned(
                  bottom: 0,
                  right: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.camera_alt,
                      color: Color(0xffFE8C00),
                      size: 15,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            buildLabel('lable_name'.tr()),
            buildTextField(controller: nameController),
            buildLabel('lable_birth'.tr()),
            buildTextField(controller: dobController),
            buildLabel('lable_gender'.tr()),
            DropdownButtonFormField<String>(
              value: selectedGender,
              items: ["Male", "Female"]
                  .map(
                    (gender) =>
                        DropdownMenuItem(value: gender, child: Text(gender)),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedGender = value!;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 15,
                ),
              ),
            ),
            buildLabel('lable_phone'.tr()),
            buildTextField(controller: phoneController),
            buildLabel('lable_email_personal'.tr()),
            buildTextField(controller: emailController),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffFE8C00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'button_personal'.tr(),
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLabel(String label) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 16, bottom: 6),
      child: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }

  Widget buildTextField({required TextEditingController controller}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      ),
    );
  }
}
