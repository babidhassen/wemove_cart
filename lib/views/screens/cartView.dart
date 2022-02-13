import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:wemove_cart/viewmodels/cartViewModel.dart';
import 'package:provider/provider.dart';
import '../widgets/customAppbar.dart';
import '../widgets/customStepper.dart';
import '../widgets/roundedTextButton.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar('Mon Panier'),
      body: Builder(
        builder: (context) {
          return Stack(
            children: <Widget>[
              createCartList(context),
              createHeader(context),
              footer(context)
            ],
          );
        },
      ),
    );
  }

  footer(BuildContext context) {
    return Positioned(
      bottom: 0.00,
      left: MediaQuery.of(context).size.width * 0.05,
      right: MediaQuery.of(context).size.width * 0.05,
      child: Container(
        //   alignment: Alignment.center,
        height: 85,
        width: MediaQuery.of(context).size.width - 5,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(40), topLeft: Radius.circular(40))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(height: 20.0),
                        const Text('Total',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                        Text(
                          Provider.of<CartViewModel>(context, listen: false)
                              .totalPrice
                              .toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(right: 15, bottom: 10, top: 10),
              child: RoundedTextButton(
                color: Theme.of(context).primaryColor,
                onPress: () => {log('next pressed !')},
                text: 'Continuer',
              ),
            ),
          ],
        ),
      ),
    );
  }

  createHeader(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).size.height * 0.06,
        right: 0.0,
        left: 0.0,
        child: Container(
          decoration: BoxDecoration(color: Theme.of(context).primaryColorDark),
          alignment: Alignment.topRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              const SizedBox(
                child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () => {
                  Provider.of<CartViewModel>(context, listen: false)
                      .clearItem(),
                  log("clearing")
                },
                child: const Text('Vider le panier',
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline)),
              ),
            ],
          ),
          margin: const EdgeInsets.only(left: 15, top: 30),
        ));
  }

  createCartList(context) {
    return Provider.of<CartViewModel>(context).items.isEmpty
        ? Positioned(
            top: MediaQuery.of(context).size.height * 0.5,
            left: MediaQuery.of(context).size.width * 0.35,
            child: const SizedBox(
                child: Text(
              'No items',
              style: TextStyle(fontSize: 30),
            )))
        : Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            right: MediaQuery.of(context).size.width * 0.03,
            bottom: MediaQuery.of(context).size.height * 0.09,
            left: MediaQuery.of(context).size.width * 0.03,
            child: SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, position) {
                  return createCartListItem(context, position);
                },
                itemCount: Provider.of<CartViewModel>(context).items.length,
              ),
            ));
  }

  createCartListItem(context, position) {
    return Container(
      child: Consumer<CartViewModel>(
          builder: (context, cart, child) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(height: 10.0),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          height: 70,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Theme.of(context).primaryColor),
                          child: Column(children: <Widget>[
                            Container(height: 10.0),
                            const Text(
                              'Jeudi 10',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            const Text('Fev',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20))
                          ]),
                        ),
                        Container(height: 8),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cart.items[position].product.name,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 30)),
                              Text(cart.items[position].product.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  )),
                              Container(height: 15),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_today,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                  Container(width: 15),
                                  const Text(
                                    'De 19H00 à 20H00',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ],
                              ),
                              Container(height: 10),
                              const Text(
                                'Places réservées : 1 ',
                                style: TextStyle(color: Colors.white),
                              ),
                              Container(height: 10),
                              Row(
                                children: [
                                  Text(
                                    cart.items[position].product.price
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  ),
                                  const Text('dt',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15))
                                ],
                              )
                            ],
                          ),
                        ),
                      ]),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: const EdgeInsets.all(5.0),
                          child: IconButton(
                            icon: const Icon(Icons.delete),
                            color: Colors.white,
                            iconSize: 40,
                            onPressed: () {
                              Provider.of<CartViewModel>(context, listen: false)
                                  .deleteItem(position);
                            },
                          )),
                      Container(
                        margin: const EdgeInsets.all(15.0),
                        child: MyCustomCounter(
                          onIncrement: (value) {
                            Provider.of<CartViewModel>(context, listen: false)
                                .incrementItem(position);
                          },
                          onDecrement: (value) {
                            Provider.of<CartViewModel>(context, listen: false)
                                        .items[position]
                                        .quantity ==
                                    1
                                ? Provider.of<CartViewModel>(context,
                                        listen: false)
                                    .deleteItem(position)
                                : Provider.of<CartViewModel>(context,
                                        listen: false)
                                    .decrementItem(position);
                          },
                        ),
                      ),
                    ],
                  )
                ],
              )),
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
              Provider.of<CartViewModel>(context).items[position].product.image,
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              const Color.fromARGB(255, 1, 25, 88).withOpacity(0.5),
              BlendMode.darken,
            )),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
    );
  }
}
