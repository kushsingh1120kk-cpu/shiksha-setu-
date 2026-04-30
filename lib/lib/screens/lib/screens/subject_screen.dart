import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubjectScreen extends StatefulWidget {
  final String subject;
  final String className;
  final String stream;

  const SubjectScreen({
    Key? key,
    required this.subject,
    required this.className,
    required this.stream,
  }) : super(key: key);

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final Map<String, List<String>> chapters = {
    'Physics': ['Motion', 'Force', 'Work & Energy', 'Sound', 'Light'],
    'Chemistry': ['Atoms & Molecules', 'Mole Concept', 'Chemical Reactions', 'Periodic Table', 'Bonding'],
    'Biology': ['Cell Structure', 'Photosynthesis', 'Respiration', 'Reproduction', 'Evolution'],
    'Mathematics': ['Algebra', 'Geometry', 'Trigonometry', 'Calculus', 'Statistics'],
    'English': ['Grammar', 'Literature', 'Comprehension', 'Writing', 'Speaking'],
    'History': ['Ancient India', 'Medieval India', 'Modern India', 'World History', 'Independence'],
    'Geography': ['Physical Geography', 'Political Geography', 'Economic Geography', 'Map Work', 'Resources'],
    'Political Science': ['Constitution', 'Democracy', 'Government', 'Rights & Duties', 'International Relations'],
    'Economics': ['Microeconomics', 'Macroeconomics', 'Development', 'Money & Banking', 'International Trade'],
    'Accountancy': ['Accounting Basics', 'Journal & Ledger', 'Trial Balance', 'Financial Statements', 'Analysis'],
    'Business Studies': ['Business Environment', 'Entrepreneurship', 'Management', 'Marketing', 'Finance'],
  };

  final Map<String, List<String>> assignments = {
    'Physics': ['Numericals on Motion', 'Force Diagrams', 'Energy Calculations', 'Sound Experiments', 'Light Ray Diagrams'],
    'Chemistry': ['Mole Calculations', 'Balancing Equations', 'Ionic Bonding', 'Redox Reactions', 'Periodic Trends'],
    'Biology': ['Cell Diagrams', 'Photosynthesis Equations', 'Punnett Squares', 'Life Cycle Diagrams', 'Classification'],
    'Mathematics': ['Algebra Problems', 'Geometry Proofs', 'Trigonometry Identities', 'Integration Problems', 'Data Analysis'],
    'English': ['Grammar Exercises', 'Essay Writing', 'Reading Comprehension', 'Vocabulary', 'Speaking Tasks'],
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subject),
        subtitle: Text('Class ${widget.className} - ${widget.stream}'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '📚 Chapters', icon: Icon(Icons.book)),
            Tab(text: '📝 Assignments', icon: Icon(Icons.assignment)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Chapters Tab
          ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: chapters[widget.subject]?.length ?? 0,
            itemBuilder: (context, index) {
              final chapter = chapters[widget.subject]![index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.article, color: Color(0xFF2196F3)),
                  title: Text(
                    chapter,
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text('📥 Download PDF'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('📥 Downloading $chapter PDF...')),
                    );
                  },
                ),
              );
            },
          ),
          // Assignments Tab
          ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: assignments[widget.subject]?.length ?? 0,
            itemBuilder: (context, index) {
              final assignment = assignments[widget.subject]![index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.task, color: Color(0xFF4CAF50)),
                  title: Text(
                    assignment,
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                  ),
                  subtitle: const Text('⬇️ Download Assignment'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('📥 Downloading $assignment...')),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
