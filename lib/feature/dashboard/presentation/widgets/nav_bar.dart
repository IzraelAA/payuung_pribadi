import 'package:flutter/material.dart';
import 'package:payuung_pribadi/feature/dashboard/presentation/widgets/nav_bar_panel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  ///The controller of sliding up panel
  PanelController panelController = PanelController();
  bool isExpanse = false;

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: panelController,
      minHeight: 100,
      // Minimum height
      maxHeight: 300,
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      panelBuilder: (controller) => NavBarPanel(
        controller: controller,
        isExpanse: isExpanse,
      ),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      color: Colors.transparent,
      boxShadow: const [],
      onPanelOpened: () => setState(() {
        isExpanse = true;
      }),
      onPanelClosed: () => setState(() {
        isExpanse = false;
      }),
    );
  }
}
