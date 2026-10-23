import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/project_model.dart';
import '../models/skill_model.dart';
import '../models/journey_model.dart';

class PortfolioData {
  // Personal Info
  static const String name = "Shivraj Pandit";
  static const String title = "AI & Data Science Student • Software Developer";
  static const String university = "Sanjivani University, Kopargaon";
  static const String degree = "B.Tech in Artificial Intelligence & Data Science";
  static const String email = "panditshivraj934@gmail.com";
  static const String githubUrl = "https://github.com/Shivrajpandit";
  static const String linkedinUrl =
      "https://www.linkedin.com/in/shivraj-pandit-9ab2a12a2";
  static const String livePortfolioUrl = "https://portfolio-a62eb.web.app/";
  static const String resumeUrl = "https://github.com/Shivrajpandit";

  static const String heroBadge = "AI & Data Science • Software Development";
  static const String heroHeadline =
      "Building intelligent software for real-world problems.";
  static const String heroDescription =
      "I'm Shivraj Pandit — an Artificial Intelligence & Data Science student and software developer focused on building practical applications across AI, data, mobile, backend, and modern software technologies.";

  static const String aboutDescription =
      "I am an ambitious AI & Data Science undergraduate at Sanjivani University, Kopargaon, with a strong foundation in software engineering and cross-platform application development.\n\n"
      "My passion lies at the intersection of Artificial Intelligence, data systems, and scalable software architecture. I actively build full-stack solutions — from intuitive Flutter mobile interfaces to robust Golang backend services and intelligent predictive systems. I believe in clean code, disciplined engineering, and creating tools that solve genuine human problems.";

  // Quick Stats
  static const List<Map<String, dynamic>> quickStats = [
    {
      "value": "B.Tech AI & Data",
      "label": "Sanjivani University",
      "icon": Icons.school_rounded,
      "color": Color(0xFF38BDF8),
    },
    {
      "value": "Production Apps",
      "label": "Flutter & Mobile",
      "icon": Icons.phone_android_rounded,
      "color": Color(0xFF34D399),
    },
    {
      "value": "Backend & Cloud",
      "label": "Golang • MongoDB • Firebase",
      "icon": Icons.cloud_done_rounded,
      "color": Color(0xFF818CF8),
    },
    {
      "value": "Open Source",
      "label": "Active GitHub Builder",
      "icon": FontAwesomeIcons.github,
      "color": Color(0xFFA855F7),
    },
  ];

  // Domain Cards (About Right Side)
  static const List<Map<String, dynamic>> domainCards = [
    {
      "title": "AI & Machine Learning",
      "description":
          "Developing intelligent pipelines, predictive models, and AI-driven workflow analyzers.",
      "icon": Icons.psychology_rounded,
      "color": Color(0xFF38BDF8),
    },
    {
      "title": "Data Science & Analytics",
      "description":
          "Extracting actionable insights through structured data analysis, statistical modeling, and Python tooling.",
      "icon": Icons.analytics_rounded,
      "color": Color(0xFF818CF8),
    },
    {
      "title": "Flutter Development",
      "description":
          "Crafting high-performance, aesthetically pleasing mobile and web apps with reactive state management.",
      "icon": FontAwesomeIcons.flutter,
      "color": Color(0xFF64FFDA),
    },
    {
      "title": "Backend Engineering",
      "description":
          "Architecting concurrent RESTful microservices, clean APIs, and robust data handlers in Golang.",
      "icon": Icons.dns_rounded,
      "color": Color(0xFF34D399),
    },
    {
      "title": "Database Architecture",
      "description":
          "Designing high-availability schemas with MongoDB, Firebase Firestore, and relational databases.",
      "icon": Icons.storage_rounded,
      "color": Color(0xFFFBBF24),
    },
    {
      "title": "Modern UI/UX & Web",
      "description":
          "Building responsive, accessible interfaces with glassmorphic aesthetics and modern design tokens.",
      "icon": Icons.palette_rounded,
      "color": Color(0xFFF43F5E),
    },
  ];

