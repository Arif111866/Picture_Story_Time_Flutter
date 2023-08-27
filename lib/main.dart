import 'package:flutter/material.dart';

void main() {
  runApp(PictureStoryApp());
}

class PictureStoryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Picture Story Time',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StoryLibraryScreen(),
    );
  }
}
class StoryLibraryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Story Library'),
      ),
      body: ListView.builder(
        itemCount: storyList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the story viewer screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StoryViewerScreen(story: storyList[index]),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.asset(
                    storyList[index].coverImage,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 16.0),
                  Text(
                    storyList[index].title,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class StoryViewerScreen extends StatelessWidget {
  final Story story;

  StoryViewerScreen({required this.story});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(story.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              story.coverImage,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                story.content,
                style: TextStyle(fontSize: 16),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement interactive elements or read-aloud functionality
              },
              child: Text('Read Aloud'),
            ),
          ],
        ),
      ),
    );
  }
}

class Story {
  final String title;
  final String coverImage;
  final String content;

  Story({required this.title, required this.coverImage, required this.content});
}

// Dummy data
List<Story> storyList = [
  Story(
    title: 'The picture of Arif',
    coverImage: 'assets/picofme.png',
    content: 'Once upon a time i was a good football player',
  ),
  Story(
    title: 'Lionel Messi',
    coverImage: 'assets/download.jpg',
    content: 'Lionel Messi, a football legend, rose from humble beginnings in Rosario, Argentina.His extraordinary skills quickly caught the eye of FC Barcelona, where he mesmerized the world with his dazzling dribbles and incredible goals. Winning numerous titles, including multiple Ballon dOr awards, he became synonymous with the club. In a shocking move, he later joined Paris Saint-Germain, continuing his legacy of brilliance on the pitch. Messis journey inspires millions, proving that determination and talent can turn a small boys dream into an international phenomenon.',
  ),
  Story(
    title: 'The picture of Di Maria',
    coverImage: 'assets/images.jpg',
    content: 'In a quiet Argentinian village, Miguel idolized Ángel Di María, practicing tirelessly on a makeshift field. One day, Di María himself surprised Miguel with a coaching session, inspiring him to excel. Under Di Marías guidance, Miguel s skills soared, leading him to join the national youth team. Years later, Miguel stood alongside his idol as a testament to dreams realized through dedication.',
  ),
  // Add more stories here
];
