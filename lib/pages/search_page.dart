import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/controllers/app_cubit/app_cubit.dart';
import 'package:news_app/controllers/app_cubit/app_states.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/widgets/news_item.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    onChanged: (value) {
                      if (value != ' ') {
                        AppCubit.get(context).searchInNews(query: value);
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "search about any thing",
                        hintStyle: GoogleFonts.abyssinicaSil(),
                        suffixIcon: const Icon(Icons.search),
                        border: InputBorder.none,
                        fillColor: Colors.grey[100],
                        filled: true),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    " Search Result",
                    style: GoogleFonts.asap(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: state is SearchLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.blue,
                            ),
                          )
                        : ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: AppCubit.get(context).searchList.length,
                            itemBuilder: (context, index) {
                              var model =
                                  AppCubit.get(context).searchList[index];
                              return NewsItem(model: model);
                            }),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
