import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redemption_scbtechx/ui/router.dart';
import 'package:flutter_redemption_scbtechx/ui/shared/theme.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../bloc/splash_load/splash_load_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    context.read<SplashLoadBloc>().add(SplashLoadInitEvent());
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<SplashLoadBloc>(context),
      listener: (context, state) async {
        if (state is SuccessSplashLoadInitState) {
          Navigator.pushNamedAndRemoveUntil(context, RoutePaths.productListPage, (route) => false);
        }
      },
      child: Scaffold(
        body: InkWell(
          onTap: () {},
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: BlocBuilder<SplashLoadBloc, SplashLoadState>(
                      builder: (context, state) {
                        if (state is LoadingSplashLoadInitState) {
                          return Column(
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
                          );
                        }

                        return Container();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
