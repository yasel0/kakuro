import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter/services.dart';
import 'square_tile.dart';
import 'package:google_sign_in/google_sign_in.dart';



class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}



class _SettingsPageState extends State<SettingsPage> {
  TextEditingController _usernameController = TextEditingController();
  int _rating = 0;
  String _comment = '';
  bool _isExpanded = false;
  bool _isExpanded2 = false;
  bool _isDarkModeEnabled = false;
  final _commentController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  //image
  File? _imageFile;
  //mic
  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = '';



  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _loadUsername();
    _loadUsername();
    _loadImage();
    startSpeechRecognition();
  }

  void dispose() {
    _saveImage();
    super.dispose();
  }

  Future<void> _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username') ?? '';
    setState(() {
      _usernameController.text = username;
    });
  }

  Future<void> _saveUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
  }


//choisir image
  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      final directory = await getApplicationDocumentsDirectory();
      final imagePath = 'assets/avatar.png';

      final imageFile = File(pickedImage.path);
      await imageFile.copy(imagePath);

      setState(() {
        _imageFile = imageFile;
      });

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('imagePath', imagePath);
    }
  }


//sauvegarder l'image
  Future<void> _saveImage() async {
    if (_imageFile != null) {
      try {
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = 'assets/avatar.png';

        await _imageFile!.copy(imagePath);
        print('Image saved successfully: $imagePath');
      } catch (e) {
        print('Failed to save image: $e');
      }
    }
  }

//

  bool _isImageLoaded = false;

  Future<void> _loadImage() async {
    if (!_isImageLoaded) {
      final prefs = await SharedPreferences.getInstance();
      final imagePath = prefs.getString('imagePath');

      if (imagePath != null) {
        setState(() {
          _imageFile = File(imagePath);
          _isImageLoaded = true;
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    var _commentController;
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Color(0XFFECFFB6),
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 60,
            ),
            GestureDetector(
              onTap: _pickImageFromGallery,
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image:  _imageFile != null
                        ? FileImage(_imageFile!)
                        : AssetImage('assets/avatar.png') as ImageProvider,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            MaterialButton(onPressed: (){
              _googleSignIn.signIn().then((value) {
                String userName = value!.displayName!;
                String profilePicture = value!.photoUrl!;});
              }),
              SizedBox(height: 20),
              Text(
              'Username',
              style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20

              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: "Enter your username",
                    ),
                    onChanged: _saveUsername,
                  ),
                ),

              ],
            ),



            SwitchListTile(
              title: Text('Activate Dark Mode'),
              value: _isDarkModeEnabled,
              onChanged: (value) {
                setState(() {
                  _isDarkModeEnabled = value;
                });
              },
              secondary: _isDarkModeEnabled
                  ? Icon(Icons.nightlight_round, color: Colors.white)
                  : Icon(Icons.wb_sunny, color: Colors.yellow),
              subtitle: _isDarkModeEnabled
                  ? Text('Dark Mode Enabled')
                  : Text('Dark Mode Disabled'),
            ),

            SizedBox(height:20),
            DropdownButtonHideUnderline(
              child: _isExpanded
                  ? Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(
                          "Nous sommes un groupe de développeurs en filière ICy à l'INSA "),
                      onTap: () {
                        setState(() {
                          _isExpanded = false;
                        });
                      },
                    ),
                  ],
                ),
              )
                  : Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Row(
                      children: [
                        Text(
                          _isExpanded
                              ? "Nous sommes un groupe de développeurs en filière ICy à l'INSA "
                              : 'About us',
                          style: TextStyle(fontSize: 16),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 2),
            DropdownButtonHideUnderline(
              child: _isExpanded2
                  ? Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text("contact@gmail.com "),
                      onTap: () {
                        setState(() {
                          _isExpanded2 = false;
                        });
                      },
                    ),
                  ],
                ),
              )
                  : Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _isExpanded2 = !_isExpanded2;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Row(
                      children: [
                        Text(
                          _isExpanded2
                              ? "contact@gmail.com"
                              : 'Contact us',
                          style: TextStyle(fontSize: 16),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStarButton(1),
                _buildStarButton(2),
                _buildStarButton(3),
                _buildStarButton(4),
                _buildStarButton(5),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter your comment (optional):',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                hintText: 'Type your comment here',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _sendFeedback();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange, // Replace with the desired background color
              ),
              child: const Text('Send Feedback'),
            ),
          ],
        ),
      ),
    );

  }

  Widget _buildStarButton(int value) {
    return IconButton(
      onPressed: () {
        setState(() {
          _rating = value;
        });
      },
      icon: Icon(
        _rating >= value ? Icons.star : Icons.star_border,
        color: Colors.amber,
      ),
    );
  }
//envoyer le feedback

  void _sendFeedback() async {
    final Uri _emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'abdellahmagueri12@gmail.com',
        query: 'subject=Feedback&body=${_commentController.text.replaceAll(' ', '%20')}'
    );
    try {
      await launch(_emailLaunchUri.toString());
    } catch (e) {
      print(e.toString());
    };
  }
}


