import 'package:flutter/material.dart';

import '../../alerts/errors/error_widgets/general_error_widget.dart';
import '../../alerts/errors/error_widgets/internet_error_widget.dart';
import '../../alerts/errors/error_widgets/server_error_widget.dart';
import '../../network/api_service.dart';
import '../../utils/base_extensions.dart';

class AppErrorWidget extends StatefulWidget {
  final Object? error;
  final Widget? onServerError, onInternetError, onGeneralError;
  final VoidCallback onRetry;
  final bool withBackgroundColor;

  const AppErrorWidget({
    super.key,
    this.onServerError,
    this.onInternetError,
    required this.error,
    required this.onRetry,
    this.onGeneralError,
    this.withBackgroundColor = false,
  });

  @override
  State<AppErrorWidget> createState() => _AppErrorWidgetState();
}

class _AppErrorWidgetState extends State<AppErrorWidget> {
  Failure? _failure;

  Widget _buildErrorWidget() {
    switch (_failure?.type) {
      case ApiService.firebaseException:
      case ApiService.authException:
        return widget.onServerError ?? const ServerErrorWidget();
      case ApiService.timeoutException:
      case ApiService.socketException:
        return widget.onInternetError ?? InternetErrorWidget(onRetry: widget.onRetry);
      default:
        return widget.onGeneralError ?? const GeneralErrorWidget();
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.error is Failure) {
      _failure = widget.error as Failure;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: widget.withBackgroundColor ? MaterialType.canvas : MaterialType.transparency,
      color: context.colorScheme.surface,
      child: _buildErrorWidget(),
    );
  }
}
