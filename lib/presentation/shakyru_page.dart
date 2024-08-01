import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shaqyru_app/cubit/shakyru_cubit.dart';
import 'package:shaqyru_app/outline_button_widget.dart';
import 'package:shaqyru_app/presentation/dialog_window.dart';
import 'package:url_launcher/url_launcher.dart';

class ShakyruBuilder extends StatelessWidget {
  const ShakyruBuilder({
    Key? key,
    required this.guestName,
    required this.guestId,
  }) : super(key: key);

  final String guestName;
  final String guestId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShakyruCubit>(
      create: (_) => ShakyruCubit()..initCubit(guestName, guestId),
      child: const IntroPage(),
    );
  }
}

class IntroPage extends StatefulWidget {
  const IntroPage({
    Key? key,
  }) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late ShakyruCubit _cubit;
  bool _willBe = false;

  @override
  void didChangeDependencies() {
    _cubit = context.read<ShakyruCubit>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<ShakyruCubit, ShakyruState>(
        listener: (context, state) {
          if (state is ShakyruLoaded) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomDialog(
                  title: state.username,
                  message: 'Сіздің жауабыңыз қабылданды. Күніңіз жақсы өтсін!',
                );
              },
            );
          }
        },
        buildWhen: (_, current) => current is ShakyruCommonState,
        builder: (context, state) {
          if (state is ShakyruCommonState) {
            return Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Image.asset(
                    'assets/ic_background.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 350,
                      ),
                      Text(
                        'Құрметті ${state.userName}',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.andika(
                          fontSize: 70.sp,
                          color: const Color(0xFFE3C177),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Сіздерді, ',
                          style: GoogleFonts.andika(
                            fontSize: 40.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Тахмина бір жас',
                              style: GoogleFonts.andika(
                                fontSize: 40.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Қоныс тойымызға',
                        style: GoogleFonts.andika(
                          fontSize: 36.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Және де \n',
                          style: GoogleFonts.andika(
                            fontSize: 40.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Арайлым қызымыздың тіл ашу',
                              style: GoogleFonts.andika(
                                fontSize: 40.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const TextSpan(
                              text: '\nкешіне шақырамыз',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 120,
                          horizontal: 90.sp,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/ic_map_point.svg',
                                  color: const Color(0xFFE3C177),
                                  width: 40.sp,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  'Мекен жайы және Уақыты  ',
                                  style: TextStyle(
                                    fontSize: 38.sp,
                                    fontFamily: 'Inter',
                                    color: const Color(0xFFE3C177),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.sp,
                            ),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: 'Атырау қаласы, ',
                                style: GoogleFonts.roboto(
                                  fontSize: 32.sp,
                                  height: 1.6,
                                  color: const Color(0xFF413E37),
                                  fontWeight: FontWeight.w400,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Нұр Самал караоке-бары',
                                    style: GoogleFonts.roboto(
                                      fontSize: 32.sp,
                                      height: 1.6,
                                      color: const Color(0xFF413E37),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: '\n5 тамыз күні сағат',
                                  ),
                                  TextSpan(
                                    text: ' 19:30 да',
                                    style: GoogleFonts.roboto(
                                      fontSize: 32.sp,
                                      height: 1.6,
                                      color: const Color(0xFF413E37),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            AppOutlineButtonWidget(
                              onTap: _launchUrl,
                              borderRadiusRadii: 12,
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    'assets/ic_2gis.svg',
                                    color: const Color(0xFFE3C177),
                                    width: 40,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '2GIS ciлтемесi',
                                    style: TextStyle(
                                      fontSize: 24.sp,
                                      color: const Color(0xFFE3C177),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 60.sp,
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right_outlined,
                                    color: const Color(0xFFE3C177),
                                    size: 40.sp,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      /*Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 40,
                          right: 20,
                          bottom: 100,
                        ),
                        child: CountdownTimer(
                          endTime: DateTime.parse('2023-08-05 19:30:00')
                              .millisecondsSinceEpoch,
                          textStyle: const TextStyle(
                            fontSize: 28,
                            color: Color(0xFF413E37),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter',
                          ),
                          widgetBuilder: (BuildContext context, snapshot) {
                            return Text(
                              '${snapshot?.days ?? 0} күн ${snapshot?.hours ?? 0}:${snapshot?.min ?? 0}:${snapshot?.sec ?? 0} сағат',
                              style: const TextStyle(
                                fontSize: 32,
                                color: Color(0xFF413E37),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Inter',
                              ),
                            );
                          },
                          endWidget: const Text(
                            '0:00:00 сағат',
                          ),
                        ),
                      ),*/
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 60,
                          horizontal: 40,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Келесiз бе?',
                              style: TextStyle(
                                fontSize: 32.sp,
                                color: const Color(0xff413E37),
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Inter',
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _willBe = true;
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Radio<bool>(
                                    value: true,
                                    fillColor: MaterialStateColor.resolveWith(
                                      (states) => const Color(0xFFF1CBDA),
                                    ),
                                    activeColor: const Color(0xFFF1CBDA),
                                    groupValue: _willBe,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _willBe = value ?? false;
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    'Келемін',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: _willBe
                                          ? const Color(0xff413E37)
                                          : const Color(0xff726F69),
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _willBe = false;
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Radio<bool>(
                                    value: false,
                                    fillColor: MaterialStateColor.resolveWith(
                                      (states) => const Color(0xFFF1CBDA),
                                    ),
                                    activeColor: const Color(0xFFF1CBDA),
                                    groupValue: _willBe,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _willBe = value ?? false;
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    'Келе алмаймын',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: _willBe
                                          ? const Color(0xff413E37)
                                          : const Color(0xff726F69),
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            ElevatedButton(
                              onPressed: () => _cubit.saveUser(_willBe),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 30,
                                ),
                                backgroundColor: const Color(0xFFE3C177),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                'Жауап беру',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  void _launchUrl() async {
    Uri uri = Uri.parse('https://go.2gis.com/271rz');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch';
    }
  }
}
