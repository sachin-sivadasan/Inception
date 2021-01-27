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
        UnitModel('KB', '0', from),
        UnitModel('MB', '0', from),
        UnitModel('GB', '0', from),
        // UnitModel('TB', '0', from)
      ];
    var kb = toKB(bytes);
    var mb = toMB(bytes);
    var gb = toGB(bytes);
    // var tb = toTB(bytes);
    return <UnitModel>[
      UnitModel('Bytes', bytes.toString(), from),
      UnitModel('KB', kb, from),
      UnitModel('MB', mb, from),
      UnitModel('GB', gb, from),
      // UnitModel('TB', tb, from),
    ];
  }

  String toSelectedConvertion() {
    var bytes = convertToBytes(value);
    print('$value $from converted to $bytes bytes');
    if (to == 'KB') return toKB(bytes);
    if (to == 'MB') return toMB(bytes);
    if (to == 'GB') return toGB(bytes);
    // if (to == 'TB') return toTB(bytes);
    return '$bytes Bytes';
  }

  // toTB(BigInt bytes) {
  //   try {
  //     if (bytes > BigInt.from(0)) {
  //       BigInt gb = BigInt.from(bytes / BigInt.from(1073741824));
  //       return (gb / BigInt.from(1024)).toString() + "";
  //     } else
  //       return "0 GB";
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  toGB(BigInt bytes) {
    try {
      if (bytes > BigInt.from(0))
        return (bytes / BigInt.from(1073741824)).toString() + "";
      else
        return "0 GB";
    } catch (e) {
      print(e);
    }
  }

  toMB(BigInt bytes) {
    if (bytes > BigInt.from(0))
      return (bytes / BigInt.from(1048576)).toString() + "";
    else
      return "0 MB";
  }

  toKB(BigInt bytes) {
    if (bytes > BigInt.from(0))
      return (bytes / BigInt.from(1024)).toString() + "";
    else
      return "0";
  }

  toByte(BigInt bytes) {
    return (bytes).toString() + " byte";
  }

  convertToBytes(BigInt inBytes) {
    print(' $from -  $to');
    if (from == 'KB')
      return fromKB(inBytes);
    else if (from == 'MB')
      return fromMB(inBytes);
    else if (from == 'GB')
      return fromGB(inBytes);
    // else if (from == 'TB')
    //   return fromTB(inBytes);
    else
      return inBytes;
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

  // fromTB(BigInt bytes) {
  //   print('to tb called');
  //   print(BigInt.from(1024 * 1024 * 1024 * 1024));
  //   return bytes * BigInt.from(1024 * 1024 * 1024 * 1024);
  // }

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
