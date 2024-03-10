import 'package:flutter/material.dart';
import 'package:learn_flutter/network/post/create_new_post.dart';

import '../enums/item_enums.dart';

class Addposts extends StatefulWidget {
  const Addposts({super.key});

  @override
  State<Addposts> createState() => _AddpostsState();
}

class _AddpostsState extends State<Addposts> {
  final _titlecontroller = TextEditingController();
  final _contentcontroller = TextEditingController();
  final _pricecontroller = TextEditingController();
  final _itemcontroller = TextEditingController();
  ItemTypes dropdownValue = ItemTypes.Rifle;

  void dropdownCallback(ItemTypes? selectedItem) {
    if (selectedItem != null) {
      setState(() {
        dropdownValue = selectedItem;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Creat New Listing"),
      content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _titlecontroller,
              decoration: InputDecoration(hintText: "Post Title"),
            ),
            TextField(
              controller: _contentcontroller,
              decoration: InputDecoration(hintText: "Post Discription"),
            ),
            TextField(
              controller: _pricecontroller,
              decoration: InputDecoration(hintText: "Enter price"),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(
              width: double.infinity,
              child: DropdownButton<ItemTypes>(
                value: dropdownValue,
                items: const [
                  DropdownMenuItem(
                    child: Text("Rifle"),
                    value: ItemTypes.Rifle,
                  ),
                  DropdownMenuItem(
                    child: Text("Pistol"),
                    value: ItemTypes.Pistol,
                  ),
                  DropdownMenuItem(
                    child: Text("Shotgun"),
                    value: ItemTypes.Shotgun,
                  ),
                  DropdownMenuItem(
                    child: Text("Ammo"),
                    value: ItemTypes.Ammo,
                  ),
                  DropdownMenuItem(
                    child: Text("Gear"),
                    value: ItemTypes.Gear,
                  ),
                  DropdownMenuItem(
                    child: Text("Other"),
                    value: ItemTypes.Other,
                  ),
                ],
                onChanged: (ItemTypes? newValue) {
                  dropdownCallback(
                      newValue); // Call dropdownCallback with the new value
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  final double? price = double.tryParse(_pricecontroller.text);
                  createPost(_titlecontroller.text, _contentcontroller.text,
                      price, dropdownValue);
                  Navigator.of(context).pop();
                },
                child: const Text("Create Listing"))
          ]),
    );
  }
}
