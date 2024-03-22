import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:photo_view/photo_view.dart';
import 'package:tech_lancer_teacher/app/core/constants/strings.dart';
import 'package:tech_lancer_teacher/app/core/theme/colors.dart';
import 'package:tech_lancer_teacher/app/utils/my_snackbar.dart';
import 'package:tech_lancer_teacher/main.dart';

class PracticesImageShow extends StatelessWidget {
  const PracticesImageShow(
      {Key? key,
      required this.imagePath,
      // required this.tag,
      required this.pdfDoc})
      : super(key: key);
  final String imagePath;
  final PDFDocument pdfDoc;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Practices Task"),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Visibility(
          visible: imagePath.fileExtension() == "pdf",
          replacement: PhotoView(
            backgroundDecoration: BoxDecoration(
              color: AppColors.transparent,
            ),
            imageProvider: NetworkImage(
              imagePath,
            ),
            loadingBuilder: (context, event) {
              return Center(
                child: CupertinoActivityIndicator(),
              );
            },
            errorBuilder: (context, url, error) =>
                const Icon(Icons.image, size: 70),
          ),
          child: PDFViewer(
            document: pdfDoc,
            backgroundColor: AppColors.transparent,
            enableSwipeNavigation: true,
            scrollDirection: Axis.vertical,
            showNavigation: false,
            showPicker: false,
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     myLoader();
      //     await FileDownloadServices.downloadFile(url: imagePath);
      //   },
      //   shape: StadiumBorder(),
      //   backgroundColor: AppColors.blackColor,
      //   child: const Icon(
      //     Icons.download,
      //     color: AppColors.whiteColor,
      //   ),
      // ),
    );
  }
}