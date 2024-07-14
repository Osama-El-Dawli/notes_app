import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/theme_cubit/theme_cubit.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.icon,
    this.onPressed,
  });

  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Container(
          height: 46,
          width: 46,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: state is ThemeDark
                ? Colors.white.withOpacity(.05)
                : Colors.black.withOpacity(.05),
          ),
          child: Center(
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                icon,
                size: 28,
              ),
            ),
          ),
        );
      },
    );
  }
}
