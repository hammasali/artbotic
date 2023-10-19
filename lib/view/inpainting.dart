import 'package:artbotic/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/create_controller.dart';
import '../generated/l10n.dart';
import '../routes/routes.dart';
import '../utils/app_const.dart';

import 'components/buttons/custom_button.dart';
import 'components/buttons/custom_button5.dart';

class InPainting extends StatelessWidget {
  InPainting({super.key});

  final CreateController controller = Get.find<CreateController>();
  final GlobalKey repaintBoundaryKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(context),
        body: Column(children: [
          /// GET IMAGE
          PaintOnImage(repaintBoundaryKey),

          /// MASKING OPTIONS
          getOptions(context)
        ]));
  }

  getAppBar(BuildContext context) {
    final s = S.of(context);

    return AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              controller.imageFile.value = null;
              navigatorKey.currentState!.pop();
            }),
        title: Text(s.create, style: Theme.of(context).textTheme.titleMedium),
        actions: [
          Container(
              width: Get.width * 0.3,
              padding: const EdgeInsets.all(10.0),
              child: CustomButton(
                  title: s.apply,
                  textStyle: Theme.of(context).textTheme.titleMedium,
                  onTap: () async {
                    String base64String =
                        await controller.renderedImageAndGetMergedImageToBase64(
                            repaintBoundaryKey);
                    controller.imageFile.value =
                        await controller.base64ToFile(base64String);
                    debugPrint(base64String, wrapWidth: 1024);
                    navigatorKey.currentState!.pop();
                  },
                  borderRadius: 4))
        ]);
  }

  getOptions(BuildContext context) {
    final s = S.of(context);

    return Obx(() {
      return Container(
          width: Get.width * 0.7,
          height: 100,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(16)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppConsts.mask,
                      color: Theme.of(context).iconTheme.color, height: 30),
                  Text(s.mask, style: Theme.of(context).textTheme.titleMedium)
                ]),
            CustomButton5(
                isSelected: controller.isMaskSelected.value,
                icon: AppConsts.maskBrush,
                onTap: controller.enabledDrawing),
            CustomButton5(
                isSelected: controller.isEraseSelected.value,
                icon: AppConsts.maskErase,
                onTap: controller.clearPoints)
          ]));
    });
  }
}

class PaintOnImage extends StatelessWidget {
  final CreateController controller = Get.find<CreateController>();
  final GlobalKey repaintBoundaryKey;

  PaintOnImage(this.repaintBoundaryKey, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateController>(builder: (logic) {
      return Container(
          margin: const EdgeInsets.all(24),
          height: screenHeight * 0.6,
          width: double.infinity,
          child: GestureDetector(
              onPanUpdate: (details) {
                if (controller.isMaskSelected.value) {
                  controller.addPoint(details.localPosition);
                }
              },
              onPanEnd: (details) {
                if (controller.isMaskSelected.value) {
                  controller.points.add(null);
                }
              },
              child: RepaintBoundary(
                  key: repaintBoundaryKey,
                  child: Stack(children: [
                    /// IMAGE
                    Container(
                        height: screenHeight * 0.6,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(controller.imageFile.value!,
                                width: 100, fit: BoxFit.cover))),

                    /// DRAW CANVAS
                    Obx(() => ClipRect(
                        child: Container(
                            width: double.infinity,
                            height: screenHeight * 0.6,
                            margin: const EdgeInsets.all(24),
                            child: CustomPaint(
                                painter: ImagePainter(
                                    controller.points,
                                    controller.currentDrawingColor.value,
                                    controller.strokeWidth.value)))))
                  ]))));
    });
  }
}

class ImagePainter extends CustomPainter {
  final List<Offset?> points;
  final Color color;
  final double strokeWidth;

  ImagePainter(this.points, this.color, this.strokeWidth);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
