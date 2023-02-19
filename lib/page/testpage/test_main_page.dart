import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_app/const/app_colors.dart';
import 'package:crypto_app/page/testpage/testing/testing_page.dart';
import 'package:crypto_app/page/testpage/testing/testinginfo_page.dart';
import 'package:crypto_app/widget/template_bg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TestMainPage extends StatefulWidget {
  const TestMainPage({super.key});

  @override
  State<TestMainPage> createState() => _TestMainPageState();
}

class _TestMainPageState extends State<TestMainPage> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection('Users');

  @override
  Widget build(BuildContext context) {
    String userId = firebaseAuth.currentUser!.uid;
    return TemplageBg(
      showbg: false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 90.h,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            color: AppColors.yellowColor,
            onPressed: () => Navigator.pop(context),
          ),
          title: FutureBuilder(
              future: _userReference.doc(userId).get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text('คุณ ${snapshot.data!['username']}');
                }
                return const Text('คุณ Text');
              }),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FutureBuilder(
                  future: _userReference.doc(userId).get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return snapshot.data!['point1'].isEmpty
                          ? Text(
                              'แบบทดสอบที่1 คะแนนล่าสุด : 0',
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 18.sp,
                              ),
                            )
                          : Text(
                              'แบบทดสอบที่1 คะแนนล่าสุด : ${snapshot.data!['point1'].last}',
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 18.sp,
                              ),
                            );
                    }
                    return Text(
                      'แบบทดสอบที่1 คะแนนล่าสุด : 0',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 18.sp,
                      ),
                    );
                  }),
              FutureBuilder(
                  future: _userReference.doc(userId).get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      List<Data> _chartData = [];
                      if (snapshot.data!['testing'].isNotEmpty == true) {
                        for (var i = 0;
                            i < snapshot.data!['testing'].length;
                            i++) {
                          _chartData
                              .add(Data(i + 1, snapshot.data!['point1'][i]));
                        }
                      }
                      return snapshot.data!['testing'].isNotEmpty
                          ? SfCartesianChart(
                              backgroundColor: AppColors.whiteColor,
                              series: <ChartSeries>[
                                BarSeries(
                                  dataSource: _chartData,
                                  xValueMapper: (datum, index) => datum.count,
                                  yValueMapper: (datum, index) => datum.point,
                                ),
                              ],
                              primaryXAxis: CategoryAxis(
                                title: AxisTitle(text: 'รอบที่'),
                              ),
                              primaryYAxis: CategoryAxis(
                                title: AxisTitle(text: 'คะแนนเต็ม 10'),
                                maximum: 10,
                              ),
                            )
                          : SfCartesianChart(
                              backgroundColor: AppColors.whiteColor,
                              primaryYAxis: CategoryAxis(
                                title: AxisTitle(text: 'รอบที่'),
                              ),
                              primaryXAxis: CategoryAxis(
                                title: AxisTitle(text: 'คะแนนเต็ม 10'),
                                maximum: 10,
                              ),
                            );
                    }
                    return SfCartesianChart(
                      backgroundColor: AppColors.whiteColor,
                      primaryYAxis: CategoryAxis(
                        title: AxisTitle(text: 'รอบที่'),
                      ),
                      primaryXAxis: CategoryAxis(
                        title: AxisTitle(text: 'คะแนนเต็ม 10'),
                        maximum: 10,
                      ),
                    );
                  }),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 300.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.greenColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TestingPage(),
                        ),
                      );
                    },
                    child: Text(
                      'ทำแบบทดสอบที่1',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                color: AppColors.whiteColor,
                height: 10,
                thickness: 2,
              ),
              FutureBuilder(
                  future: _userReference.doc(userId).get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return snapshot.data!['point2'].isEmpty
                          ? Text(
                              'แบบทดสอบที่2 คะแนนล่าสุด : 0',
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 18.sp,
                              ),
                            )
                          : Text(
                              'แบบทดสอบที่2 คะแนนล่าสุด : ${snapshot.data!['point2'].last}',
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 18.sp,
                              ),
                            );
                    }
                    return Text(
                      'แบบทดสอบที่2 คะแนนล่าสุด : 0',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 18.sp,
                      ),
                    );
                  }),
              FutureBuilder(
                  future: _userReference.doc(userId).get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      List<Data> _chartData = [];
                      if (snapshot.data!['testinfo'].isNotEmpty == true) {
                        for (var i = 0;
                            i < snapshot.data!['testinfo'].length;
                            i++) {
                          _chartData
                              .add(Data(i + 1, snapshot.data!['point2'][i]));
                        }
                      }
                      return snapshot.data!['testinfo'].isNotEmpty
                          ? SfCartesianChart(
                              backgroundColor: AppColors.whiteColor,
                              series: <ChartSeries>[
                                BarSeries(
                                  dataSource: _chartData,
                                  xValueMapper: (datum, index) => datum.count,
                                  yValueMapper: (datum, index) => datum.point,
                                ),
                              ],
                              primaryXAxis: CategoryAxis(
                                title: AxisTitle(text: 'รอบที่'),
                              ),
                              primaryYAxis: CategoryAxis(
                                title: AxisTitle(text: 'คะแนนเต็ม 10'),
                                maximum: 10,
                              ),
                            )
                          : SfCartesianChart(
                              backgroundColor: AppColors.whiteColor,
                              primaryYAxis: CategoryAxis(
                                title: AxisTitle(text: 'รอบที่'),
                              ),
                              primaryXAxis: CategoryAxis(
                                title: AxisTitle(text: 'คะแนนเต็ม 10'),
                                maximum: 10,
                              ),
                            );
                    }
                    return SfCartesianChart(
                      backgroundColor: AppColors.whiteColor,
                      primaryYAxis: CategoryAxis(
                        title: AxisTitle(text: 'รอบที่'),
                      ),
                      primaryXAxis: CategoryAxis(
                        title: AxisTitle(text: 'คะแนนเต็ม 10'),
                        maximum: 10,
                      ),
                    );
                  }),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 300.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.yellowColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TestInfo(),
                        ),
                      );
                    },
                    child: Text(
                      'ทำแบบทดสอบที่2',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Data {
  final int count;
  final int point;

  Data(this.count, this.point);
}
