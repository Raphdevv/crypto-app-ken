import 'package:flutter/material.dart';

import '../const/app_colors.dart';

class TemplageBg extends StatefulWidget {
  final Widget child;
  final bool showbg;
  const TemplageBg({
    super.key,
    required this.child,
    required this.showbg,
  });

  @override
  State<TemplageBg> createState() => _TemplageBgState();
}

class _TemplageBgState extends State<TemplageBg> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primaryColor,
              AppColors.primaryColor,
              AppColors.primaryColor,
              AppColors.primaryTwoColor,
            ],
          ),
          image: widget.showbg
              ? const DecorationImage(
                  image: AssetImage('assets/images/mining.png'),
                  scale: 2,
                  alignment: Alignment.bottomRight,
                )
              : null,
        ),
        child: widget.child,
      ),
    );
  }
}
