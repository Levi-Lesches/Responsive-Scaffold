import "package:flutter/material.dart";

/// Defines a common interface for [BottomNavigationBar] and [NavigationRail].
/// 
/// This class maps to both [BottomNavigationBarItem] and 
/// [NavigationRailDestination] with an [icon] and [label] property.
@immutable
class NavigationItem {
	/// The icon for this item.
	final Widget icon;

	/// The label for this item.
	/// 
	/// May also be used as semantics and tooltips.
	final String label;

	/// Creates an abstraction for a navigation item.
	const NavigationItem({required this.icon, required this.label});

	/// Generates an item for [BottomNavigationBar].
	BottomNavigationBarItem get bottomNavBar => 
		BottomNavigationBarItem(icon: icon, label: label);

	/// Generates an item for [NavigationRail].
	NavigationRailDestination get navRail => 
		NavigationRailDestination(icon: icon, label: Text(label));
}
