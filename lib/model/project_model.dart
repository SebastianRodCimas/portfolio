class Project {
  final String name;
  final String description;
  final String image; // Logo for each project
  final String? link;
  final List<String> languages; // List of programming language icons
  final List<String> screenshots; // List of screenshot paths
  final String projectType; // Type of project (professional, school, personal)
  Project(this.name, this.description, this.image, this.link, this.languages,
      this.screenshots, this.projectType);
}

List<Project> projectList = [
  Project(
    'SCALIA Mobile',
    'Creation of a mobile application to visualize surveillance cameras with user preferences, from design to hosting.',
    'assets/icons/scalialogo.png',
    'https://github.com/Hamad-Anwar/Coffe-Shop-Beautifull-UI',
    [
      'assets/icons/flutter.png',
      'assets/icons/dart.png',
      'assets/icons/firebase.png',
      'assets/icons/firebase.png'
    ],
    [
      'assets/icons/flutter.png',
      'assets/icons/dart.png',
      'assets/icons/firebase.png'
    ],
    'Professional - 3rd year of work-study - 2023/2024',
  ),
  Project(
    'TekNow',
    'Document the history and evolution of electronic music genres while highlighting festivals. Offer a reward system where users can earn discounts on events.',
    'assets/images/car.png',
    'https://github.com/Hamad-Anwar/Coffe-Shop-Beautifull-UI',
    [
      'assets/icons/flutter.png',
      'assets/icons/dart.png',
      'assets/icons/firebase.png'
    ],
    [
      'assets/icons/flutter.png',
      'assets/icons/dart.png',
      'assets/icons/firebase.png'
    ],
    'Personnal - Current project - 2025',
  ),
  Project(
    'Election Prediction AI',
    'Development of a Proof of Concept (POC) for Predicting Electoral Trends using AI.',
    'assets/images/data.png',
    'https://github.com/Hamad-Anwar/Neumorphic-Music_Player-Flutter',
    [
      'assets/icons/flutter.svg',
      'assets/icons/dart.svg',
      'assets/icons/firebase.svg'
    ],
    [
      'assets/icons/flutter.png',
      'assets/icons/dart.png',
      'assets/icons/firebase.png'
    ],
    'School - 1st year master - 2022',
  ),
  Project(
    'Connected socket - ADEE',
    'Smart device for remote control, home automation, and energy consumption optimization.',
    'assets/icons/adee.png',
    'https://github.com/Hamad-Anwar/Neumorphic-Analog-Clockify',
    [
      'assets/icons/flutter.svg',
      'assets/icons/dart.svg',
      'assets/icons/firebase.svg'
    ],
    [
      'assets/icons/flutter.png',
      'assets/icons/dart.png',
      'assets/icons/firebase.png'
    ],
    'School - Concourt National Worshop won - 2020',
  ),
  Project(
    'Logiciel ALX Technology',
    'Desktop application to manage consumption and fuel rights for each customer ',
    'assets/images/alx.jpg',
    '',
    [
      'assets/icons/flutter.svg',
      'assets/icons/dart.svg',
      'assets/icons/firebase.svg'
    ],
    [
      'assets/icons/flutter.png',
      'assets/icons/dart.png',
      'assets/icons/firebase.png'
    ],
    'Professional - 2nd year of work-study - 2022/2023',
  ),
  Project(
    'Customer File Management',
    'Manage customer files with functions for important documents.',
    'assets/icons/syrius.png',
    'https://github.com/Hamad-Anwar/',
    [
      'assets/icons/flutter.svg',
      'assets/icons/dart.svg',
      'assets/icons/firebase.svg'
    ],
    [
      'assets/icons/flutter.png',
      'assets/icons/dart.png',
      'assets/icons/firebase.png'
    ],
    'Professional - 1nd year of work-study - 2021/2022',
  ),
  Project(
    'Espana Cultura',
    'Windows Forms desktop application in C# designed to manage data on courses, teachers, students, classes, timetables and carpools, optimizing school organization.',
    'assets/icons/espana.png',
    'https://github.com/Hamad-Anwar/Task-Sync-Pro-Flutter',
    [
      'assets/icons/flutter.svg',
      'assets/icons/dart.svg',
      'assets/icons/firebase.svg'
    ],
    [
      'assets/icons/flutter.png',
      'assets/icons/dart.png',
      'assets/icons/firebase.png'
    ],
    'Personal - 1nd year of bachelor degree - 2021',
  ),
  Project(
    'Agile IT Project Management',
    'Modernize Information System with a modular architecture to optimize stocks, automation, and customer relations.',
    'assets/images/mains.png',
    '',
    [
      'assets/icons/flutter.svg',
      'assets/icons/dart.svg',
      'assets/icons/firebase.svg'
    ],
    [
      'assets/icons/flutter.png',
      'assets/icons/dart.png',
      'assets/icons/firebase.png'
    ],
    'School - 2nd year master - 2024',
  ),
];
