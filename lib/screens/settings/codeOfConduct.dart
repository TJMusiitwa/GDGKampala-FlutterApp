import 'package:flutter/material.dart';

class CodeOfConductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Code of Conduct'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              '''When you join our programs, you’re joining a community. And like any growing community, a few ground rules about expected behavior are good for everyone. These guidelines cover both online (e.g. mailing lists, social channels) and offline (e.g. in-person meetups) behavior.

\nViolations of this code of conduct can result in members being removed from the program. Use your best judgement, and if you’d like more clarity or have questions feel free to reach out.''',
              softWrap: true,
              style: Theme.of(context).textTheme.subhead,
            ),
            SizedBox(
              height: 20,
            ),
            ExpansionTile(
              title: Text('Be nice'),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '''We're all part of the same community, so be friendly, welcoming, and generally a nice person. Be someone that other people want to be around.''',
                    softWrap: true,
                  ),
                )
              ],
            ),
            ExpansionTile(
              title: Text('Particiapte'),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '''Join in on discussions, show up for in-person meetings regularly, offer feedback, and help implement that feedback.''',
                    softWrap: true,
                  ),
                )
              ],
            ),
            ExpansionTile(
              title: Text('Be respectful and constructive'),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '''Remember to be respectful and constructive with your communication to fellow members. Don't get into flamewars, make personal attacks, vent, or rant unconstructively. Everyone should take responsibility for the community and take the initiative to diffuse tension and stop a negative thread as early as possible.''',
                    softWrap: true,
                  ),
                )
              ],
            ),
            ExpansionTile(
              title: Text('Step down considerably'),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ''' If you have some form of responsibility in your community, be aware of your own constraints. If you know that a new job or personal situation will limit your time, find someone who can take over for you and transfer the relevant information (contacts, passwords, etc.) for a smooth transition.''',
                    softWrap: true,
                  ),
                )
              ],
            ),
            ExpansionTile(
              title: Text('Be collaborative'),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '''Work together! We can learn a lot from each other. Share knowledge, and help each other out.''',
                    softWrap: true,
                  ),
                )
              ],
            ),
            ExpansionTile(
              title: Text('Basic etiquette for online discussions'),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '''Don’t send messages to a big list that only need to go to one person. Keep off topic conversations to a minimum. Don’t be spammy by advertising or promoting personal projects which are off topic.''',
                    softWrap: true,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
