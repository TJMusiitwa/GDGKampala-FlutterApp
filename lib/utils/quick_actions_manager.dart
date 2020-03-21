import 'package:flutter/material.dart';
import 'package:google_dev_group_kampala/screens/events/events.dart';
import 'package:google_dev_group_kampala/screens/news_blog/news_blog_page.dart';
import 'package:quick_actions/quick_actions.dart';

class QuickActionsManager extends StatefulWidget {
  final Widget child;

  const QuickActionsManager({Key key, this.child}) : super(key: key);
  @override
  _QuickActionsManagerState createState() => _QuickActionsManagerState();
}

class _QuickActionsManagerState extends State<QuickActionsManager> {
  final QuickActions quickActions = QuickActions();
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void initState() {
    super.initState();
    _setupQuickActions();
    _handleQuickActions();
  }

  void _handleQuickActions() {
    quickActions.initialize((shortcutType) {
      if (shortcutType == 'action_events') {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => EventsScreen()));
      } else if (shortcutType == 'action_blogNews') {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => NewsBlogPage()));
      }
    });
  }

  void _setupQuickActions() {
    quickActions.setShortcutItems(<ShortcutItem>[
      ShortcutItem(
          type: 'action_events', localizedTitle: 'Events', icon: 'calendar'),
      ShortcutItem(
          type: 'action_blogNews', localizedTitle: 'News', icon: 'blog')
    ]);
  }
}
