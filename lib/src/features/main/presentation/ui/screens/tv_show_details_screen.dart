import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelflix/src/app/services_locator.dart';
import 'package:marvelflix/src/features/main/presentation/controllers/tv_show_controller/tv_show_details_cubit.dart';
import 'package:marvelflix/src/features/main/presentation/ui/widgets/tv_show_details_widget.dart';

class TvShowDetailsScreen extends StatelessWidget {
  final int id;

  const TvShowDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            serviceLocator<TvShowDetailsCubit>()..getTvShowDetails(id),
        lazy: false,
        child: const TvShowDetailsWidget(),
      ),
    );
  }
}
