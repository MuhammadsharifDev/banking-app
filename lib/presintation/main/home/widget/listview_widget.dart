import 'package:banking_app/core/widgets/textstyle.dart';
import 'package:banking_app/presintation/main/home/cubit/getcard_cubit.dart';
import 'package:banking_app/presintation/main/home/cubit/getcard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return BlocBuilder<GetCardCubit, GetCardState>(
  builder: (context, state) {
    return state is GetCardInSuccess?
    ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) => Container(
        width: 200,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(15),
          border:
          Border.all(color: Colors.white.withOpacity(0.5)),
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 10),
          ],),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.account_balance,color: Colors.white,),
                  SizedBox(
                      height: 30,
                      width: 30,
                      child: SvgPicture.asset('assets/svg_icons/wifi.svg')),

                ],
              ),
              SizedBox(height: media.size.height*20/812,),
              StyleTextModel.items(text: state.card[index].cardNumber, size: 20,color: Colors.white.withOpacity(0.5)),
              SizedBox(height: media.size.height*20/812,),
              StyleTextModel.items(text:state.card[index].name, size: 10,color: Colors.white),
              SizedBox(height: media.size.height*50/812,),
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
      separatorBuilder: (context, index) => SizedBox(
        width: media.size.width * 15 / 375,
      ),
    )
    :const CircularProgressIndicator();
  },
);
  }
}
