import 'package:device_frame/device_frame.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

class DeviceSection extends StatefulWidget {
  const DeviceSection({super.key});

  @override
  State<DeviceSection> createState() => _DeviceSectionState();
}

class _DeviceSectionState extends State<DeviceSection> {
  final GlobalKey _webViewKey = GlobalKey();
  InAppWebViewController? _controller;
  PullToRefreshController? _pullToRefreshController;

  InAppWebViewSettings get _settings => InAppWebViewSettings(
    isInspectable: kDebugMode,
    mediaPlaybackRequiresUserGesture: false,
    allowsInlineMediaPlayback: true,
    iframeAllow: "camera; microphone",
    iframeAllowFullscreen: true,
    javaScriptEnabled: true,
    transparentBackground: true,
  );

  String _currentUrl = 'https://tgrangeo.github.io/ReflexeSP/';

  final urls = <({String label, String url, String description})>[
    (
      label: 'Reflexe SP',
      url: 'https://tgrangeo.github.io/ReflexeSP/',
      description:
          'Application Reflexe SP hébergée sur GitHub Pages.Application Reflexe SP hébergée sur GitHub Pages.Application Reflexe SP hébergée sur GitHub Pages.Application Reflexe SP hébergée sur GitHub Pages.Application Reflexe SP hébergée sur GitHub Pages.Application Reflexe SP hébergée sur GitHub Pages.',
    ),
    (
      label: 'InAppWebView',
      url: 'https://inappwebview.dev/',
      description: 'Documentation officielle de flutter_inappwebview.',
    ),
    (
      label: 'Flutter',
      url: 'https://flutter.dev/',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque a efficitur dui. Duis sem dui, dignissim a ornare id, facilisis sed dolor. Aenean sodales augue eu dignissim molestie. Duis sit amet nisi tincidunt, venenatis orci sed, iaculis tortor. Morbi euismod dolor sit amet cursus maximus. Quisque eros neque, lacinia sed fermentum quis, ullamcorper quis tellus. Etiam varius felis at nulla placerat commodo. Ut tempor in ante vitae fermentum. Vestibulum auctor pharetra nulla quis congue. Curabitur lobortis convallis venenatis. Suspendisse eget rutrum mi, a convallis nulla. Donec vitae orci nec nisi laoreet ultricies. Praesent ipsum lectus, lobortis sit amet urna in, \nfringilla consectetur ligula. Morbi ac ex non leo dictum finibus.Morbi tempor a dolor ac efficitur. Nulla sed tellus sit amet magna fringilla ultricies quis vulputate eros. Proin iaculis feugiat ante ut hendrerit. Suspendisse tincidunt urna ut mattis tristique. Cras ornare ultricies turpis, ut imperdiet ex imperdiet a. Nullam blandit ornare rhoncus. Fusce vel turpis ac magna vehicula laoreet ac non erat. Curabitur pretium elementum nibh sit amet posuere. Mauris tincidunt molestie dui a egestas. Etiam ut nisi tincidunt urna dictum efficitur ac nec ante. Curabitur sodales eros vel auctor\nhendrerit. Duis elementum lorem nec velit scelerisque, quis ornare felis imperdiet. Phasellus eget arcu est. Nullam maximus libero eget nulla pharetra, a pulvinar eros blandit.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    final isMobile =
        !kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.android);
    _pullToRefreshController = isMobile
        ? PullToRefreshController(
            settings: PullToRefreshSettings(color: Colors.blue),
            onRefresh: () async {
              if (defaultTargetPlatform == TargetPlatform.android) {
                _controller?.reload();
              } else if (defaultTargetPlatform == TargetPlatform.iOS) {
                final u = await _controller?.getUrl();
                if (u != null) {
                  _controller?.loadUrl(urlRequest: URLRequest(url: u));
                }
              }
            },
          )
        : null;
  }

  void _load(String url) {
    setState(() => _currentUrl = url);
    _controller?.loadUrl(urlRequest: URLRequest(url: WebUri(url)));
  }

  ({String label, String url, String description}) get _selected =>
      urls.firstWhere((e) => e.url == _currentUrl, orElse: () => urls.first);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Center(
      child: SizedBox(
        width: screenWidth * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Try out my projects", style: TextStyle(fontSize: 32)),
            const SizedBox(height: 20),
            SizedBox(
              height: screenHeight * 0.8,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 64),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: urls.map((e) {
                            final selected = _currentUrl == e.url;
                            return OutlinedButton(
                              onPressed: () => _load(e.url),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                  color: selected
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(
                                          context,
                                        ).colorScheme.outlineVariant,
                                ),
                              ),
                              child: Text(e.label),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 16),
                        Text(_selected.label, style: TextStyle(fontSize: 24)),
                        const SizedBox(height: 6),
                        SizedBox(
                          width: screenWidth * 0.18,
                          child: Text(
                            _selected.description,
                            style: TextStyle(fontSize: 18),
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 32),
                  Center(child: _deviceFrame()),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.2),
          ],
        ),
      ),
    );
  }

  Widget _deviceFrame() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withAlpha(58),
            blurRadius: 20,
            spreadRadius: 3,
          ),
        ],
      ),
      child: DeviceFrame(
        device: Devices.android.googlePixel9,
        isFrameVisible: true,
        orientation: Orientation.portrait,
        screen: InAppWebView(
          key: _webViewKey,
          initialUrlRequest: URLRequest(url: WebUri(_currentUrl)),
          initialSettings: _settings,
          pullToRefreshController: _pullToRefreshController,
          onWebViewCreated: (c) => _controller = c,
          onPermissionRequest: (controller, request) async {
            return PermissionResponse(
              resources: request.resources,
              action: PermissionResponseAction.GRANT,
            );
          },
          shouldOverrideUrlLoading: (controller, action) async {
            final uri = action.request.url;
            if (uri == null) return NavigationActionPolicy.ALLOW;
            final allowed = {
              "http",
              "https",
              "file",
              "chrome",
              "data",
              "javascript",
              "about",
            };
            if (!allowed.contains(uri.scheme)) {
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
                return NavigationActionPolicy.CANCEL;
              }
            }
            return NavigationActionPolicy.ALLOW;
          },
        ),
      ),
    );
  }
}
