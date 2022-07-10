import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup_screen/controller/updateController.dart';

class UpdateItem extends StatelessWidget {
  UpdateItem({Key? key}) : super(key: key);
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemtypeController = TextEditingController();
  TextEditingController itemimageController = TextEditingController();
  TextEditingController itemshelfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String dropdownvalue = 'Top Left';

    // List of items in our dropdown menu
    var items = [
      'Top Left',
      'Top Right',
      'Middle Left',
      'Middle Right',
      'Bottom Left',
      'Bottom Right',
    ];

    UpdateController _controller = Get.put(UpdateController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Item"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  controller: itemNameController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'empty cell ';
                    }
                    return null;
                  },
                  onChanged: (v) {
                    _controller.nameItem.value = v;
                    print(v);
                  },
                  decoration: InputDecoration(
                    labelText: "Enter Name of Item",
                    prefixIcon: Icon(
                      Icons.person_outline_rounded,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),

              SizedBox(
                height: 20,
              ),
               TextFormField(
                  controller: itemtypeController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'empty cell ';
                    }
                    return null;
                  },
                  onChanged: (v) {
                    _controller.type.value = v;
                    print(_controller.type.value);
                  },
                  decoration: InputDecoration(
                    labelText: "Enter type of Item",
                    prefixIcon: Icon(
                      Icons.merge_type_rounded,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),

               ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                    controller: itemimageController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'empty cell ';
                      }
                      return null;
                    },
                    onChanged: (v) {
                      _controller.image.value = v;
                      print(v);
                    },
                    decoration: InputDecoration(
                      labelText: "Enter image url  of Item",
                      prefixIcon: Icon(
                        Icons.image,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Text("Location",style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                  DropdownButton(

                    // Initial Value
                    value: dropdownvalue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                        dropdownvalue = newValue!;
                        _controller.shelf.value=newValue;
                        print(newValue);


                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  _controller.sendData();
                },
                child: Text(
                  "Update",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.indigo,
              )
            ],
          ),
        ),
      ),
    );
  }
}
