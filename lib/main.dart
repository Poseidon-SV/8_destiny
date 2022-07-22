import 'package:flutter/material.dart';
import 'story_brain.dart'; // To fecth the story line of the game

/// Take stories form story_brain.dart and gives the order of story and user choices

/// Button Visibilty

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  const Destini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

StoryBrain storyBrain = StoryBrain(); // Defining Class as an object to use it

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( /// setting Background as an image
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background_2.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column( /// columns to define story line and buttons
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 10,
                child: Center(
                  child: Text(
                    storyBrain.getStory(), /// getting story from storyBrain
                    style: TextStyle(fontSize: 17.0),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(1); /// feeding choice and getting next story
                    });
                  },
                  color: Colors.red,
                  child: Text(
                    storyBrain.getChoice_1(), /// displaying choice
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonVisible(), /// making button go invisible after story ends
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(2); /// feeding choice and getting next story
                      });
                    },
                    color: Colors.blue,
                    child: Text(
                      storyBrain.getChoice_2(), /// displaying choice
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
