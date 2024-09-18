import 'package:flutter/material.dart';

import 'home.dart';

class PaymentInfo extends StatelessWidget {
  const PaymentInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Payment Information",
          style: TextStyle(
            fontSize: 16,
            color: Color(0xff1F126B),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildPaymentMethodSection(),
            const SizedBox(height: 16),
            _buildCardDetailsSection(),
            const Spacer(),
            _buildFooterButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose a payment method',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        RadioListTile(
          value: 'Credit card',
          groupValue: 'Credit card',
          title: const Text('Credit card'),
          onChanged: (value) {},
        ),
        RadioListTile(
          value: 'Paypal',
          groupValue: null,
          title: const Text('Paypal'),
          onChanged: (value) {},
        ),
        RadioListTile(
          value: 'Cash',
          groupValue: null,
          title: const Text('Cash'),
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget _buildCardDetailsSection() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0x33000000),
          width: 0.5,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(2.0),
          topRight: Radius.circular(25.0),
          bottomLeft: Radius.circular(25.0),
          bottomRight: Radius.circular(25.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              activeTrackColor: const Color(0xff583EF2),
              inactiveThumbColor: const Color(0xff000000),
              value: true,
              onChanged: (bool value) {},
              title: const Text('Save card information'),
            ),
            _buildTextField(label: 'Card holder’s name', value: 'John Smith'),
            const SizedBox(height: 16),
            _buildTextField(label: 'Card number', value: '1233 2343 2432 2243'),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                    child: _buildTextField(label: 'Valid til', value: '12/21')),
                const SizedBox(width: 16),
                Expanded(child: _buildTextField(label: 'CVV', value: '***')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildFooterButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              )); // Ensure this route exists
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF583EF2),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: const Text(
          'Next',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