  // Currently Building & Learning
  static const List<Map<String, dynamic>> currentFocus = [
    {
      "title": "AI-Powered Skill & Gap Analysis",
      "area": "Artificial Intelligence",
      "status": "In Active Development",
      "progress": 0.85,
      "color": Color(0xFF38BDF8),
      "tech": ["Python", "Machine Learning", "FastAPI", "Data Analytics"],
      "details":
          "Building automated algorithms to assess career roadmaps and detect domain skill gaps with personalized learning curves.",
    },
    {
      "title": "Golang Microservices & REST Architecture",
      "area": "Backend Engineering",
      "status": "Deep Dive & Production",
      "progress": 0.90,
      "color": Color(0xFF34D399),
      "tech": ["Go (Golang)", "Goroutines", "JWT Auth", "REST APIs"],
      "details":
          "Mastering concurrency models, dependency injection, and clean hexagonal architecture for high-throughput backends.",
    },
    {
      "title": "Advanced Flutter State & Architecture",
      "area": "Mobile Development",
      "status": "Production Ready",
      "progress": 0.95,
      "color": Color(0xFF64FFDA),
      "tech": ["Flutter", "BLoC / Provider", "Clean Architecture", "REST"],
      "details":
          "Engineering scalable cross-platform mobile apps with optimized rendering, animation choreographies, and offline sync.",
    },
    {
      "title": "Cloud Infrastructure & Database Scalability",
      "area": "Cloud & Data",
      "status": "Continuous Practice",
      "progress": 0.80,
      "color": Color(0xFF818CF8),
      "tech": ["MongoDB", "Firebase Firestore", "Cloudinary", "Docker"],
      "details":
          "Implementing cloud storage, automated auth pipelines, indexing strategies, and database synchronization.",
    },
  ];

  // What I Build (6 Cards)
  static const List<Map<String, dynamic>> whatIBuild = [
    {
      "title": "AI Applications",
      "description":
          "Intelligent systems that parse data, identify patterns, and automate decision-making workflows.",
      "icon": Icons.auto_awesome_rounded,
      "color": Color(0xFF38BDF8),
    },
    {
      "title": "Data-Driven Applications",
      "description":
          "Analytical dashboards, metrics tracking engines, and recommendation systems.",
      "icon": Icons.query_stats_rounded,
      "color": Color(0xFF818CF8),
    },
    {
      "title": "Mobile Applications",
      "description":
          "Feature-rich, high-performance Android & iOS applications built with Flutter and Dart.",
      "icon": Icons.smartphone_rounded,
      "color": Color(0xFF34D399),
    },
    {
      "title": "Backend APIs",
      "description":
          "High-concurrency RESTful APIs, authentication pipelines (JWT/OTP), and microservices with Golang.",
      "icon": Icons.api_rounded,
      "color": Color(0xFFF59E0B),
    },
    {
      "title": "Full-Stack Applications",
      "description":
          "End-to-end software connecting responsive client frontends with reliable cloud databases.",
      "icon": Icons.layers_rounded,
      "color": Color(0xFFA855F7),
    },
    {
      "title": "Developer Tools",
      "description":
          "Clean scripts, API integration harnesses, reusable Flutter packages, and testing setups.",
      "icon": Icons.terminal_rounded,
      "color": Color(0xFF64FFDA),
    },
  ];

