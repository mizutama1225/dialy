import 'package:flutter/material.dart';
import 'main.dart';
import 'PasswordSetting2.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class IconImageSettingPage extends StatefulWidget {
  final String title;

  const IconImageSettingPage({
    Key? key,
    required this.title
  }) : super (key: key);

  @override
  _IconImageSettingPageState createState() => _IconImageSettingPageState();
}

class _IconImageSettingPageState extends State<IconImageSettingPage>{
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      this._image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: const Text('プロフィール画像変更'),
      ),
      body: Center(
          child: Column(
            children: [
              const SizedBox(
                height:30,
              ),

              Container(
                width:100,
                height:100,
                decoration: BoxDecoration(
                    shape:BoxShape.circle,
                    image:DecorationImage(
                        fit:BoxFit.fill,
                        image:( _image != null)? FileImage(_image!) : AssetImage('image/SNS_Icon.jpg')
                    )
                ),
              ),
              const SizedBox(
                height:30,
              ),
              const Text('新しいプロフィール画像を登録する'),
              const SizedBox(
                height:30,
              ),
              ElevatedButton.icon(
                onPressed: getImage,
                icon: const Icon(Icons.photo),
                label: const Text('ライブラリから写真を選択する'),
              ),
            ],
          )
      ),
    );
  }
}
