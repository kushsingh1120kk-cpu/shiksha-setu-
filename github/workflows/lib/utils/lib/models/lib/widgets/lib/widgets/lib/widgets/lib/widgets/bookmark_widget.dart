import 'package:flutter/material.dart';

class BookmarkWidget extends StatefulWidget {
  final bool isBookmarked;
  final VoidCallback onPressed;

  const BookmarkWidget({
    Key? key,
    required this.isBookmarked,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<BookmarkWidget> createState() => _BookmarkWidgetState();
}

class _BookmarkWidgetState extends State<BookmarkWidget> {
  late bool _isBookmarked;

  @override
  void initState() {
    super.initState();
    _isBookmarked = widget.isBookmarked;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
        color: _isBookmarked ? const Color(0xFF2196F3) : Colors.grey,
        size: 28,
      ),
      onPressed: () {
        setState(() {
          _isBookmarked = !_isBookmarked;
        });
        widget.onPressed();
      },
    );
  }
}
