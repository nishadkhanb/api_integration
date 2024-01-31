import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Services {
  Future pickdate(context, TextEditingController date) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
   // date.text = picked.toString();
    if (picked!=null)
      {
        String formatteddate=DateFormat('dd MMM yyyy').format(picked);
        date.text=formatteddate;
      }
  }
}
