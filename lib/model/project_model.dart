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
    'assets/icons/flutter.png', // Specific logo for this project
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
    'Creation of a mobile application to visualize surveillance cameras with user preferences, from design to hosting.', // Example icons

    /// Example icons
  ),
  Project(
    'Electronique musiques',
    'Car Control Dashboard is a user-friendly mobile application built using Flutter and powered by GetX for efficient state management. Enjoy a modern and intuitive design that adapts to various screen sizes, Interact with dynamic car controls, including speed, steering, and temperature. Realistic animations enhance the visual appeal, making it feel like you are controlling a real car!',
    'assets/images/car.png',
    null,
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
    'professional',
  ),
  Project(
    'RSE Ecole',
    'Neumorphic TimeKit is an open-source project that brings together the elegance of a beautifully designed alarm system, an analog clock with a neumorphic touch, and a feature-rich stopwatch. Whether you\'re looking for a functional alarm tool, a stylish desktop clock, or a precise stopwatch, TimeKit has you covered.',
    'assets/images/alarm.jpg',
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
    'professional',
  ),
  Project(
    'Logiciel ALX Technology',
    'CUI AIDER is an extraordinary application that brings together augmented reality (AR), a robust student portal, intuitive class management, and a comprehensive GPA system, providing an all-encompassing solution for students.Using AR technology, CUI AIDER offers an immersive experience, allowing users to explore the complete university campus virtually. Through AR, students can visualize buildings, navigate with interactive directions, and gain a better understanding of their surroundings.',
    'assets/images/cui.png',
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
    'professional',
  ),
  Project(
    'Flutter Music Streaming Application',
    'A Flutter music streaming application that allows users to play audio files from local storage. The app features a beautiful neumorphic UI design and provides a smooth user experience for browsing and playing music.',
    'assets/images/player.png',
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
    'professional',
  ),
  Project(
    'Food Recipe App',
    'This repository contains a Flutter implementation of a Food Recipe app with a captivating introduction section and impressive animations. It also features a signup and signin page with animations, elegantly presented on a bottom sheet.',
    'assets/images/recipe.png',
    'https://github.com/Hamad-Anwar/Food-Recipe-App-Flutter',
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
    'professional',
  ),
  Project(
    'Task Sync Pro',
    'Welcome to the Beautiful Task Scheduler App repository! This Flutter-based task management application combines elegant design with a robust backend, ensuring a seamless and organized task management experience. From stunning UI to real-time synchronization, this app has you covered.',
    'assets/images/task.png',
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
    'professional',
  ),
  Project(
    'Flutter Chat Application with Firebase',
    'Welcome to our innovative Flutter chat application! This feature-rich messaging platform allows users to connect and communicate seamlessly through text and images. The app is built using Flutter for the frontend and integrates with Firebase for backend services, including authentication, real-time database, and storage.',
    'assets/images/chat.png',
    'https://github.com/Hamad-Anwar/Messenger-App-Backend-Firebase',
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
    'professional',
  ),
  Project(
    'Doctor Appointment Application',
    'Introducing the extraordinary "Doctor Appointment System" - a state-of-the-art Flutter UI application that redefines healthcare accessibility and efficiency. Seamlessly crafted, this app empowers users to effortlessly select doctors based on categories, engage in smooth messaging, and access detailed profiles.',
    'assets/images/doctor.png',
    'https://github.com/Hamad-Anwar/Doctor-Appointment-Application-UI',
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
    'professional',
  ),
];
