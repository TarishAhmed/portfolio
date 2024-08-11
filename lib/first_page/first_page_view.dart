import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/core/theme_provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PortfolioHomePage extends HookConsumerWidget {
  const PortfolioHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarish Ahmed B'),
        actions: [
          Switch(
              value: themeState,
              onChanged: (val) =>
                  ref.read(themeStateProvider.notifier).toggleDarkMode())
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            _buildHeader(),
            const Gap(20),
            _buildSection('Experience', _experienceItems()),
            _buildSection('Skills', _buildSkills()),
            _buildSection('Education', _educationItems()),
            _buildSection('Languages', _languageItems()),
            _buildSection('Projects & Publications', _projectItems()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('Software Development Engineer II'),
        const Gap(10),
        const Text('Kochi, India | Phone: +91-8138001002'),
        const Text('Email: tarishahmed40@gmail.com'),
        InkWell(
          child: const Text(
            'LinkedIn: linkedin.com/in/tarishahmed',
            style: TextStyle(color: Colors.blue),
          ),
          onTap: () {
            launchUrlString('www.linkedin.com/in/tarishahmed',
                mode: LaunchMode.externalApplication);
          },
        ),
      ],
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Gap(10),
        content,
        const Gap(20),
      ],
    );
  }

  Widget _experienceItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _experienceItem(
          'Software Development Engineer II',
          'Tijoree, Mumbai, India',
          'March 2023 - Present',
          [
            'Launched Multi-platform banking app to manage current accounts, payment collection reminders, and POS machine management portal.',
            'Built Multi-platform state-of-the-art corporate card management app.',
          ],
        ),
        _experienceItem(
          'Software Developer',
          'uFABER EDUTECH, Mumbai, India',
          'February 2022 - March 2023',
          [
            'Launched and maintained 3 Edu-tech apps with downloads crossing 100,000 and over 5,000 daily active users.',
            'Worked with Firebase and GCP tools such as Cloud Functions, Cloud Tasks, Cloud Logging, and Big Query.',
          ],
        ),
      ],
    );
  }

  Widget _experienceItem(String title, String company, String duration,
      List<String> achievements) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(company),
        Text(duration, style: const TextStyle(fontStyle: FontStyle.italic)),
        const Gap(5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: achievements.map((item) => Text('• $item')).toList(),
        ),
        const Gap(10),
      ],
    );
  }

  Widget _buildSkills() {
    final skills = [
      'Flutter',
      'SASS/CSS',
      'Firebase/GCP',
      'Android development',
      'React.JS'
    ];
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: skills.map((skill) => Chip(label: Text(skill))).toList(),
    );
  }

  Widget _educationItems() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Master of Computer Applications',
            style: TextStyle(fontWeight: FontWeight.bold)),
        Text('AMRITA SCHOOL OF ARTS AND SCIENCES, Kochi, Kerala'),
        Text('Graduated: May 2020 | GPA: 6.63/10.0'),
      ],
    );
  }

  Widget _languageItems() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Malayalam: Native / Bilingual Proficiency'),
        Text('English: Full Professional Proficiency'),
      ],
    );
  }

  Widget _projectItems() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
            '• Quiz software for college library (Windows Client Application with WPF framework and SQL Server)'),
        Text(
            '• Website for travel assistance (ASP.NET and SQL Server with Google Maps API integration)'),
        Text(
            '• Research Paper: "A Predictive analysis on the influence of WIFI 6 in fog computing with OFDMA and MU-MIMO"'),
      ],
    );
  }
}
