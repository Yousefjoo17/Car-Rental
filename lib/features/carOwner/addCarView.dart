import 'package:carrental/core/DB/DBVeihcle.dart';
import 'package:carrental/core/methods/show_snack_bar.dart';
import 'package:carrental/core/models/veihcle.dart';
import 'package:carrental/core/widgets/Custom_button.dart';
import 'package:carrental/core/widgets/Custom_text_field.dart';
import 'package:carrental/main.dart';
import 'package:flutter/material.dart';

class AddCarView extends StatefulWidget {
  const AddCarView({super.key});

  @override
  State<AddCarView> createState() => _AddCarViewState();
}

class _AddCarViewState extends State<AddCarView> {
  Vehicle? vehicle =
      Vehicle(ownerID: currCarOwner!.ownerID, availability: 1, noKM: 0);
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  " Insert a Car",
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  hinttext: "model",
                  onchanged: (p0) {
                    vehicle!.model = p0;
                  },
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  hinttext: "year",
                  onchanged: (p0) {
                    vehicle!.year = p0;
                  },
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  hinttext: "Color",
                  onchanged: (p0) {
                    vehicle!.color = p0;
                  },
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  hinttext: "price for rent",
                  onchanged: (p0) {
                    vehicle!.priceToRent = int.tryParse(p0);
                  },
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  hinttext: "Current city",
                  onchanged: (p0) {
                    vehicle!.currentCity = p0;
                  },
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  hinttext: "registeration info",
                  onchanged: (p0) {
                    vehicle!.registrationInformation = p0;
                  },
                ),
                const SizedBox(height: 30),
                CustomButton(
                  text: "add",
                  ontap: () async {
                    if (formkey.currentState!.validate()) {
                      showmySnackBar(context, "inserted succeffully ");
                      Navigator.pop(context);
                      await DBVehicle.insertVehicle(vehicle!);
                      await DBVehicle.printAllVehiclesInfo();
                    }
                  },
                  color: Colors.black,
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
