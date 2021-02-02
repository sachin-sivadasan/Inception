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
        UnitModel('TB', '0', from)
      ];
    var kb = toKB(bytes);
    var mb = toMB(bytes);
    var gb = toGB(bytes);
    var tb = toTB(bytes);
    return <UnitModel>[
      UnitModel('Bytes', bytes.toString(), from),
      UnitModel('KB', kb, from),
      UnitModel('MB', mb, from),
      UnitModel('GB', gb, from),
      UnitModel('TB', tb, from),
    ];
  }

  String toSelectedConvertion() {
    var bytes = convertToBytes(value);
    print('$value $from converted to $bytes bytes');
    if (to == 'KB') return toKB(bytes);
    if (to == 'MB') return toMB(bytes);
    if (to == 'GB') return toGB(bytes);
    if (to == 'TB') return toTB(bytes);
    return '$bytes Bytes';
  }

  toTB(BigInt bytes) {
    try {
      if (bytes > BigInt.from(0)) {
        BigInt gb = BigInt.from(bytes / BigInt.from(1073741824));
        return (gb / BigInt.from(1024)).toString() + " TB";
      } else
        return "0 TB";
    } catch (e) {
      print(e);
    }
  }

  toGB(BigInt bytes) {
    if (bytes > BigInt.from(0))
      return (bytes / BigInt.from(1073741824)).toString() + " GB";
    else
      return "0 GB";
  }

  toMB(BigInt bytes) {
    if (bytes > BigInt.from(0))
      return (bytes / BigInt.from(1048576)).toString() + " MB";
    else
      return "0 MB";
  }

  toKB(BigInt bytes) {
    if (bytes > BigInt.from(0))
      return (bytes / BigInt.from(1024)).toString() + " KB";
    else
      return "0 KB";
  }

  toByte(BigInt bytes) {
    return (bytes).toString() + " Byte";
  }

  convertToBytes(BigInt currentValue) {
    print(' $from -  $to');
    if (from == 'KB')
      return fromKB(currentValue);
    else if (from == 'MB')
      return fromMB(currentValue);
    else if (from == 'GB')
      return fromGB(currentValue);
    else if (from == 'TB')
      return fromTB(currentValue);
    else
      return currentValue;
  }

  fromKB(BigInt currentValue) {
    return currentValue * BigInt.from(1024);
  }

  fromMB(BigInt currentValue) {
    return currentValue * BigInt.from(1024 * 1024);
  }

  fromGB(BigInt currentValue) {
    return currentValue * BigInt.from(1024 * 1024 * 1024);
  }

  fromTB(BigInt currentValue) {
    print('to tb called');
    return currentValue * BigInt.from(1024 * 1024 * 1024 * 1024);
  }

}