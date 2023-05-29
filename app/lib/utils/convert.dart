import 'dart:typed_data';

Uint8List pcmInt16FromFloat32(List<double> pcmData) {
  final pcmBytes = Uint8List(pcmData.length * 2);
  for (var i = 0; i < pcmData.length; i++) {
    final floatValue = pcmData[i];
    final intValue = (floatValue.clamp(-1.0, 1.0) * 32767).toInt();
    pcmBytes[i * 2] = (intValue & 0xff);
    pcmBytes[i * 2 + 1] = ((intValue >> 8) & 0xff);
  }
  return pcmBytes;
}
