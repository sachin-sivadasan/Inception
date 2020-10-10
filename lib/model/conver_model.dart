import 'package:inception/model/unit_model.dart';

class ConvertModel {
  final BigInt value;
  final String from;
  final String to;
  BigInt bytes = BigInt.from(0);

  ConvertModel(this.value, this.from, this.to);

  List<UnitModel> toAllConvertions() {
    var bytes = convertToBytes(value);
    print('$value $from converted to $bytes bytes');
    if (bytes <= BigInt.from(0))
      return <UnitModel>[
        UnitModel('KB', '0'),
        UnitModel('MB', '0'),
        UnitModel('GB', '0')
      ];
    var kb = toKB(bytes);
    var mb = toMB(bytes);
    var gb = toGB(bytes);
    return <UnitModel>[
      UnitModel('Bytes', bytes.toString()),
      UnitModel('KB', kb),
      UnitModel('MB', mb),
      UnitModel('GB', gb)
    ];
  }

  String toSelectedConvertion() {
    var bytes = convertToBytes(value);
    print('$value $from converted to $bytes bytes');
    if(to == 'KB') return toKB(bytes);
    else if(to == 'MB') return toMB(bytes);
    else if(to == 'GB') return toGB(bytes);
    return '$value Bytes';
  }

  toGB(BigInt bytes) {
    try {
      if (bytes >= BigInt.from(1073741824))
            return (bytes / BigInt.from(1073741824)).toStringAsFixed(2) + "";
          else
            return "0 GB";
    } catch (e) {
      print(e);
    }
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

  convertToBytes(BigInt inBytes) {
    print(' $from -  $to');
    if(from == 'KB') return fromKB(inBytes);
    else if(from == 'MB') return fromMB(inBytes);
    else if(from == 'GB') return fromGB(inBytes);
    else return inBytes;
  }

  fromKB(BigInt bytes) {
    return bytes * BigInt.from(1024);
  }

  fromMB(BigInt bytes) {
    return bytes * BigInt.from(1024 * 1024);
  }

  fromGB(BigInt bytes) {
    return bytes * BigInt.from(1024 * 1024 * 1024);
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
