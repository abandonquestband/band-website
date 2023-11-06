import 'package:flutter/material.dart';

class ScrollLimit extends StatefulWidget {
  final double maxScrollLimit;
  final Widget child;

  ScrollLimit({
    required this.maxScrollLimit,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  _ScrollLimitState createState() => _ScrollLimitState();
}

class _ScrollLimitState extends State<ScrollLimit> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollUpdateNotification) {
          // Check if the user has scrolled beyond the maximum limit
          if (_scrollController.offset > widget.maxScrollLimit) {
            // If they have, adjust the scroll offset to the limit
            _scrollController.jumpTo(widget.maxScrollLimit);
            // Return true to indicate that you handled the scroll
            return true;
          }
        }
        return false;
      },
      child: SingleChildScrollView(
        controller: _scrollController,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
