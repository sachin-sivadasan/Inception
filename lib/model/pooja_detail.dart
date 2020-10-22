class PoojaDetail {
  final String poojaName, poojaDate, poojaAmount, personName;
  PoojaDetail({this.personName, this.poojaName, this.poojaDate, this.poojaAmount});

  Map<String, dynamic> toJson() =>
      {
        'poojaName': poojaName,
        'poojaDate': poojaDate,
        'poojaAmount': poojaAmount,
        'personName': personName,
      };
}
