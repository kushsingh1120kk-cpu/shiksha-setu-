import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBarWidget extends StatefulWidget {
  final Function(String) onChanged;
  final String hintText;

  const SearchBarWidget({
    Key? key,
    required this.onChanged,
    this.hintText = '🔍 Search...',
  }) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: GoogleFonts.poppins(color: Colors.grey),
        prefixIcon: const Icon(Icons.search, color: Color(0xFF2196F3)),
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _controller.clear();
                  widget.onChanged('');
                  setState(() {});
                },
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF2196F3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF2196F3), width: 2),
        ),
        filled: true,
        fillColor: Colors.grey[50],
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      style: GoogleFonts.poppins(),
      onChanged: (value) {
        setState(() {});
        widget.onChanged(value);
      },
    );
  }
}