  // Categorized Skills
  static const List<SkillModel> skills = [
    // Programming Languages
    SkillModel(
      name: "Python",
      icon: FontAwesomeIcons.python,
      color: Color(0xFF38BDF8),
      category: SkillCategory.programming,
      categoryName: "Programming Languages",
      level: "Core & AI",
    ),
    SkillModel(
      name: "Dart",
      icon: Icons.code_rounded,
      color: Color(0xFF64FFDA),
      category: SkillCategory.programming,
      categoryName: "Programming Languages",
      level: "Advanced",
    ),
    SkillModel(
      name: "Go (Golang)",
      icon: FontAwesomeIcons.golang,
      color: Color(0xFF00ADD8),
      category: SkillCategory.programming,
      categoryName: "Programming Languages",
      level: "Backend Focus",
    ),
    SkillModel(
      name: "Java",
      icon: FontAwesomeIcons.java,
      color: Color(0xFFF97316),
      category: SkillCategory.programming,
      categoryName: "Programming Languages",
      level: "Proficient",
    ),
    SkillModel(
      name: "JavaScript",
      icon: FontAwesomeIcons.js,
      color: Color(0xFFFBBF24),
      category: SkillCategory.programming,
      categoryName: "Programming Languages",
      level: "Proficient",
    ),
    SkillModel(
      name: "C / C++",
      icon: FontAwesomeIcons.c,
      color: Color(0xFF94A3B8),
      category: SkillCategory.programming,
      categoryName: "Programming Languages",
      level: "Foundational",
    ),

    // AI & Data Science
    SkillModel(
      name: "Machine Learning",
      icon: Icons.psychology_rounded,
      color: Color(0xFF818CF8),
      category: SkillCategory.aiAndData,
      categoryName: "AI & Data Science",
      level: "Core Study",
    ),
    SkillModel(
      name: "Data Analysis",
      icon: Icons.insights_rounded,
      color: Color(0xFF38BDF8),
      category: SkillCategory.aiAndData,
      categoryName: "AI & Data Science",
      level: "Proficient",
    ),
    SkillModel(
      name: "Data Modeling",
      icon: Icons.schema_rounded,
      color: Color(0xFF34D399),
      category: SkillCategory.aiAndData,
      categoryName: "AI & Data Science",
      level: "Applied",
    ),
    SkillModel(
      name: "Statistical Analytics",
      icon: Icons.bar_chart_rounded,
      color: Color(0xFFA855F7),
      category: SkillCategory.aiAndData,
      categoryName: "AI & Data Science",
      level: "Core",
    ),

    // Mobile Development
    SkillModel(
      name: "Flutter",
      icon: FontAwesomeIcons.flutter,
      color: Color(0xFF64FFDA),
      category: SkillCategory.mobile,
      categoryName: "Mobile Development",
      level: "Production Ready",
    ),
    SkillModel(
      name: "Android (Native/SDK)",
      icon: FontAwesomeIcons.android,
      color: Color(0xFF3DDC84),
      category: SkillCategory.mobile,
      categoryName: "Mobile Development",
      level: "Internship Exp",
    ),
    SkillModel(
      name: "State Management",
      icon: Icons.hub_rounded,
      color: Color(0xFF38BDF8),
      category: SkillCategory.mobile,
      categoryName: "Mobile Development",
      level: "Advanced",
    ),
    SkillModel(
      name: "REST API Integration",
      icon: Icons.sync_alt_rounded,
      color: Color(0xFFFBBF24),
      category: SkillCategory.mobile,
      categoryName: "Mobile Development",
      level: "Production",
    ),

    // Backend & Cloud
    SkillModel(
      name: "Golang Backend",
      icon: FontAwesomeIcons.golang,
      color: Color(0xFF00ADD8),
      category: SkillCategory.backend,
      categoryName: "Backend & Cloud",
      level: "Active Focus",
    ),
    SkillModel(
      name: "RESTful APIs",
      icon: Icons.api_rounded,
      color: Color(0xFF34D399),
      category: SkillCategory.backend,
      categoryName: "Backend & Cloud",
      level: "Advanced",
    ),
    SkillModel(
      name: "MongoDB",
      icon: FontAwesomeIcons.database,
      color: Color(0xFF47A248),
      category: SkillCategory.backend,
      categoryName: "Backend & Cloud",
      level: "Proficient",
    ),
    SkillModel(
      name: "Firebase Cloud",
      icon: FontAwesomeIcons.fire,
      color: Color(0xFFFFA000),
      category: SkillCategory.backend,
      categoryName: "Backend & Cloud",
      level: "Production",
    ),
    SkillModel(
      name: "JWT & OTP Auth",
      icon: Icons.security_rounded,
      color: Color(0xFFF43F5E),
      category: SkillCategory.backend,
      categoryName: "Backend & Cloud",
      level: "Implemented",
    ),

    // Tools & DevOps
    SkillModel(
      name: "Git & Version Control",
      icon: FontAwesomeIcons.gitAlt,
      color: Color(0xFFF05032),
      category: SkillCategory.tools,
      categoryName: "Tools & Workflow",
      level: "Daily Workflow",
    ),
    SkillModel(
      name: "GitHub",
      icon: FontAwesomeIcons.github,
      color: Colors.white,
      category: SkillCategory.tools,
      categoryName: "Tools & Workflow",
      level: "Open Source",
    ),
    SkillModel(
      name: "VS Code",
      icon: Icons.terminal_rounded,
      color: Color(0xFF007ACC),
      category: SkillCategory.tools,
      categoryName: "Tools & Workflow",
      level: "Primary IDE",
    ),
    SkillModel(
      name: "Android Studio",
      icon: Icons.developer_mode_rounded,
      color: Color(0xFF3DDC84),
      category: SkillCategory.tools,
      categoryName: "Tools & Workflow",
      level: "Mobile Testing",
    ),
    SkillModel(
      name: "Postman",
      icon: FontAwesomeIcons.paperPlane,
      color: Color(0xFFFF6C37),
      category: SkillCategory.tools,
      categoryName: "Tools & Workflow",
      level: "API Testing",
    ),
    SkillModel(
      name: "Figma",
      icon: FontAwesomeIcons.figma,
      color: Color(0xFFF24E1E),
      category: SkillCategory.tools,
      categoryName: "Tools & Workflow",
      level: "UI/UX Design",
    ),
  ];

