import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redemption_scbtechx/bloc/application/application_bloc.dart';
import 'package:flutter_redemption_scbtechx/bloc/redemption/redemption_bloc.dart';
import 'package:flutter_redemption_scbtechx/bloc/splash_load/splash_load_bloc.dart';
import 'package:flutter_redemption_scbtechx/services/redemption_service.dart';
import 'package:flutter_redemption_scbtechx/ui/router.dart';
import 'package:flutter_redemption_scbtechx/ui/view/splash_page.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ApplicationBloc>(
          create: (context) => ApplicationBloc(),
        ),
        BlocProvider<RedemptionBloc>(
          create: (context) => RedemptionBloc(BlocProvider.of<ApplicationBloc>(context)),
        ),
      ],
      child: GlobalLoaderOverlay(
        useDefaultLoading: false,
        overlayOpacity: 0.5,
        overlayColor: Colors.black,
        overlayWidget: buildOverlayLoader(),
        child: MaterialApp(
          title: 'Flutter Redemption',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
          ),
          onGenerateRoute: MobileRouter.generateRoute,
          home: const Splash(),
        ),
      ),
    );
  }

  Widget buildOverlayLoader() {
    return Center(
      child: LoadingAnimationWidget.discreteCircle(
        color: Colors.deepPurple,
        size: 100,
      ),
    );
  }
}
