import 'package:flutter/material.dart';
import '../../../utils/constants.dart';
import '../../../shared/widgets/fade_in_animation.dart';
import 'controllers/projects_controller.dart';
import 'widgets/category_filter_chip.dart';
import 'widgets/project_card.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final ProjectsController _controller = ProjectsController();

  @override
  Widget build(BuildContext context) {
    final filteredProjects = _controller.getFilteredProjects(
      Constants.projects,
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      alignment: Alignment.center,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Projects",
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),

            // Filter Tabs
            Wrap(
              spacing: 15,
              children: _controller.categories.map((category) {
                final bool isSelected =
                    _controller.selectedCategory == category;
                return CategoryFilterChip(
                  category: category,
                  isSelected: isSelected,
                  onTap: () {
                    setState(() {
                      _controller.updateCategory(category);
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 40),

            // Projects Grid
            Wrap(
              spacing: 30,
              runSpacing: 30,
              alignment: WrapAlignment.start,
              children: filteredProjects
                  .asMap()
                  .entries
                  .map(
                    (entry) => FadeInAnimation(
                      delay: Duration(milliseconds: 100 + (entry.key * 100)),
                      child: ProjectCard(project: entry.value),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
