import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'subject_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedClass;
  String? selectedStream;
  String searchQuery = '';

  final List<String> classes = ['9', '10', '11', '12'];
  final List<String> streams = ['Science', 'Arts', 'Commerce'];

  final Map<String, List<String>> subjects = {
    'Science': ['Physics', 'Chemistry', 'Biology', 'Mathematics', 'English'],
    'Arts': ['History', 'Geography', 'Political Science', 'Economics', 'English'],
    'Commerce': ['Accountancy', 'Economics', 'Business Studies', 'Mathematics', 'English'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📚 Shiksha Setu'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value.toLowerCase();
                  });
                },
                decoration: InputDecoration(
                  hintText: '🔍 Search subjects, chapters...',
                  hintStyle: GoogleFonts.poppins(),
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
              const SizedBox(height: 20),

              // Class Selection
              Text(
                'Select Class',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: classes.map((cls) {
                  return FilterChip(
                    label: Text('Class $cls'),
                    selected: selectedClass == cls,
                    onSelected: (selected) {
                      setState(() {
                        selectedClass = selected ? cls : null;
                      });
                    },
                    backgroundColor: Colors.grey[200],
                    selectedColor: const Color(0xFF2196F3),
                    labelStyle: TextStyle(
                      color: selectedClass == cls ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),

              // Stream Selection
              Text(
                'Select Stream',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: streams.map((stream) {
                  return FilterChip(
                    label: Text(stream),
                    selected: selectedStream == stream,
                    onSelected: (selected) {
                      setState(() {
                        selectedStream = selected ? stream : null;
                      });
                    },
                    backgroundColor: Colors.grey[200],
                    selectedColor: const Color(0xFF2196F3),
                    labelStyle: TextStyle(
                      color: selectedStream == stream ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),

              // Subjects Grid
              if (selectedStream != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '📖 Subjects for Class $selectedClass - $selectedStream',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: subjects[selectedStream]?.length ?? 0,
                      itemBuilder: (context, index) {
                        final subject = subjects[selectedStream]![index];
                        final filtered = searchQuery.isEmpty ||
                            subject.toLowerCase().contains(searchQuery);

                        if (!filtered) return const SizedBox.shrink();

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SubjectScreen(
                                  subject: subject,
                                  className: selectedClass ?? '9',
                                  stream: selectedStream ?? 'Science',
                                ),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    const Color(0xFF2196F3).withOpacity(0.8),
                                    const Color(0xFF1976D2).withOpacity(0.8),
                                  ],
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.book,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    subject,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                )
              else
                Center(
                  child: Text(
                    '👆 Select a stream to see subjects',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey,
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
