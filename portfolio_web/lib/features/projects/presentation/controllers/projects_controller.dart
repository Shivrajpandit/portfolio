class ProjectsController {
  String selectedCategory = "All Projects";

  final List<String> categories = [
    "All Projects",
    "Personal Projects",
    "Website",
  ];

  void updateCategory(String category) {
    selectedCategory = category;
  }

  List<Map<String, dynamic>> getFilteredProjects(
    List<Map<String, dynamic>> allProjects,
  ) {
    if (selectedCategory == "All Projects") {
      return allProjects;
    }
    return allProjects.where((p) => p['category'] == selectedCategory).toList();
  }
}
