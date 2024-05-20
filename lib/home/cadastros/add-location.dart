import 'dart:io';

import 'package:appjobsflutter/components/button-component.dart';
import 'package:appjobsflutter/components/dialog-component.dart';
import 'package:appjobsflutter/components/field-component.dart';
import 'package:appjobsflutter/home/lists/all-enterprises.dart';
import 'package:appjobsflutter/models/location.dart';
import 'package:appjobsflutter/service/location-service.dart';
import 'package:flutter/material.dart';

class LocationAdd extends StatefulWidget {
  @override
  _LocationAddState createState() => _LocationAddState();
}

class _LocationAddState extends State<LocationAdd> {
  final streetAddress = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final stateProvince = TextEditingController();

  clean() {
    streetAddress.clear();
    postalCode.clear();
    city.clear();
    stateProvince.clear();
  }

  goToViewAll() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AllEntreprises()));
  }

  openCallsDialogSucess(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SucessInfoAlert(
            labelText: 'view all',
            onPressed: () {
              goToViewAll();
            },
            title: "Save Item",
            message: "Success item save",
          );
        });
  }

  openErrorSave(message) {
    return showDialog(
        context: context,
        builder: (context) {
          return SucessInfoAlert(
            labelText: 'view all',
            onPressed: () {
              goToViewAll();
            },
            title: "Error on Save",
            message: "Error on save the item" + message,
          );
        });
  }

  add() {
    try {
      Location location = new Location(
          id: 0,
          streetAddress: streetAddress.text,
          postalCode: postalCode.text,
          city: city.text,
          stateProvince: stateProvince.text);
      locationService.add(location.toJson());
      openCallsDialogSucess(context);
    } on HttpException catch (e) {
      openErrorSave(e.message);
    }
  }

  validateForm() {
    if (streetAddress.text.isEmpty &&
        postalCode.text.isEmpty &&
        city.text.isEmpty &&
        stateProvince.text.isEmpty) {
      return showDialog(
          context: context,
          builder: (context) {
            return SucessInfoAlert(
              labelText: 'view all',
              onPressed: () {
                goToViewAll();
              },
              title: "Validate Error",
              message: "All Fields is Empty",
            );
          });
    } else {
      add();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Enterprise",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  FieldComponent(
                      controller: streetAddress,
                      labelText: "Street Address",
                      icon: Icon(Icons.location_city),
                      obscureText: false,
                      tipoEntrada: TextInputType.text),
                  SizedBox(
                    height: 8,
                  ),
                  FieldComponent(
                      controller: postalCode,
                      labelText: "Postal Code",
                      icon: Icon(Icons.ad_units),
                      obscureText: false,
                      tipoEntrada: TextInputType.text),
                  SizedBox(
                    height: 8,
                  ),
                  FieldComponent(
                      controller: city,
                      labelText: "City",
                      icon: Icon(Icons.location_city),
                      obscureText: false,
                      tipoEntrada: TextInputType.text),
                  SizedBox(
                    height: 8,
                  ),
                  FieldComponent(
                      controller: stateProvince,
                      labelText: "State Province",
                      icon: Icon(Icons.flag),
                      obscureText: false,
                      tipoEntrada: TextInputType.text),
                  SizedBox(
                    height: 8,
                  ),
                  ButtonIconComponent(
                    texto: "save",
                    icon: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      validateForm();
                    },
                    color: Colors.blue,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ButtonIconComponent(
                    texto: "clean",
                    icon: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      clean();
                    },
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
