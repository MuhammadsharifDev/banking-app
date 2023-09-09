import 'package:banking_app/core/widgets/textstyle.dart';
import 'package:banking_app/presintation/main/cards/bloc/cards_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TitleListViewWidget extends StatelessWidget {
  const TitleListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return ListView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      children: [
        Container(
          width: media.size.width*250/362,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.account_balance,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 25,
                      width: 25,
                      child: SvgPicture.asset('assets/svg_icons/wifi.svg'),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.size.height * 10 / 812,
                ),
                StyleTextModel.items(
                    text: 'Your name', size: 15, color: Colors.white),
                StyleTextModel.items(
                    text: 'Your card number', size: 15, color: Colors.white),
                Stack(
                  children: [
                    BlocProvider(
                      create: (context) => CardsBloc(),
                      child: BlocBuilder<CardsBloc, CardsState>(
                        builder: (context, state) {
                          return IconButton(
                            onPressed: () {
                              context.read<CardsBloc>().add(
                                    IsLikeEvent(isLike: !state.isLike),
                                  );
                            },
                            icon: Icon(
                              state.isLike
                                  ? Icons.favorite
                                  : Icons.favorite_border_sharp,
                              color: state.isLike ? Colors.red : Colors.grey,
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset('assets/svg_icons/master_card.svg'),
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 300,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(15),
              gradient: const SweepGradient(
                colors: [
                  Colors.blue,
                  Colors.green,
                  Colors.indigo,
                  Colors.green,
                  Colors.yellow,
                ],
              )),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.account_balance,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 25,
                      width: 25,
                      child: SvgPicture.asset('assets/svg_icons/wifi.svg'),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.size.height * 10 / 812,
                ),
                StyleTextModel.items(
                    text: 'Your name', size: 15, color: Colors.white),
                StyleTextModel.items(
                    text: 'Your card number', size: 15, color: Colors.white),
                Stack(
                  children: [
                    BlocProvider(
                      create: (context) => CardsBloc(),
                      child: BlocBuilder<CardsBloc, CardsState>(
                        builder: (context, state) {
                          return IconButton(
                              onPressed: () {
                                context.read<CardsBloc>().add(IsLikeEvent(isLike: !state.isLike),);
                              },
                              icon: Icon(
                                state.isLike
                                    ? Icons.favorite
                                    : Icons.favorite_border_sharp,
                                color: state.isLike ? Colors.red : Colors.grey,
                              ),
                          );
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset('assets/svg_icons/master_card.svg'),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
