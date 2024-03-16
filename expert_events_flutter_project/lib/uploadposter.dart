
import 'dart:io';
import 'events.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/mytextfield.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final TextEditingController descriptionController = TextEditingController();
final TextEditingController dateController = TextEditingController();
final TextEditingController timeController = TextEditingController();
final TextEditingController locationController = TextEditingController();



class UploadPoster extends StatefulWidget {
  @override
  _UploadPoster createState() => _UploadPoster();
}

class _UploadPoster extends State<UploadPoster> {
  File? _imageFile;
  Future<void> _pickImage(ImageSource source) async {
  final picker = ImagePicker();
  final pickedImage = await picker.pickImage(source: source);

  setState(() {
    if (pickedImage != null) {
      _imageFile = File(pickedImage.path);
      _uploadImageToFirebase();
    } else {
      print('No image selected.');
    }
  });
}

Future<void> _uploadImageToFirebase() async {
  if (_imageFile == null) return;

  try {
    
    final firebase_storage.Reference storageRef = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('images') 
        .child('image_${DateTime.now()}.jpg'); 

    
    await storageRef.putFile(_imageFile!);

    // Get the download URL of the uploaded image
    final String downloadURL = await storageRef.getDownloadURL();

    await DatabaseService(uid).updateEventData(
      descriptionController.text,
      dateController.text,
      timeController.text,
      locationController.text,
      downloadURL, // Image URL
    );


  
    print('Image uploaded to Firebase Storage: $downloadURL');
  } catch (e) {
    print('Error uploading image to Firebase Storage: $e');
  }
}

Widget _buildUploadButton() {
  return ElevatedButton(
    onPressed: () => _pickImage(ImageSource.gallery),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [ 
        Icon(Icons.upload),
        SizedBox(width: 8,), 
        Text("Upload Poster"),
        ],
        ),
  );
}

Widget _buildSelectedImage() {
  return GestureDetector(
    onTap: () {
      _pickImage(ImageSource.gallery);
    },
    child: Container(
      height: 300,
      width: double.infinity,
      child: Image.file(_imageFile!),
    ),
  );
}

Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.close,
          size: 20,
          color: Colors.black,
        )
      ),
      centerTitle: true,
      title: Text('Create an Event'),
    ),
    body: SingleChildScrollView(
      
        
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _imageFile == null ? _buildUploadButton() : _buildSelectedImage(),
            SizedBox(
              height: 15
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
                child: MyTextField(
                controller: descriptionController, 
                hintText: 'Event Description', 
                obscureText: false
              ),
            ),

            SizedBox(
              height: 15
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: MyTextField(
                controller: dateController, 
                hintText: 'Event Date', 
                obscureText: false,
              ),
            ),
            SizedBox(
              height: 15
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: MyTextField(
                controller: timeController, 
                hintText: 'Event Time', 
                obscureText: false,
              ),
            ),
            
            SizedBox(
              height: 15
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: MyTextField(
                controller: locationController, 
                hintText: 'Event Location', 
                obscureText: false,
              ),
            ),
            SizedBox(
              height: 15
            ),
        ],
      ),
    ),
  );
}
}