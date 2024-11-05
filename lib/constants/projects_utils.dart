class ProjectUtils{
  final String image;
  final String title;
  final String subtitle;
  final String? androidLink;
  final String githubLink;
  final String? webLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.androidLink,
    required this.githubLink,
    this.webLink,
});
}

List<ProjectUtils> projectUtils=[
  ProjectUtils(
      image: "assets/img_4.png",
      title: 'Orderease Application',
      subtitle: 'Flutter‐Dart-NodeJs-ExpressJs-MongoDB\n\n The app enables users to manage orders and feedback, while admins handle items and analytics.',
      githubLink:'https://github.com/ianshgupta/OrderEase'
  ),
  ProjectUtils(
      image: "assets/img_1.png",
      title: 'UBudget Application',
      subtitle: 'Flutter‐Dart-Hive DB\n\n Empower your finances with our app, effortlessly track expenses, and achieve your financial goals.',
      githubLink:'https://github.com/ianshgupta/Budget_App'
  ),

  ProjectUtils(
      image: "assets/img.png",
      title: 'Weather Application',
      subtitle: 'Flutter‐Dart-Rest API\n\n Developed a dynamic Weather app, offering real-time weather information to users.',
      githubLink:'https://github.com/ianshgupta/Weather_App'
  ),
  ProjectUtils(
      image: "assets/img_2.png",
      title: 'Quiz Application',
      subtitle: 'Flutter‐Dart-Hive DB\n\n Engage, challenge, and learn with our dynamic quiz app, where knowledge meets excitement at every tap',
    githubLink: 'https://github.com/ianshgupta'
  ),
  ProjectUtils(
      image: "assets/img_3.png",
      title: 'To-Do App',
      subtitle: 'Flutter-Dart-Firebase \n\n Manage your tasks efficiently with our intuitive to-do app, helping you stay organized and productive effortlessly.',
    githubLink: 'https://github.com/ianshgupta/To-Do_App'
  ),
];
