import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/blocs/settings_bloc/settings_bloc.dart';
import 'package:flutter_test_project/screens/schedule_screen.dart';
import 'package:flutter_test_project/widgets/indicator.dart';
import 'package:flutter_test_project/widgets/next_button.dart';
import 'package:flutter_test_project/widgets/typography.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final int _numPages = 4;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  static const List<String> _assetPaths = [
    'assets/images/max.png',
    'assets/images/schedule.png',
    'assets/images/computer-engineer.png',
    'assets/images/geography.png',
  ];

  static const List<String> titlesTexts = [
    'Добро пожаловать!',
    'Смотри расписание!',
    'Будь в курсе в любой момент!',
    'Узнай как пользоваться!',
  ];

  static const List<String> contentTexts = [
    'Это приложение было создано студентами для студентов',
    'В столовой ты или на парах - оказывается, расписание можно смотреть и без всяких файлов',
    'Иногда так лень открывать файл в Excel и искать нужную тебе информацию, мы это исправили',
    'Просто нажми на главном экране на плюс в правом нижнем углу, выставь свою группу и количество групп на потоке. Довольствуйся расписанием!',
  ];

  List<Widget> _buildPageView() {
    return List.generate(_numPages, (index) {
      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: LayoutBuilder(
              builder: (context, c) {
                final imgMaxH = c.maxHeight * 0.5;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: imgMaxH,
                        maxWidth: 420,
                      ),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Image.asset(_assetPaths[index]),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Text(
                        titlesTexts[index],
                        style: Style.h4,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Text(
                        contentTexts[index],
                        style: Style.bodyL,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageStateKey = GlobalKey<_PageIndicatorsState>();

    final Widget pageIndicator = PageIndicators(
      key: pageStateKey,
      onClick: () {
        if (_currentPage < _numPages - 1) {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        }
      },
      dotsNum: _numPages,
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: PageView(
                allowImplicitScrolling: true,
                physics: const ClampingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (int page) {
                  _currentPage = page;
                  pageStateKey.currentState?.updateWith(_currentPage);
                },
                children: _buildPageView(),
              ),
            ),
            pageIndicator,
          ],
        ),
      ),
    );
  }
}

class PageIndicators extends StatefulWidget {
  const PageIndicators({
    Key? key,
    required this.onClick,
    required this.dotsNum,
  }) : super(key: key);

  final VoidCallback onClick;
  final int dotsNum;

  @override
  State<PageIndicators> createState() => _PageIndicatorsState();
}

class _PageIndicatorsState extends State<PageIndicators> {
  int _currentPage = 0;

  void updateWith(int value) {
    setState(() {
      _currentPage = value;
    });
  }

  List<Widget> _buildPageIndicators(int currentPage) {
    return List.generate(
      widget.dotsNum,
      (i) => i == currentPage
          ? const IndicatorPageView(isActive: true)
          : const IndicatorPageView(isActive: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SettingsBloc>();

    return Padding(
      padding:
          const EdgeInsets.only(bottom: 24.0, left: 16.0, right: 16.0, top: 8),
      child: Row(
        children: [
          // Skip слева
          if (widget.dotsNum - 1 != _currentPage)
            TextButton(
              onPressed: () {
                bloc.add(ChangeSettings(
                  bloc.settings.themeMode,
                  bloc.settings.group,
                  bloc.settings.numOfGroups,
                  false,
                  false,
                ));
                pushToMainScreen(context);
              },
              child: Text(S.of(context).pass, style: Style.buttonS),
            )
          else
            const SizedBox(width: 64),

          Expanded(
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: _buildPageIndicators(_currentPage),
              ),
            ),
          ),

          NextPageViewButton(
            isLastPage: widget.dotsNum - 1 == _currentPage,
            onClick: widget.onClick,
          ),
        ],
      ),
    );
  }

  void pushToMainScreen(BuildContext context) {
    final bloc = context.read<SettingsBloc>();
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ScheduleScreen({'group': bloc.settings.group}),
      ),
    );
  }
}
