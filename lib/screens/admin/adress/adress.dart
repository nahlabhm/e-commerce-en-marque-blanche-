


import 'package:appmobile/screens/admin/adress/service_adress.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../providers/provider.dart';
import '../../components/custom_surfix_icon.dart';
import '../../components/default.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = '/address';
  final String totalAmount;
  const AddressScreen({
    Key? key,
    required this.totalAmount,
  }) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}
enum DeliveryOption { homeDelivery, storePickup }
enum PayementOption { homePayement, storePickup }

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
    final TextEditingController cardController = TextEditingController();
      final TextEditingController cvController = TextEditingController();
        final TextEditingController dateController = TextEditingController();
  DeliveryOption selectedOption = DeliveryOption.homeDelivery;
    PayementOption selectedmethode = PayementOption.homePayement;



String formatCurrency(String totalAmount, String countryCode, String currencyCode) {
  final currencyFormatter = NumberFormat.currency(symbol: '', decimalDigits: 2, customPattern: '\u00a4#,##0.00');
  final currencySymbol = currencyFormatter.simpleCurrencySymbol(currencyCode);
  final amount = double.parse(totalAmount); // Convert the totalAmount to a numerical value
  final formattedAmount = currencyFormatter.format(amount);
  final currencyFormattedAmount = formattedAmount.replaceFirst('\u00a4', currencySymbol);
  return '$currencyFormattedAmount $currencyCode';
}

  String selectedCard = "";

  final _addressFormKey = GlobalKey<FormState>();

  String addressToBeUsed = "";
  List<PaymentItem> paymentItems = [];
  final AddressServices addressServices = AddressServices();

  @override
  void initState() {
    super.initState();
    paymentItems.add(
      PaymentItem(
        amount: widget.totalAmount,
        label: 'Total Amount',
        status: PaymentItemStatus.final_price,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    flatBuildingController.dispose();
    areaController.dispose();
    pincodeController.dispose();
    cardController.dispose();
        cvController.dispose();
            dateController.dispose();
  }
 void orders() {
  if (_addressFormKey.currentState!.validate()) {
 

    addressServices.placeOrder(
      context: context,
      username: flatBuildingController.text,
      address: areaController.text,
      telephone: int.parse(pincodeController.text),
      card: int.parse(cardController.text),
      cv: int.parse(cvController.text),
      createdAt: dateController.text,
      totalSum: double.parse(widget.totalAmount),
    );
  }
}


@override
  Widget build(BuildContext context) {
    var address = context.watch<UserProvider>().user?.address ?? '';

  return Scaffold(
    appBar: AppBar( 
      centerTitle: true,
    
      title:Column(
        children:[
       Text(
       "payement ",
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
      ),
     
        ]
      ),  
      leading: IconButton(
        icon: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black.withOpacity(0.2))),
          child: Center(
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 15,
              color: Colors.black,
            ),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
        
      elevation: 0,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
    ),
  
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            if (address.isNotEmpty)
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                    ),
                  child: Column(
  children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        address,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    ),
Text(
 
  formatCurrency( widget.totalAmount, 'US','TND'), // Replace 'US' with the desired country code
  style: TextStyle(
    fontSize: 18,
  ),
),

  
                 ] )
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'OR',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            Form(
              key: _addressFormKey,
              child: Column(
                children: [
                 buildadressFormField(),
                  const SizedBox(height: 10),
                  buildTelFormField(),
                                    const SizedBox(height: 10),
                             Column(
  children: [
              Text(
      'Methode de payement',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),

    Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: selectedOption == DeliveryOption.homeDelivery ? Colors.blue : Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ListTile(
            title: const Text('Payement en ligne'),
            leading: Radio<DeliveryOption>(
              value: DeliveryOption.homeDelivery,
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
            ),
          ),
        ],
      ),
    ),
    const SizedBox(height: 10),
    Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: selectedOption == DeliveryOption.storePickup ? Colors.blue : Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        title: const Text('Payement a la livraison'),
        leading: Radio<DeliveryOption>(
          value: DeliveryOption.storePickup,
          groupValue: selectedOption,
          onChanged: (value) {
            setState(() {
              selectedOption = value!;
            });
          },
        ),
      ),
    ),
    const SizedBox(height: 20),
    // Rest of your code
  ],
),

                             Column(
  children: [
              Text(
      'Methode de service',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),

    Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: selectedmethode == PayementOption.homePayement? Colors.blue : Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ListTile(
            title: const Text('Livraison a domicile'),
            leading: Radio<PayementOption>(
              value: PayementOption.homePayement,
              groupValue: selectedmethode,
              onChanged: (value) {
                setState(() {
                  selectedmethode = value!;
                });
              },
            ),
          ),
        ],
      ),
    ),
    const SizedBox(height: 10),
    Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: selectedmethode == PayementOption.storePickup ? Colors.blue : Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        title: const Text('Retrait en magazin'),
        leading: Radio<PayementOption>(
          value: PayementOption.storePickup,
          groupValue: selectedmethode,
          onChanged: (value) {
            setState(() {
              selectedmethode = value!;
            });
          },
        ),
      ),
    ),
    const SizedBox(height: 20),
    // Rest of your code
  ],
),

