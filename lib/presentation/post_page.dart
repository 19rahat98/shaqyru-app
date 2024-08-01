import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shaqyru_app/extantions/string_convert.dart';
import 'package:url_launcher/url_launcher.dart';

class PostPage extends StatefulWidget {
  const PostPage({
    super.key,
  });

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F3ED),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/ic_oiy2.svg',
              fit: BoxFit.fill,
              width: 150,
              height: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Шақыру билеті',
                    style: TextStyle(
                      fontSize: 44,
                      color: Color(0xFFC99C2A),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Қонақтың есімі',
                        border: InputBorder.none,
                        counterText: '',
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        suffixIcon: IconButton(
                          onPressed: buildInvite,
                          splashRadius: 50,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(
                            minHeight: 50,
                            minWidth: 50,
                          ),
                          icon: SvgPicture.asset(
                            'assets/ic_whatsapp.svg'
                          ),
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 20,
                        height: 1.6,
                        color: Color(0xFF413E37),
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    '\n1. Шақырғыңыз келеген адамның есімін енгізіңіз, \n2. Жасыл ВАТСАПТЫҢ кнопкасына басыңыз. \n3 Қонағыңызды тандап "Далее" кнопкасына басыңыз \nң. Cообщение эраны ашылады, жіберу үшін көк "Отпр." батырмаға басыңыз \n\n Әр қонаққа жасап шығу керек',
                    style: TextStyle(
                      fontSize: 20,
                      height: 1.6,
                      color: Color(0xFF413E37),
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    '5 тамыз сағат 19:30 да',
                    style: TextStyle(
                      fontSize: 25,
                      height: 1.6,
                      color: Color(0xFF413E37),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> buildInvite() async {
    final userId = encryptToInt(_controller.text);
    final textValue =
        'Құрметті *${_controller.text}!* Сіздерді 5 тамыз күні сағат 19:30де кешімізге шақырамыз. Мекен жайы - _Атырау қаласы, Нұр Самал караоке-бары_ Сілтемеден өтіп өз пікіріңізді қалдырыңыз https://shaqyru-app.web.app/shakyru?id=${userId}';
    String url = 'https://wa.me/?text=${Uri.encodeFull(textValue)}';
    Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch';
    }
  }
}
