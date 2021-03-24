# breakpoint_scaffold

A scaffold that responds to different screen sizes by moving the drawer, navigation bar, and side sheet. 

The design differs on various screen sizes, following Material Design [breakpoints](https://material.io/design/layout/responsive-layout-grid.html#breakpoints).

This package implements responsive design with the following components: 
- Primary navigation items (usually placed in `BottomAppBar`) 
- Secondary navigation components in a navigation menu (usually a `Drawer`)
- A side sheet (usually a `Drawer`)

How the layout look...
- On phones: 
	- The primary navigation items are in a Bottom Navigation Bar (`BottomAppBar`)
	- The secondary navigation items are in a modal Navigation Drawer (`Scaffold.drawer`)
	- The side sheet is modal (placed in `Scaffold.endDrawer`)
- On tablets in portrait mode: 
	- The primary navigation items are in a Navigation Rail (`NavigationRail`)
	- The secondary navigation items are in a modal Navigation Drawer (`Scaffold.drawer`)
	- The side sheet is modal (placed in `Scaffold.endDrawer`)
- On tablets in landscape mode:
	- The primary navigation items are in a Navigation Rail (`NavigationRail`)
	- The secondary navigation items are in a modal Navigation Drawer (`Scaffold.drawer`)
	- The side sheet is a standard (persistent) side sheet 
- On desktop: 
	- All navigation items are combined in a standard (persistent) Navigation Drawer
	- The side sheet is a standard (persistent) side sheet

Check out the example for a runnable usage
