import 'package:bookbyte/backend/my_server_config.dart';
import 'package:bookbyte/buyer/books.dart';
import 'package:bookbyte/buyer/user.dart';
import 'package:bookbyte/pages/mainpage.dart';
import 'package:bookbyte/pages/profile.dart';
import 'package:bookbyte/pages/userloginpage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class BookDetails extends StatefulWidget {
  final User user;
  final Book book;

  const BookDetails({super.key, required this.user, required this.book});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  late double screenWidth, screenHeight;
  final f = DateFormat('dd-MM-yyyy hh:mm a');
  bool owner = false;

  

  @override
  Widget build(BuildContext context) {
    if (widget.user.userId == widget.book.userId) {
      owner = true;
    } else {
      owner = false;
    }
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

      return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.bookTitle.toString()),
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem<int>(
                value: 0,
                enabled: owner,
                child: const Text("Update"),
              ),
              PopupMenuItem<int>(
                enabled: owner,
                value: 1,
                child: const Text("Delete"),
              ),
            ];
          },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: screenHeight * 0.4,
            width: screenWidth,
            //  padding: const EdgeInsets.all(4.0),
            child: Image.network(
                fit: BoxFit.fill,
                "${MyServerConfig.server}/bookbytes/images/${widget.book.bookId}.png"),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            height: screenHeight * 0.6,
            child: Column(children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  widget.book.bookTitle.toString(),
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                widget.book.bookAuthor.toString(),
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                  "Available Date ${f.format(DateTime.parse(widget.book.bookDate.toString()))}"),
              Text("ISBN ${widget.book.bookIsbn}"),
              const SizedBox(
                height: 8,
              ),
              Text(widget.book.bookDesc.toString(),
                  textAlign: TextAlign.justify),
              Text(
                "RM ${widget.book.bookPrice}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text("Available Quantity ${widget.book.bookQty}"),
            ]),
          ),
          widget.user.userName == "Guest"
          ? SizedBox(
          child: ElevatedButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (content) => const LoginPage()));},
          child: const Text("Please Login to Buy")),
          )
          : ElevatedButton(onPressed: (){}, child: const Text("Add to Cart"))
        ]),
      ),
    );
  }
}