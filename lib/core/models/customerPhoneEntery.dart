class CustomerPhone {
  String? phone;
  int? custID;

  CustomerPhone({
     this.phone,
     this.custID,
  });

  Map<String, dynamic> toMap() {
    return {
      'Phone': phone,
      'Cust_ID': custID,
    };
  }
}
