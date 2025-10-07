import '../../domain/entities/class_label.dart';

class ClassLabelDto {
  final int classId;
  final String className;
  final String colorCode;
  final bool isActive;

  const ClassLabelDto({
    required this.classId,
    required this.className,
    required this.colorCode,
    required this.isActive,
  });

  factory ClassLabelDto.fromJson(Map<String, dynamic> json) => ClassLabelDto(
        classId: json['classId'] as int,
        className: json['className'] as String,
        colorCode: json['colorCode'] as String? ?? '#000000',
        isActive: json['isActive'] as bool? ?? true,
      );

  Map<String, dynamic> toJson() => {
        'classId': classId,
        'className': className,
        'colorCode': colorCode,
        'isActive': isActive,
      };

  ClassLabel toEntity() => ClassLabel(
        classId: classId,
        className: className,
        colorCode: colorCode,
        isActive: isActive,
      );
}