  // Projects
  static const List<ProjectModel> projects = [
    // Featured 1: AI Career & Skill Gap Analyzer
    ProjectModel(
      id: "ai-career-analyzer",
      title: "AI-Powered Career & Skill Gap Analyzer",
      tagline:
          "Intelligent system analyzing career goals, extracting skill vectors, and recommending tailored learning roadmaps.",
      category: "AI & Data Science",
      isFeatured: true,
      primaryColor: Color(0xFF38BDF8),
      icon: Icons.psychology_rounded,
      description:
          "An intelligent career guidance platform that evaluates student and professional profiles against target industry roles to compute real-time skill gaps, prioritize missing competencies, and generate personalized learning trajectories.",
      problem:
          "Students and transitioning developers struggle to pinpoint the exact technical gaps separating their current knowledge from high-demand industry job descriptions.",
      solution:
          "Combines natural language skill extraction with predictive data modeling to map existing qualifications onto standardized role requirements and generate step-by-step actionable roadmaps.",
      features: [
        "Intelligent Skill Extraction & Profiling",
        "Domain-specific Skill Gap Scoring Algorithm",
        "Personalized Course & Project Recommendations",
        "Interactive Step-by-Step Learning Timeline",
        "Target Role Benchmark Comparisons",
      ],
      architecture: [
        "User Profile Input & Goal Definition",
        "Skill Vector Extraction & Tokenization",
        "Machine Learning / NLP Gap Detection Engine",
        "Recommendation Engine & Priority Weighting",
        "Dynamic Learning Roadmap Generation",
      ],
      techStack: [
        "Python",
        "Data Science",
        "Machine Learning",
        "NLP",
        "REST APIs",
        "Web UI",
      ],
      challenges: [
        "Normalizing diverse resume skill terminologies to canonical skill taxonomies.",
        "Weighting prerequisite knowledge chains accurately for dynamic roadmap generation.",
      ],
      outcome:
          "Provides a streamlined, data-driven methodology for developers to systematically upgrade their technical skillset with measurable progression.",
      githubUrl:
          "https://github.com/Shivrajpandit/AI-Powered-Career-Skill-Gap-Analyzer",
    ),

    // Featured 2: Blood Connect
    ProjectModel(
      id: "blood-connect",
      title: "Blood Connect",
      tagline:
          "Real-world emergency blood donor network connecting donors, recipients, and medical centers with live location matching.",
      category: "Full-Stack & Mobile",
      isFeatured: true,
      primaryColor: Color(0xFFEF4444),
      icon: Icons.favorite_rounded,
      description:
          "A production-grade emergency blood donation and matching platform engineered with a Flutter cross-platform client and a high-performance Golang backend with MongoDB, Firebase auth, and OTP verification.",
      problem:
          "Critical delays during emergency blood transfusions due to fragmented donor directories, lack of geolocation-based matching, and slow communication channels.",
      solution:
          "Architected an instant-match platform with real-time push notifications, radius-based donor lookup, verified donor profiles, and secure OTP authorization.",
      features: [
        "Geolocation-based Proximity Donor Matching",
        "Secure OTP & JWT Authentication Pipeline",
        "Emergency Broadcast Alerts with Firebase Cloud Messaging",
        "Donor Eligibility Tracker & Donation History",
        "Cloudinary Media Verification & Profile Assets",
      ],
      architecture: [
        "Flutter Mobile Client Layer (Clean Architecture & BLoC/State)",
        "Golang High-Concurrency REST API Server",
        "Service & Business Logic Handlers",
        "Repository Data Access Layer",
        "MongoDB Atlas (Primary Data & Geo-Spatial Indexes)",
        "Supporting: Firebase Auth, Cloudinary CDN, SMTP, SMS OTP",
      ],
      techStack: [
        "Flutter",
        "Dart",
        "Golang",
        "MongoDB",
        "Firebase",
        "Cloudinary",
        "JWT",
        "OTP",
      ],
      challenges: [
        "Implementing sub-second geographical coordinate indexing for proximity searches in MongoDB.",
        "Managing concurrent emergency broadcast notifications reliably without service throttling.",
      ],
      outcome:
          "Engineered a reliable, full-stack emergency response solution demonstrating scalable microservices and native mobile performance.",
      githubUrl: null,
    ),

    // 3. Ecommerce App
    ProjectModel(
      id: "ecommerce-app",
      title: "Modern E-Commerce Mobile Platform",
      tagline:
          "Feature-rich mobile shopping application with smooth product browsing, persistent cart, and responsive checkout.",
      category: "Mobile App",
      primaryColor: Color(0xFFA855F7),
      icon: Icons.shopping_bag_rounded,
      description:
          "A sleek, performant mobile commerce application built in Flutter with clean separation of concerns, dynamic catalog filtering, cart state management, and optimized asset caching.",
      problem:
          "Many mobile shopping apps suffer from sluggish navigation, unoptimized image loading, and awkward checkout user experiences.",
      solution:
          "Designed a fluid, modern interface with micro-interactions, responsive search, categorized product carousels, and persistent state across app lifecycles.",
      features: [
        "Dynamic Product Filtering & Instant Search",
        "Interactive Product Gallery with Zoom & Variations",
        "Persistent Cart & Wishlist State Management",
        "Multi-step Checkout Flow & Order Summary",
      ],
      architecture: [
        "Presentation Layer (Material 3 & Custom Widgets)",
        "State Management & ViewModels",
        "Repository & Local Cache Storage",
      ],
      techStack: ["Flutter", "Dart", "UI/UX", "State Management", "REST"],
      challenges: [
        "Optimizing 60fps image list rendering and caching on low-end Android hardware.",
      ],
      outcome:
          "A polished mobile shopping experience demonstrating commercial Flutter frontend standards.",
      githubUrl: "https://github.com/Shivrajpandit/ecommarce-app",
    ),

    // 4. Inventory Demand Forecasting
    ProjectModel(
      id: "inventory-forecasting",
      title: "Inventory Demand Forecasting",
      tagline:
          "Machine-learning solution analyzing historical sales and forecasting future product demand.",
      category: "AI & Data Science",
      primaryColor: Color(0xFF818CF8),
      icon: Icons.trending_up_rounded,
      description:
          "An applied machine learning project designed for analyzing historical retail and inventory sales trends to predict future product demand, minimizing stockouts and excess inventory.",
      problem:
          "Inaccurate manual demand forecasting causing inventory imbalances, supply chain delays, and capital inefficiency.",
      solution:
          "Built predictive regression and time-series pipelines incorporating data preprocessing, trend decomposition, exploratory analysis, and visual forecasting dashboards.",
      features: [
        "Historical Sales Data Preprocessing & Cleaning",
        "Exploratory Data Analysis (EDA) & Feature Correlation",
        "Predictive Demand Forecasting Engine",
        "Interactive Trend & Anomaly Visualization",
      ],
      architecture: [
        "Raw Sales Dataset Ingestion & Preprocessing",
        "Feature Engineering & Moving Averages",
        "Machine Learning Forecasting Model (Python / Scikit-learn)",
        "Prediction Evaluation & Visualization Output",
      ],
      techStack: [
        "Python",
        "Data Science",
        "Machine Learning",
        "Pandas",
        "NumPy",
        "Matplotlib",
      ],
      challenges: [
        "Handling seasonal fluctuations and sparse sales intervals across varied product categories.",
      ],
      outcome:
          "Demonstrates practical application of statistical modeling and machine learning to commercial supply chain datasets.",
      githubUrl:
          "https://github.com/Shivrajpandit/Inventory-Demand-Forecasting",
    ),

    // 5. Foody Delivery Platform
    ProjectModel(
      id: "foody-website",
      title: "Foody Delivery Web Application",
      tagline:
          "Comprehensive multi-cuisine food delivery web interface with live ordering flow and responsive layouts.",
      category: "Web App",
      primaryColor: Color(0xFFF97316),
      icon: Icons.restaurant_rounded,
      description:
          "A responsive web platform offering diverse cuisine exploration, menu customization, and seamless online food ordering deployed on Vercel.",
      problem:
          "Creating an intuitive web interface for browsing diverse restaurant menus with rapid responsiveness across desktop and mobile browsers.",
      solution:
          "Built a modular web application with dynamic category filters, animated menu cards, and instant order calculation.",
      features: [
        "Multi-cuisine categorization & dietary filters",
        "Live cart pricing calculation & dish customization",
        "Responsive responsive layout for all viewports",
        "Deployed on Vercel CDN for sub-second loading",
      ],
      architecture: [
        "Component-driven Client Architecture",
        "Modular CSS & Responsive Breakpoints",
        "Vercel Edge Deployment",
      ],
      techStack: ["React", "JavaScript", "CSS3", "Vercel", "Web UX"],
      challenges: [
        "Ensuring smooth animations and rapid layout reflows across various mobile web browsers.",
      ],
      outcome:
          "Successfully deployed web app serving fast interactive menus to online customers.",
      githubUrl: "https://github.com/Shivrajpandit/websites",
      liveUrl:
          "https://foody2-imhoj27pp-shivrajs-projects-e54e56f1.vercel.app",
    ),

    // 5. Developer Portfolio Engine
    ProjectModel(
      id: "portfolio-engine",
      title: "High-Performance Developer Portfolio",
      tagline:
          "Modern Flutter Web portfolio with dark-first design, glassmorphism, SEO optimization, and Firebase hosting.",
      category: "Website",
      primaryColor: Color(0xFF34D399),
      icon: Icons.web_rounded,
      description:
          "An enterprise-grade, responsive developer showcase engineered with Flutter Web, custom shaders, smooth section navigation, and Firebase hosting integration.",
      problem:
          "Showcasing multidisciplinary capabilities across AI, Data Science, Mobile, and Backend engineering in a cohesive, lightning-fast web experience.",
      solution:
          "Implemented a custom design system with dark/light themes, interactive terminals, case study modals, and responsive layout choreography.",
      features: [
        "Custom Design Token & Theme Engine (Dark/Light)",
        "Interactive AI Workspace & Code Terminal",
        "Deep-Dive Project Case Study Modals",
        "Optimized Web Asset & Font Delivery",
      ],
      architecture: [
        "Flutter Web CanvasKit / HTML Rendering Pipeline",
        "Responsive Layout Engine (320px to 4K)",
        "Firebase Hosting & Cloud Firestore Integration",
      ],
      techStack: [
        "Flutter Web",
        "Dart",
        "Firebase",
        "SEO",
        "Glassmorphism",
        "Animations",
      ],
      challenges: [
        "Eliminating font layout shifts and enabling fast initial web canvas paint.",
      ],
      outcome:
          "Showcases technical breadth and depth with a recruiter-friendly, state-of-the-art web presence.",
      githubUrl: "https://github.com/Shivrajpandit/portfolio",
      liveUrl: "https://portfolio-a62eb.web.app/",
    ),
  ];

