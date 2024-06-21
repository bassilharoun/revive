import 'dart:async';
import 'dart:math';
import 'package:camera/camera.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_border/progress_border.dart';
import 'package:revive/core/utils/image_constant.dart';
import 'package:revive/theme/app_decoration.dart';
import 'package:revive/theme/custom_text_style.dart';
import 'package:revive/theme/theme_helper.dart';
import 'package:revive/widgets/custom_image_view.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LiveExerciseScreen extends StatefulWidget {
  @override
  _LiveExerciseScreenState createState() => _LiveExerciseScreenState();
}

class _LiveExerciseScreenState extends State<LiveExerciseScreen>
    with SingleTickerProviderStateMixin {
  CameraController? _cameraController;
  Future<void>? _initializeControllerFuture;
  final String _youtubeVideoId =
      'IODxDxX7oi4'; // Replace with your YouTube video ID

  late YoutubePlayerController _youtubePlayerController;
  late AnimationController _animationController;

  int _countdown = 3;
  bool _countdownCompleted = false;

  double _progressHeight = 0.0;
  late Timer _progressTimer;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _initializeYoutubePlayer();
    _startCountdown();

    _animationController = AnimationController(
      duration: Duration(seconds: 30),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _navigateToNextScreen();
        }
      });

    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.forward();
    _startRandomProgressUpdates();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
      );

      _cameraController = CameraController(
        frontCamera,
        ResolutionPreset.high,
      );

      _initializeControllerFuture = _cameraController!.initialize();
      await _initializeControllerFuture;

      if (!mounted) return;
      setState(() {});
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  void _initializeYoutubePlayer() {
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: _youtubeVideoId,
      flags: YoutubePlayerFlags(
        autoPlay: false, // Set to false to control when to start
        mute: false,
      ),
    );
  }

  void _startCountdown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_countdown == 1) {
        setState(() {
          _countdownCompleted = true;
        });
        _youtubePlayerController.play();
        timer.cancel();
      } else {
        setState(() {
          _countdown--;
        });
      }
    });
  }

  void _startRandomProgressUpdates() {
    final random = Random();
    _progressTimer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        _progressHeight = random.nextDouble();
      });
    });
  }

  void _navigateToNextScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => NextScreen(), // Replace with your next screen
      ),
    );
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _youtubePlayerController.dispose();
    _animationController.dispose();
    _progressTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: FutureBuilder<void>(
                    future: _initializeControllerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.sp),
                                  color: Colors.grey[300],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(2.sp),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(15.sp),
                                      border: ProgressBorder.all(
                                        color: appTheme.green600,
                                        width: 5.sp,
                                        progress: _animationController.value,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
                                      child: SizedBox(
                                        width: _cameraController!
                                                .value.previewSize!.height -
                                            100,
                                        height: _cameraController!
                                            .value.previewSize!.width,
                                        child:
                                            CameraPreview(_cameraController!),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                _countdownCompleted
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10.sp),
                        child: SizedBox(
                          height: 200.h,
                          child: YoutubePlayer(
                            controller: _youtubePlayerController,
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: Colors.red,
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '$_countdown',
                          style: TextStyle(
                              fontSize: 48.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
              ],
            ),
            Positioned(
              top: 100.h,
              left: 0,
              child: Container(
                width: 30.w,
                height: 200.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  color: Colors.greenAccent.withOpacity(0.5),
                  border: Border.all(
                    color: Colors.white,
                    width: 3.sp,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 30.w,
                    height: 100.h * _progressHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                      color: appTheme.green600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NextScreen extends StatefulWidget {
  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  final _controller = ConfettiController(duration: Duration(seconds: 10));

  @override
  void initState() {
    _controller.play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 7.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 13.h,
                    vertical: 8.h,
                  ),
                  decoration: AppDecoration.outlineBlack.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder22,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgArrowLeft,
                        height: 24.h,
                        width: 24.h,
                        margin: EdgeInsets.only(top: 6.h),
                        onTap: () {},
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 6.h),
                        child: Text(
                          "Your Report",
                          style: CustomTextStyles.labelLargeSemiBold,
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgEpSetting,
                        height: 20.h,
                        width: 20.h,
                        margin: EdgeInsets.only(
                          top: 6.h,
                          bottom: 4.h,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "The journey begins now! Let's track your progress together.",
                style: CustomTextStyles.labelLargeSemiBold,
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                decoration: AppDecoration.outlineBlack.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder9,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.all(32.h),
                      child: Text(
                        "You finished your first exercise to lose pain.",
                        style: CustomTextStyles.labelLargeSemiBold,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text("Back Pain Rehab Plan",
                  style: CustomTextStyles.titleMedium.copyWith(
                    color: Colors.black,
                  )),
              SizedBox(
                height: 20.h,
              ),
              Container(
                decoration: AppDecoration.outlineBlack.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder9,
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15.sp,
                            backgroundColor: appTheme.green600,
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.h),
                            child: Text(
                              "Push Ups",
                              style: CustomTextStyles.titleMedium.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 20.sp,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "Duration: 30 seconds",
                            style: CustomTextStyles.labelLarge,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.repeat,
                            size: 20.sp,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "Repetitions: 0",
                            style: CustomTextStyles.labelLarge,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Icon(Icons.no_luggage_outlined),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "No Equipment",
                            style: CustomTextStyles.labelLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        ConfettiWidget(confettiController: _controller, blastDirection: pi / 2),
      ],
    ));
  }
}
