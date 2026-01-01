import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/theme/theme.dart';
import '../../../utils/constants.dart';
import '../../../shared/widgets/fade_in_animation.dart';
import 'widgets/contact_info_item.dart';
import 'widgets/contact_form.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60),
      alignment: Alignment.center,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 900) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildContactInfo(context)),
                  const SizedBox(width: 60),
                  const Expanded(child: ContactForm()),
                ],
              );
            } else {
              return Column(
                children: [
                  _buildContactInfo(context),
                  const SizedBox(height: 60),
                  const ContactForm(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInAnimation(
          delay: const Duration(milliseconds: 100),
          child: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [AppTheme.primaryColor, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: Text(
              "Get In Touch",
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Let's work together! I'm currently looking for new opportunities. Whether you have a question or just want to say hi, I'll try my best to get back to you!",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
        ),
        const SizedBox(height: 40),
        FadeInAnimation(
          delay: const Duration(milliseconds: 300),
          child: ContactInfoItem(
            icon: Icons.email_outlined,
            title: "Email",
            content: Constants.email,
            onTap: () async {
              final Uri url = Uri.parse("mailto:${Constants.email}");
              if (await canLaunchUrl(url)) await launchUrl(url);
            },
          ),
        ),
        const SizedBox(height: 20),
        ContactInfoItem(
          icon: FontAwesomeIcons.linkedin,
          title: "LinkedIn",
          content: "Connect on LinkedIn",
          onTap: () async {
            final Uri url = Uri.parse(Constants.linkedinUrl);
            if (await canLaunchUrl(url)) await launchUrl(url);
          },
        ),
        const SizedBox(height: 20),
        ContactInfoItem(
          icon: FontAwesomeIcons.github,
          title: "GitHub",
          content: "Check out my code",
          onTap: () async {
            final Uri url = Uri.parse(Constants.githubUrl);
            if (await canLaunchUrl(url)) await launchUrl(url);
          },
        ),
      ],
    );
  }
}
