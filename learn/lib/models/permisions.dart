class Permisions {
  final String permisionId;
  final String permisionName;
  final bool permisionShowUniversityData;
  final bool permisionEditUniversityData;
  final bool permisionShowColleges;
  final bool permisionAddColleges;
  final bool permisionEditColleges;
  final bool permisionDeleteColleges;
  final bool permisionShowNews;
  final bool permisionAddNews;
  final bool permisionEditNews;
  final bool permisionDeleteNews;
  final bool permisionShowActivitys;
  final bool permisionAddActivitys;
  final bool permisionEditActivitys;
  final bool permisionDeleteActivitys;
  final bool permisionShowAcademicStaff;
  final bool permisionAddAcademicStaff;
  final bool permisionEditAcademicStaff;
  final bool permisionDeleteAcademicStaff;
  final bool isPermisionDeleted;

  const Permisions({
    required this.permisionId,
    required this.permisionName,
    required this.permisionShowUniversityData,
    required this.permisionEditUniversityData,
    required this.permisionShowColleges,
    required this.permisionAddColleges,
    required this.permisionEditColleges,
    required this.permisionDeleteColleges,
    required this.permisionShowNews,
    required this.permisionAddNews,
    required this.permisionEditNews,
    required this.permisionDeleteNews,
    required this.permisionShowActivitys,
    required this.permisionAddActivitys,
    required this.permisionEditActivitys,
    required this.permisionDeleteActivitys,
    required this.permisionShowAcademicStaff,
    required this.permisionAddAcademicStaff,
    required this.permisionEditAcademicStaff,
    required this.permisionDeleteAcademicStaff,
    required this.isPermisionDeleted,
  });
}