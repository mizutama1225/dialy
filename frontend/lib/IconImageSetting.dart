import 'dart:convert';
import 'dart:io';
import 'package:dialy/background.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'AccountSetting.dart';
import 'main.dart';

class IconImageSettingPage extends StatefulWidget {
  final String title;

  const IconImageSettingPage({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  _IconImageSettingPageState createState() => _IconImageSettingPageState();
}

class _IconImageSettingPageState extends State<IconImageSettingPage> {
  File? _image;
  final picker = ImagePicker();

  Future<void> getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      this._image = imageTemporary;
    });
  }

  Future<void> uploadImage() async {
    if (_image == null) return; // 画像が選択されていない場合は何もしない

    final uri = Uri.parse('http://localhost:80/profiles/${USERID}/');
    final request = http.MultipartRequest('PATCH', uri);

    // ヘッダーの設定
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
    });

    // 画像ファイルをリクエストに追加
    request.files.add(await http.MultipartFile.fromPath('icon', _image!.path));

    // リクエストの送信
    final response = await request.send();

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AccountSettingPage()),
      );
    } else {
      throw Exception('Failed to upload image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        childWidget: Center(
          child: Column(
            children: [
              const SizedBox(height: 90,),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: (_image != null) ? FileImage(_image!) : const AssetImage('image/SNS_Icon.jpg') as ImageProvider,
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              const Text('新しいプロフィール画像を登録する'),
              const SizedBox(height: 30,),
              ElevatedButton.icon(
                onPressed: getImage,
                icon: const Icon(Icons.photo),
                label: const Text('ライブラリから写真を選択する'),
              ),
              const SizedBox(height: 50,),
              ElevatedButton(
                onPressed: uploadImage, // 画像をアップロードする処理
                child: const Text('変更を保存する'),
              ),
              const SizedBox(height: 50,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountSettingPage()),
                  );
                },
                child: const Text('アカウント設定に戻る'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