  // Journey Timeline
  static const List<JourneyModel> journey = [
    JourneyModel(
      year: "2026 – Present",
      title: "Co-Founder & Software Engineer",
      subtitle: "ASK Tech Solutions",
      tag: "Leadership & Tech",
      icon: Icons.business_center_rounded,
      accentColor: Color(0xFF38BDF8),
      description:
          "Co-founded tech consultancy and software development initiative, leading technical architecture, full-stack product development, and team collaboration.",
      highlights: [
        "Architecting software products with Flutter, Go, MongoDB, Firebase, and REST APIs.",
        "Implemented JWT authentication, Cloudinary media pipelines, and robust service architectures.",
        "Leading Git/GitHub development workflows and delivering practical technology solutions.",
      ],
    ),
    JourneyModel(
      year: "September 2026 – Present",
      title: "Data Analytics Intern",
      subtitle: "Oasis Infobyte",
      tag: "Data Science",
      icon: Icons.analytics_rounded,
      accentColor: Color(0xFF818CF8),
      description:
          "Working on practical data analytics tasks involving dataset preprocessing, exploratory analysis, visualization, and actionable pattern interpretation.",
      highlights: [
        "Applying Python-based data analytical workflows to process complex datasets.",
        "Identifying predictive patterns, trends, and communicating clear data insights.",
      ],
    ),
    JourneyModel(
      year: "Sept 2025 – Jan 2026",
      title: "Android / Flutter Developer",
      subtitle: "MHTECHIN",
      tag: "Industry Mobile Exp",
      icon: Icons.work_rounded,
      accentColor: Color(0xFF34D399),
      description:
          "Developed cross-platform mobile applications using Flutter and Dart, integrating backend cloud services and APIs in production sprint environments.",
      highlights: [
        "Built responsive mobile interfaces with Flutter, Dart, and clean state management.",
        "Integrated Firebase cloud services, REST endpoints, and JSON-based data pipelines.",
        "Collaborated on debugging, code reviews, and Git version control workflows.",
      ],
    ),
    JourneyModel(
      year: "2024 - Present",
      title: "B.Tech in Artificial Intelligence & Data Science",
      subtitle: "Sanjivani University, Kopargaon",
      tag: "Academic Foundation",
      icon: Icons.school_rounded,
      accentColor: Color(0xFF00ADD8),
      description:
          "Pursuing undergraduate degree focusing on Machine Learning algorithms, statistical data analysis, artificial neural networks, database systems, and modern software design principles.",
      highlights: [
        "Core coursework in Machine Learning, Probability & Statistics, Data Structures, and Database Management.",
        "Developing real-world AI and data-driven projects applying classroom theory to practical implementations.",
      ],
    ),
  ];

