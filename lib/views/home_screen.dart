import 'package:flutter/material.dart';
import '../resources/widgets/custom_text_input.dart';
import '../resources/widgets/custom_text_line_button.dart';
import '../resources/widgets/information_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController? mathController, literatureController, englishController;
  String averageMarkStr = "Chưa xác định";
  String gradeStr = "Chưa xác định";

  @override
  void initState() {
    super.initState();
    mathController = TextEditingController();
    literatureController = TextEditingController();
    englishController = TextEditingController();
  }

  String getGrade({required double mark}) {
    if ((mark < 0) || (mark > 10)) return "Không hợp lệ";
    if (mark < 5) return "Chưa đạt";
    if (mark < 8.5) return "Đạt";
    return "Xuất sắc";
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var size1 = size.height / 100;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: SizedBox(
                width: size.width * 0.3,
                height: size.width * 0.8,
                //alignment: Alignment.topCenter, dua lenh nay vao ko fill duoc anh
                child: Image.asset('assets/images/Ellipse_1.png', fit: BoxFit.fill,),
              ),
            ),
            Positioned(
              top: 0,
              child: SizedBox(
                width: size.width,
                height: size.width * 0.8 * 0.75,
                //alignment: Alignment.topCenter, dua lenh nay vao ko fill duoc anh
                child: Image.asset('assets/images/Ellipse_2.png', fit: BoxFit.fill,),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: SizedBox(
                width: size.width * 0.6,
                height: size.width * 0.8 * 0.27,
                //alignment: Alignment.topCenter, dua lenh nay vao ko fill duoc anh
                child: Image.asset('assets/images/Ellipse_3.png', fit: BoxFit.fill,),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    SizedBox(height: size1 * 16,),
                    const Text('Đánh giá học sinh', style: TextStyle(fontSize: 40, color: Colors.white,),),
                    SizedBox(height: size1 * 10,),
                    CustomTextInput(
                      hintText: 'Nhập Điểm Toán',
                      obscureText: false,
                      controller: mathController!,
                    ),
                    const SizedBox(height: 20,),
                    CustomTextInput(
                      hintText: 'Nhập Điểm Văn',
                      obscureText: false,
                      controller: literatureController!,
                    ),
                    const SizedBox(height: 20,),
                    CustomTextInput(
                      hintText: 'Nhập Điểm Anh',
                      obscureText: false,
                      controller: englishController!,
                    ),
                    SizedBox(height: size1 * 4,),
                    CustomTextLineButton(
                      onPressed: () {
                        setState(() {
                          double mathScore = double.parse(mathController!.text);
                          double literatureScore = double.parse(literatureController!.text);
                          double englishScore = double.parse(englishController!.text);
                          averageMarkStr = ((mathScore + literatureScore + englishScore) / 3).toStringAsFixed(1);
                          gradeStr = getGrade(mark: double.parse(averageMarkStr));
                        });
                      },
                      text: 'Đánh giá',
                      color: Colors.blue,
                      fontSize: 26,
                      lineImageStr: 'assets/images/Rectangle_2.png',
                      lineLength: 130,
                    ),
                    SizedBox(height: size1 * 4,),
                    InformationCard(
                      firstLabel: 'Điểm trung bình: ',
                      firstContent: averageMarkStr,
                      secondLabel: 'Xếp loại: ',
                      secondContent: gradeStr,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    mathController!.dispose();
    literatureController!.dispose();
    englishController!.dispose();
  }
}
