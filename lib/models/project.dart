class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final List<String> features;
  final String githubUrl;
  final String? liveUrl;
  final String icon;
  final bool featured;

  const Project({
    required this.title,
    required this.description,
    required this.technologies,
    required this.features,
    required this.githubUrl,
    this.liveUrl,
    required this.icon,
    this.featured = false,
  });
}