  // Verified Achievements
  static const List<Map<String, dynamic>> achievements = [
    {
      "title": "B.Tech AI & Data Science Scholar",
      "issuer": "Sanjivani University, Kopargaon",
      "description":
          "Undergraduate candidate specializing in advanced AI, Machine Learning, and Data Science systems.",
      "icon": Icons.workspace_premium_rounded,
      "color": Color(0xFF38BDF8),
    },
    {
      "title": "Certified Flutter Developer",
      "issuer": "Professional Certification",
      "description":
          "Certified proficiency in cross-platform mobile architecture, state management, and production Flutter workflows.",
      "icon": FontAwesomeIcons.certificate,
      "color": Color(0xFF34D399),
    },
    {
      "title": "Polytechnic Diploma in Computer Science",
      "issuer": "State Board of Technical Education",
      "description":
          "Completed comprehensive technical diploma with deep grounding in computer science and programming fundamentals.",
      "icon": Icons.military_tech_rounded,
      "color": Color(0xFF818CF8),
    },
    {
      "title": "Production Mobile App Contributor",
      "issuer": "MHTECHIN",
      "description":
          "Contributed to production client applications during Android & Flutter developer tenure.",
      "icon": Icons.verified_rounded,
      "color": Color(0xFFA855F7),
    },
  ];

