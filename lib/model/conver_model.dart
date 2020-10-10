import 'package:inception/model/unit_model.dart';

class ConvertModel {
  final BigInt inBytes;
  final String from;

  ConvertModel(this.inBytes, this.from);

  List<UnitModel> toAllConvertions() {
//    if (inBytes <= 0)
//      return <UnitModel>[
//        UnitModel('KB', '0'),
//        UnitModel('MB', '0'),
//        UnitModel('GB', '0')
//      ];
    var kb = toKB(inBytes);
    var mb = toMB(inBytes);
    var gb = toGB(inBytes);
    return <UnitModel>[
      UnitModel('KB', kb),
      UnitModel('MB', mb),
      UnitModel('GB', gb)
    ];
  }

  String toSelectedConvertion() {
    return '1024 $from';
  }

  toGB(BigInt bytes) {
    if (bytes >= BigInt.from(1073741824))
      return (bytes / BigInt.from(1073741824)).toStringAsFixed(2) + "";
    else
      return "0 GB";
  }

  toMB(BigInt bytes) {
    if (bytes >= BigInt.from(1048576))
      return (bytes / BigInt.from(1048576)).toStringAsFixed(2) + "";
    else
      return "0 MB";
  }

  toKB(BigInt bytes) {
    if (bytes >= BigInt.from(1024))
      return (bytes / BigInt.from(1024)).toStringAsFixed(2) + "";
    else
      return "0";
  }

  toByte(BigInt bytes) {
    return (bytes).toString() + " byte";
  }

//  function formatSizeUnits(bytes){
//    if      (bytes >= 1073741824) { bytes = (bytes / 1073741824).toFixed(2) + " GB"; }
//    else if (bytes >= 1048576)    { bytes = (bytes / 1048576).toFixed(2) + " MB"; }
//    else if (bytes >= 1024)       { bytes = (bytes / 1024).toFixed(2) + " KB"; }
//    else if (bytes > 1)           { bytes = bytes + " bytes"; }
//    else if (bytes == 1)          { bytes = bytes + " byte"; }
//    else                          { bytes = "0 bytes"; }
//    return bytes;
//  }
}
