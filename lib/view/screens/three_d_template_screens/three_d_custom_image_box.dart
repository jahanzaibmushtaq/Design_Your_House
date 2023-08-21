import 'dart:io';
import 'dart:typed_data';

import 'package:design_your_house/utils/request_permission.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class ThreeDCustomImageBox extends StatelessWidget {
  final String imageAssetPath;
  final VoidCallback onEditTap;
  final VoidCallback onPreviewTap;

  const ThreeDCustomImageBox({
    Key? key,
    required this.imageAssetPath,
    required this.onEditTap,
    required this.onPreviewTap,
  }) : super(key: key);

  Future<void> _downloadImage(BuildContext context) async {
    try {
      final ByteData byteData = await rootBundle.load(imageAssetPath);
      final Uint8List bytes = byteData.buffer.asUint8List();
      await _saveImageToGallery(context, bytes);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error downloading image: $e'),
        ),
      );
    }
  }

  Future<void> _saveImageToGallery(BuildContext context, Uint8List bytes) async {
    try {
      // Get the cache directory path to save the image temporarily.
      final Directory cacheDir = await getTemporaryDirectory();
      final String imagePath = "${cacheDir.path}/temp_image.png";

      // Save the image to the cache directory.
      File(imagePath).writeAsBytesSync(bytes);

      // Request permission to save the image to the gallery.
      await requestPermission(Permission.storage);

      // Save the image to the gallery using ImageGallerySaver.
      final result = await ImageGallerySaver.saveFile(imagePath);
      if (result['isSuccess']) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Image downloaded successfully!'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to download image.'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error downloading image: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            GestureDetector(
              onTap: () {
                // Show the image when the box is tapped.
                onPreviewTap();
              },
              child: Image.asset(
                imageAssetPath,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () {
                  // Navigate to the EditImageScreen when the edit icon is tapped.
                  onEditTap();
                },
                child: Container(
                  padding: const EdgeInsets.all(6),
                  color: Colors.black.withOpacity(0.6),
                  child: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
            // Positioned(
            //   left: 8,
            //   top: 8,
            //   child: GestureDetector(
            //     onTap: () {
            //       // Handle the download icon tap here.
            //       _downloadImage(context);
            //     },
            //     child: Container(
            //       padding: const EdgeInsets.all(6),
            //       color: Colors.black.withOpacity(0.6),
            //       child: const Icon(
            //         Icons.download,
            //         color: Colors.white,
            //         size: 24,
            //       ),
            //     ),
            //   ),
            // ),
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                color: Colors.black.withOpacity(0.6),
                child: const Text(
                  'Preview',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
