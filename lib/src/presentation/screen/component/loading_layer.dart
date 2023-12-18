import 'package:diary_app/src/core/provider/loading_provider.dart';
import 'package:diary_app/values/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingLayer extends StatelessWidget {
  final Widget child;
  const LoadingLayer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Consumer(
          builder: (context, ref, child) {
            final model = ref.watch(loadingProvider);
            return model.loading
                ? Material(
                    color: blackColor.withOpacity(.3),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : const SizedBox();
          },
        )
      ],
    );
  }
}
