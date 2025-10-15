import 'package:flutter/material.dart';
import '../theme/styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGrey,
      appBar: AppBar(
        backgroundColor: kDarkGrey,
        title: const Text('Profile', style: kAppBarTextStyle),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: kWhite),
            onPressed: () {},
          ),
        ],
      ),
      body: const Center(
        child: ProfileCard(),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 400,
        ),
        child: Container(
          padding: const EdgeInsets.all(kSpacingL),
          decoration: BoxDecoration(
            color: kDarkBlue,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ProfileAvatar(),
              SizedBox(height: kSpacingM),
              ProfileInfo(),
              SizedBox(height: kSpacingL),
              ProfileStats(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage('assets/images/perfil.jpg'),
        ),
        Positioned(
          bottom: 0,
          right: 40, // Adjust this value to position the badge correctly
          child: Container(
            padding: const EdgeInsets.all(kSpacingS),
            decoration: const BoxDecoration(
              color: kDarkBlue,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.verified,
              color: kBlue,
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Jose Canche',
          style: kNameTextStyle,
        ),
        SizedBox(height: kSpacingS),
        Text(
          '@acanche044@gmail.com',
          style: kHandleTextStyle,
        ),
      ],
    );
  }
}

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        StatItem(icon: Icons.edit, label: 'Publicaciones', value: '536'),
        StatItem(icon: Icons.group, label: 'Seguidores', value: '5790'),
        StatItem(icon: Icons.person_add, label: 'Seguidos', value: '10'),
      ],
    );
  }
}

class StatItem extends StatelessWidget {
  const StatItem({super.key, required this.icon, required this.label, required this.value});

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(icon, color: kWhite, size: 30),
        const SizedBox(height: kSpacingS),
        Text(
          value,
          style: kStatValueTextStyle,
        ),
        const SizedBox(height: kSpacingS),
        Text(
          label,
          style: kStatLabelTextStyle,
        ),
      ],
    );
  }
}