  // GitHub Repositories for GitHub Showcase (Public Repositories Only)
  static const List<Map<String, dynamic>> githubRepos = [
    {
      "name": "AI-Powered-Career-Skill-Gap-Analyzer",
      "description":
          "AI career skill analyzer extracting skills from resumes against target roles with custom learning roadmaps.",
      "stars": "Featured",
      "language": "Python • AI/ML",
      "color": Color(0xFF38BDF8),
      "url":
          "https://github.com/Shivrajpandit/AI-Powered-Career-Skill-Gap-Analyzer",
    },
    {
      "name": "Inventory-Demand-Forecasting",
      "description":
          "Machine learning forecasting solution analyzing historical retail sales data to predict product demand.",
      "stars": "Data Science",
      "language": "Python • ML",
      "color": Color(0xFF818CF8),
      "url": "https://github.com/Shivrajpandit/Inventory-Demand-Forecasting",
    },
    {
      "name": "Smart-Returnable-Packaging-Tracking",
      "description":
          "Lifecycle management and tracking system for sustainable returnable packaging and supply chain efficiency.",
      "stars": "Full-Stack",
      "language": "Java • System",
      "color": Color(0xFF34D399),
      "url":
          "https://github.com/Shivrajpandit/Smart-Returnable-Packaging-Tracking-Lifecycle-Management-System",
    },
    {
      "name": "ecommarce-app",
      "description":
          "Modern e-commerce mobile application in Flutter with dynamic catalogs, cart management, and clean UI.",
      "stars": "Mobile",
      "language": "Dart • Flutter",
      "color": Color(0xFFA855F7),
      "url": "https://github.com/Shivrajpandit/ecommarce-app",
    },
    {
      "name": "portfolio",
      "description":
          "Official developer portfolio engineered with Flutter Web, glassmorphic design system, and Firebase.",
      "stars": "Current",
      "language": "Flutter Web",
      "color": Color(0xFF64FFDA),
      "url": "https://github.com/Shivrajpandit/portfolio",
    },
    {
      "name": "websites",
      "description":
          "Collection of responsive web applications including Foody delivery platform deployed on Vercel.",
      "stars": "Live",
      "language": "JavaScript",
      "color": Color(0xFFF97316),
      "url": "https://github.com/Shivrajpandit/websites",
    },
  ];
}