builnameFormField(),
 const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCard = "Visa";
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedCard == "Visa" ? Colors.blue : Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(
                        'assets/images/tw-visa-gold-card-498x280.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCard = "MasterCard";
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedCard == "MasterCard" ? Colors.blue : Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(
                        'assets/images/téléchargement (8).jpg',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCard = "Amex";
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedCard == "Amex" ? Colors.blue : Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(
                        'assets/images/téléchargement (9).jpg',
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCard = "Discover";
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedCard == "Discover" ? Colors.blue : Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(
                        'assets/images/téléchargement (10).jpg',
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ),
                ],
              ),
                  const SizedBox(height: 10),

                  buildCardFormField(),
                  const SizedBox(height: 10),
                  builcvFormField(),
                  const SizedBox(height: 10),
buildateFormField(),
                ],
              ),
            ),
                              const SizedBox(height: 30),

          DefaultButton(
  text: "Continue",
  onTap: () => orders(),
),

            ],
          ),
        ),
      ),
    );
  }


 TextFormField buildadressFormField() {
    TextEditingController address;
    return TextFormField(
       controller: areaController,
      
     validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your address  ';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "address",
        hintText: "Enter your address",
        enabledBorder: OutlineInputBorder  (
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kTextColor),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder  (
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kTextColor),
          gapPadding: 10,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/address-svgrepo-com.svg"),
      ),
    );
  }
   TextFormField builnameFormField() {
    TextEditingController username;
    return TextFormField(
       controller: flatBuildingController,
      
     validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your Titulaire  ';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Titulaire",
        hintText: "Enter your Titulaire",
        enabledBorder: OutlineInputBorder  (
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kTextColor),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder  (
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kTextColor),
          gapPadding: 10,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
   }
IntlPhoneField buildTelFormField() {
   TextEditingController telephone;
  return IntlPhoneField(
           controller: pincodeController,

    decoration: InputDecoration(
      labelText: "Number",
      hintText: "Enter your Number",
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: kTextColor),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: kTextColor),
        gapPadding: 10,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
    initialCountryCode: 'US', // Set the initial country code (e.g., 'US' for United States)
    onChanged: (phone) {
      // Handle the phone number changes
      print(phone.completeNumber); // Access the complete phone number
    },
   
  );
}

TextFormField buildCardFormField() {
  return TextFormField(
    controller: cardController,
  
    validator: (val) {
      if (val == null || val.isEmpty) {
        return 'Enter your Card';
      }
      return null;
    },
    decoration: InputDecoration(
      labelText: "Card Number",
      hintText: "Enter your Card Number",
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: kTextColor),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: kTextColor),
        gapPadding: 10,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
  );
}
   TextFormField builcvFormField() {
    TextEditingController cv;
    return TextFormField(
       controller: cvController,
      
     validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your cvv/cvc  ';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "CVV/CVC ",
        hintText: "Enter your CVV/CVC ",
        enabledBorder: OutlineInputBorder  (
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kTextColor),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder  (
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kTextColor),
          gapPadding: 10,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
   }
    TextFormField buildateFormField() {
    TextEditingController createdAt;
    return TextFormField(
       controller: dateController,
      onTap: () {
      DatePicker.showDatePicker(
        context,
        showTitleActions: true,
        onChanged: (date) {
          // Handle the selected date
          dateController.text = date.toString(); // Update the controller value
        },
        onConfirm: (date) {
          // Handle the confirmed date
          dateController.text = date.toString(); // Update the controller value
        },
      );
    },
    validator: (val) {
      if (val == null || val.isEmpty) {
        return 'Enter your Date';
      }
      return null;
    },
    decoration: InputDecoration(
      labelText: "Date",
      hintText: "Date",
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: kTextColor),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: kTextColor),
        gapPadding: 10,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
  );
}
}
class _BankCardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int maxLength = 16;
    final String digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), ''); // Remove non-digit characters
    String maskedText = '';

    final int valueLength = digitsOnly.length;

    for (int i = 0; i < valueLength; i += 4) {
      final int end = i + 4;
      if (end <= valueLength) {
        maskedText += '${digitsOnly.substring(i, end)} ';
      } else {
        maskedText += digitsOnly.substring(i);
        break;
      }
    }

    if (maskedText.length > maxLength + (maxLength ~/ 4)) {
      maskedText = maskedText.substring(0, maxLength + (maxLength ~/ 4));
    }

    return newValue.copyWith(
      text: maskedText,
      selection: TextSelection.collapsed(offset: maskedText.length),
    );
  }
}


