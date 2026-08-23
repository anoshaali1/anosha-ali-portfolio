import '../models/project.dart';

const List<Project> projects = [
  Project(
    title: 'Open Debate App',
    description:
        'A full-stack, real-time debate platform designed to support '
        'structured live debates with real-time communication, voting, '
        'room management and administrative controls.',
    technologies: [
      'Flutter',
      'Dart',
      'Node.js',
      'MongoDB',
      'Socket.IO',
      'WebRTC',
    ],
    features: [
      'Real-time video/audio/text communication',
      'Debate room creation',
      'Live winner announcements',
      'Real-time synchronization',
      'Admin dashboard',
      'Activity logs',
      'Notifications',
    ],
    githubUrl:
        'https://github.com/your-github-username/open-debate-app',
    icon: '💬',
    featured: true,
  ),

  Project(
    title: 'Tastemade',
    description:
        'A full-stack recipe web application built with React and '
        'Node.js/Express, featuring REST API communication and '
        'role-based access control.',
    technologies: [
      'React',
      'JavaScript',
      'Node.js',
      'Express',
      'MySQL',
      'REST APIs',
    ],
    features: [
      'React frontend',
      'REST API integration',
      'Admin/User roles',
      'Role-based access control',
      'API testing',
      'Functional testing',
    ],
    githubUrl:
        'https://github.com/anoshaali1/DatabaseFinalProject',
    icon: '🍴',
    featured: true,
  ),

  Project(
    title: 'BiteBook',
    description:
        'A Flutter-based smart recipe application focused on recipe '
        'discovery, personalized recommendations and an integrated AI assistant.',
    technologies: [
      'Flutter',
      'Dart',
      'SharedPreferences',
      'AI',
    ],
    features: [
      'Recipe discovery',
      'Category filtering',
      'Search',
      'Grid-based UI',
      'BiteBuddy AI assistant',
      'Recipe Q&A',
      'Ingredient substitutions',
      'Meal recommendations',
    ],
    githubUrl:
        'https://github.com/anoshaali1/Multilingual-Recipe-App-',
    icon: '🍳',
    featured: true,
  ),
  Project(
  title: 'Vital Scope',
  description:
      'An AI-powered health companion that combines machine learning, '
      'a Streamlit web interface, Flask backend services, and an '
      'interactive chatbot to provide predictive health insights.',
  technologies: [
    'Python',
    'Streamlit',
    'Flask',
    'Flask-CORS',
    'Scikit-learn',
    'Pandas',
    'NumPy',
    'Joblib',
    'FuzzyWuzzy',
    'Python-Levenshtein',
    'Pillow',
  ],
  features: [
    'Heart disease risk prediction',
    'Diabetes risk prediction',
    'Interactive Streamlit web interface',
    'Flask backend services',
    'AI-powered conversational chatbot',
    'Fuzzy matching for chatbot responses',
    'Machine learning model integration',
    'REST-based frontend/backend communication',
    'Image processing with Pillow',
  ],
  githubUrl:
      'https://github.com/anoshaali1/Vital-Scope-AI-powered-health-companion',
  icon: '🤖',
  featured: true,
),
Project(
  title: 'Lost & Found App',
  description:
      'A cross-platform lost-and-found application designed to help '
      'users report, discover, and recover lost belongings through a '
      'centralized digital platform.',
  technologies: [
    'Flutter',
    'Dart',
    'Firebase',
    'Cross-Platform Development',
    'Responsive UI',
  ],
  features: [
    'Lost item reporting',
    'Found item reporting',
    'Item descriptions and images',
    'Location and date information',
    'Search and discovery',
    'Potential item matching',
    'Community-based recovery',
    'Mobile and web support',
    'Cross-platform application structure',
  ],
  githubUrl:
      'https://github.com/anoshaali1/Lost-and-Found-App',
  icon: '🔎',
  featured: true,
),
];