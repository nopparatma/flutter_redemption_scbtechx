import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redemption_scbtechx/ui/router.dart';
import 'package:flutter_redemption_scbtechx/ui/shared/theme.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../bloc/application/application_bloc.dart';
import '../../bloc/splash_load/splash_load_bloc.dart';
import '../../services/redemption_service.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late final SplashLoadBloc _splashLoadBloc;

  @override
  void initState() {
    _splashLoadBloc = SplashLoadBloc(BlocProvider.of<ApplicationBloc>(context), RedemptionService());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _splashLoadBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _splashLoadBloc,
      child: SplashPage(splashLoadBloc: _splashLoadBloc),
    );
  }
}

class SplashPage extends StatefulWidget {
  final SplashLoadBloc splashLoadBloc;

  const SplashPage({Key? key, required this.splashLoadBloc}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    widget.splashLoadBloc.add(SplashLoadInitEvent());
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget.splashLoadBloc,
      child: BlocListener(
        bloc: widget.splashLoadBloc,
        listener: (context, state) async {
          if (state is SuccessSplashLoadInitState) {
            Navigator.pushNamedAndRemoveUntil(context, RoutePaths.productListPage, (route) => false);
          }
        },
        child: Scaffold(
          key: const Key('INIT_SPLASH_PAGE'),
          body: InkWell(
            onTap: () {},
            child: Stack(
              fit: StackFit.expand,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        key: const Key('LOADING_SPLASH'),
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LoadingAnimationWidget.discreteCircle(
                            color: Colors.deepPurple,
                            size: 100,
                          ),
                          const SizedBox(height: 40),
                          Text(
                            'Loading...',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.xLarger.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 40),
                          Text(
                            'Redemption App',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.large.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 40),
                          Text(
                            'Presented by Nopparat Manoi',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.large,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
