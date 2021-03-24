import "package:flutter/material.dart";

import "package:breakpoint_scaffold/breakpoint_scaffold.dart";

class MyDrawer extends StatelessWidget {
  final bool includePrimaryNavItems;
  const MyDrawer({required this.includePrimaryNavItems});

  Widget get header => const UserAccountsDrawerHeader(
    currentAccountPicture: CircleAvatar(child: Text("U")),
    accountName: Text("User"),
    accountEmail: Text("username@gmail.com"),
    otherAccountsPictures: [
      CircleAvatar(child: Text("A")),
      CircleAvatar(child: Text("B")),
      CircleAvatar(child: Text("C")),
    ]
  );

  @override 
  Widget build(BuildContext context) => Drawer(
    child: ListView(
      children: [
        header,
        if (includePrimaryNavItems)
          for (int index = 0; index < 5; index++) 
            ListTile(
              title: Text("Go to page $index"),
              onTap: () => Navigator
                .of(context)
                .pushReplacementNamed(index.toString())
            ),
        const ListTile(title: Text("About")),
        const ListTile(title: Text("Log out")),
      ]
    )
  );
}

class SideSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Drawer(
    child: Column(
      children: const [
        DrawerHeader(
          child: Text("More", textScaleFactor: 1.5),
        ),
        Spacer(),
        Text("This gives you more options"),
        Spacer(),
      ]
    )
  );
}

// ----------------

class DemoPage extends StatelessWidget {
  final int index;
  const DemoPage(this.index);

  Widget get fab => FloatingActionButton(
    onPressed: () {},
    child: const Icon(Icons.info), 
  );

  AppBar get appBar => AppBar(
    title: Text("Page $index"),
    actions: [
      Builder(
        builder: (BuildContext context) => IconButton(
          icon: const Icon(Icons.info),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          }
        )
      )
    ]
  );

  @override
  Widget build(BuildContext context) => ResponsiveScaffold.navBar(
    navItems: [
      for (int index = 0; index < 5; index++)
        NavigationItem(label: index.toString(), icon: const Icon(Icons.info)),
    ],
    navIndex: index,
    onNavIndexChanged: (int value) => 
      Navigator.of(context).pushReplacementNamed(value.toString()),

    drawer: const MyDrawer(includePrimaryNavItems: true),
    appBar: appBar,
    body: const Placeholder(),
    secondaryDrawer: const MyDrawer(includePrimaryNavItems: false),
    sideSheet: SideSheet(),
    floatingActionButton: fab,
  );
}

// ----------------

void main() => runApp(
  MaterialApp(
    initialRoute: "1",
    onGenerateRoute: (RouteSettings settings) {
      final int? index = int.tryParse(settings.name!);
      if (index == null) {
        return null;
      }
      return PageRouteBuilder(
        settings: settings, 
        pageBuilder: (_, __, ___) => DemoPage(index),
        transitionDuration: Duration.zero,
      );
    },
  )
);
