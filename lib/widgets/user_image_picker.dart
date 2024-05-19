import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UserImagePicker extends StatefulWidget{
  const UserImagePicker({super.key, required this.onPickImage});

  final void Function(File file) onPickImage;

  @override
  State<UserImagePicker> createState() {
    // TODO: implement createState
    return _UserImagePickerState();
  }

}

class _UserImagePickerState extends State<UserImagePicker>{
  File? _imageFile;
  

  void _selectImage() async{
    final imagePicker = ImagePicker();
    final pickImage = await imagePicker.pickImage(source: ImageSource.gallery, maxWidth: 200, imageQuality: 100);

    if(pickImage == null){
      return;
    }

    setState(() {
      
    _imageFile = File(pickImage.path);
    });

    widget.onPickImage(_imageFile!);


  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          foregroundImage: _imageFile != null ?  FileImage(_imageFile!) : null,
        ),
        
        TextButton.icon(onPressed: _selectImage, 
        icon: Icon(Icons.image),
        label: Text('Nhớ thêm ảnh!', style: TextStyle(color: Theme.of(context).colorScheme.primary,),),),
      ],
    );
  }

}