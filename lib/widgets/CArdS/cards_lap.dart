import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CardLaps extends StatelessWidget {
  CardLaps({
    required this.tittle,
    required this.image,
    this.cardClick,
    Key? key,
  }) : super(key: key);
  final String tittle;
  final String image;
  void Function()? cardClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: InkWell(
        onTap: cardClick,
        child: Card(
          elevation: 10,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              // * Image
              Expanded(
                flex: 4,
                child: CachedNetworkImage(
                  fit: BoxFit.fitHeight,
                  imageUrl: image,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              // * Title
              Expanded(
                child: Center(
                  child: Text(
                    tittle,
                    style: GoogleFonts.aBeeZee(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
