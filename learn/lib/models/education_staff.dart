class EducationStaff {
  final String educationStaffId;
  final String educationStaffName;
  final String educationStaffAcademicNumber;
  final String educationStaffAcademicDegree;
  final String educationStaffGender;
  final DateTime? educationStaffBirthDate;
  final bool isEducationStaffDeleted;

  EducationStaff({
    required this.educationStaffId,
    required this.educationStaffName,
    required this.educationStaffAcademicNumber,
    required this.educationStaffAcademicDegree,
    required this.educationStaffGender,
    this.educationStaffBirthDate,
    required this.isEducationStaffDeleted,
  });
}