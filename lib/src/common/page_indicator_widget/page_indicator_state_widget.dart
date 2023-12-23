import 'package:space_app/src/ui/space_ui.dart';

class PageIndicatorLoading extends StatelessWidget {
  const PageIndicatorLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }
}

class PageIndicatorError extends StatelessWidget {
  final String? message;
  final VoidCallback? onRetry;

  const PageIndicatorError({super.key, this.onRetry, this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message ?? 'Something went wrong!',
        ),
        CupertinoButton(onPressed: onRetry, child: const Text('Retry')),
      ],
    );
  }
}

class PageIndicatorNotFound extends StatelessWidget {
  final VoidCallback? onRetry;

  const PageIndicatorNotFound({super.key, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Henüz gösterilecek bir şey yok! Tekrar denemek ister misin?',
        ),
        CupertinoButton(onPressed: onRetry, child: const Text('Retry')),
      ],
    );
  }
}
