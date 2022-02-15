import 'package:flapp/controller/counter_controller.dart';
import 'package:flapp/gen/assets.gen.dart';
import 'package:flapp/hooks/use_l10n.dart';
import 'package:flapp/theme/app_text_theme.dart';
import 'package:flapp/theme/app_theme.dart';
import 'package:flapp/ui/home/home_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final notifier = ref.watch(homePageProvider.notifier);
    final isUpdating =
        ref.watch(homePageProvider.select((value) => value.isUpdating));
    final l10n = useL10n();

    return ref.watch(counterController).when(
          data: (data) {
            return Scaffold(
              body: SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.img.flutterIcon.image(width: 200),
                      Text(
                        l10n.hello,
                        style: theme.textTheme.h70.bold(),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: theme.appColors.primary,
                          onPrimary: theme.appColors.onPrimary,
                        ),
                        onPressed: notifier.onPressedIncrementButton,
                        child: Text(data.count.toString()),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          error: (e, msg) => Scaffold(
            body: SafeArea(
              child: Center(
                child: Text(
                  e.toString(),
                  style: theme.textTheme.h30,
                ),
              ),
            ),
          ),
          loading: () => Scaffold(
            body: SafeArea(
              child: Center(
                child: CircularProgressIndicator(
                  color: theme.appColors.primary,
                ),
              ),
            ),
          ),
        );
  }
}
