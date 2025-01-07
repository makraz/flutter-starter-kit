import 'package:flutter/material.dart';

class CustomTabsWidget extends StatefulWidget {
  final List<String> tabTitles;
  final List<Widget> tabContents;
  final Color? indicatorColor;
  final Color? selectedLabelColor;
  final Color? unselectedLabelColor;
  final double? tabHeight;
  final double? tabBarHeight;

  const CustomTabsWidget({
    Key? key,
    required this.tabTitles,
    required this.tabContents,
    this.indicatorColor,
    this.selectedLabelColor,
    this.unselectedLabelColor,
    this.tabHeight,
    this.tabBarHeight,
  })  : assert(tabTitles.length == tabContents.length,
            "Tab titles and tab contents must have the same length."),
        super(key: key);

  @override
  _CustomTabsWidgetState createState() => _CustomTabsWidgetState();
}

class _CustomTabsWidgetState extends State<CustomTabsWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget.tabTitles.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: widget.tabBarHeight ?? 48.0,
          color: Theme.of(context).colorScheme.primaryContainer,
          child: TabBar(
            controller: _tabController,
            indicatorColor:
                widget.indicatorColor ?? Theme.of(context).colorScheme.primary,
            labelColor: widget.selectedLabelColor ??
                Theme.of(context).colorScheme.onPrimary,
            unselectedLabelColor: widget.unselectedLabelColor ??
                Theme.of(context).colorScheme.onSurfaceVariant,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: widget.tabTitles
                .map((title) => Tab(
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ))
                .toList(),
          ),
        ),
        Expanded(
          child: Container(
            height: widget.tabHeight ?? double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: widget.tabContents,
            ),
          ),
        ),
      ],
    );
  }
}
