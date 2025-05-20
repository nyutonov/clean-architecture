part of "main_mixin.dart";

class MainScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainScreen({
    super.key,
    required this.navigationShell,
  });

  @override
  State<MainScreen> createState() => _MainState();
}

class _MainState extends State<MainScreen> with MainMixin, TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: widget.navigationShell.currentIndex == 0,
      onPopInvokedWithResult: (didPop, dynamic) => onPageChanged(0),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: context.color.background,
        ),
        child: Scaffold(
          body: widget.navigationShell,
          bottomNavigationBar: BottomAppBar(
            padding: EdgeInsets.zero,
            height: 64,
            elevation: 0,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: context.color.color9f9,
                    width: 1,
                  ),
                ),
              ),
              child: BottomNavigationBar(
                backgroundColor: context.color.background,
                currentIndex: widget.navigationShell.currentIndex,
                onTap: onPageChanged,
                elevation: 0,
                selectedLabelStyle: context.textStyle.selectedBottomBar,
                unselectedLabelStyle: context.textStyle.unselectedBottomBar,
                selectedItemColor: context.colorScheme.secondary,
                unselectedItemColor: context.color.color888,
                selectedFontSize: 10,
                unselectedFontSize: 10,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                items: [
                  BottomNavigationBarItem(
                    icon: SizedBox(
                      height: 34,
                      width: 34,
                      child: Padding(
                        padding: PUtils.kPaddingAll2,
                        child: SvgPicture.asset(
                          (widget.navigationShell.currentIndex == 0) ? PIcons.homeFilled : PIcons.homeOutlined,
                        ),
                      ),
                    ),
                    label: "Главная",
                  ),
                  BottomNavigationBarItem(
                    icon: SizedBox(
                      height: 34,
                      width: 34,
                      child: Padding(
                        padding: PUtils.kPaddingAll2,
                        child: SvgPicture.asset(
                          (widget.navigationShell.currentIndex == 1) ? PIcons.noteFilled : PIcons.noteOutlined,
                        ),
                      ),
                    ),
                    label: "Рядом",
                  ),
                  BottomNavigationBarItem(
                    icon: SizedBox(
                      height: 34,
                      width: 34,
                      child: Padding(
                        padding: PUtils.kPaddingAll2,
                        child: SvgPicture.asset(
                          (widget.navigationShell.currentIndex == 2) ? PIcons.favoriteFilled : PIcons.favoriteOutlined,
                        ),
                      ),
                    ),
                    label: "Хочу пойти",
                  ),
                  BottomNavigationBarItem(
                    icon: SizedBox(
                      height: 34,
                      width: 34,
                      child: Padding(
                        padding: PUtils.kPaddingAll2,
                        child: SvgPicture.asset(
                          (widget.navigationShell.currentIndex == 3) ? PIcons.usersFilled : PIcons.usersOutlined,
                        ),
                      ),
                    ),
                    label: "Люди",
                  ),
                  BottomNavigationBarItem(
                    icon: SizedBox(
                      height: 34,
                      width: 34,
                      child: Padding(
                        padding: PUtils.kPaddingAll2,
                        child: SvgPicture.asset(
                          (widget.navigationShell.currentIndex == 4) ? PIcons.chatFilled : PIcons.chatOutlined,
                        ),
                      ),
                    ),
                    label: "Чаты",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
