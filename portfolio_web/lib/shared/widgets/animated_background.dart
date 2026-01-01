import 'dart:math';
import 'package:flutter/material.dart';
import '../../core/theme/theme.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Particle> _particles = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_particles.isEmpty) {
      final size = MediaQuery.of(context).size;
      final particleCount =
          (size.width * size.height) ~/ 20000; // Reduced for performance
      for (int i = 0; i < particleCount; i++) {
        _particles.add(
          Particle(
            position: Offset(
              _random.nextDouble() * size.width,
              _random.nextDouble() * size.height,
            ),
            velocity: Offset(
              (_random.nextDouble() - 0.5) * 1.5,
              (_random.nextDouble() - 0.5) * 1.5,
            ),
            size: _random.nextDouble() * 4 + 1,
            pulseSpeed: _random.nextDouble() * 2 + 1,
            pulseOffset: _random.nextDouble() * 2 * pi,
            colorVariant: _random.nextInt(3),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        _updateParticles(MediaQuery.of(context).size);
        return CustomPaint(
          painter: _ParticlePainter(_particles, _controller.value),
          child: Container(),
        );
      },
    );
  }

  void _updateParticles(Size size) {
    for (var particle in _particles) {
      particle.position += particle.velocity;

      // Bounce off edges
      if (particle.position.dx < 0 || particle.position.dx > size.width) {
        particle.velocity = Offset(-particle.velocity.dx, particle.velocity.dy);
      }
      if (particle.position.dy < 0 || particle.position.dy > size.height) {
        particle.velocity = Offset(particle.velocity.dx, -particle.velocity.dy);
      }
    }
  }
}

class Particle {
  Offset position;
  Offset velocity;
  double size;
  double pulseSpeed;
  double pulseOffset;
  int colorVariant;

  Particle({
    required this.position,
    required this.velocity,
    required this.size,
    required this.pulseSpeed,
    required this.pulseOffset,
    required this.colorVariant,
  });
}

class _ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final double animationValue;

  _ParticlePainter(this.particles, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      // Pulsing effect
      final pulse = sin(
        animationValue * 2 * pi * particle.pulseSpeed + particle.pulseOffset,
      );
      final pulseOpacity = 0.2 + (pulse * 0.15);
      final pulseSize = particle.size * (1 + pulse * 0.2);

      // Color variants
      Color particleColor;
      switch (particle.colorVariant) {
        case 0:
          particleColor = AppTheme.primaryColor;
          break;
        case 1:
          particleColor = const Color(0xFF8892B0);
          break;
        default:
          particleColor = Colors.white;
      }

      final paint = Paint()
        ..color = particleColor.withOpacity(pulseOpacity)
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 1.0;

      // Draw particle with glow
      canvas.drawCircle(
        particle.position,
        pulseSize / 2,
        paint..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2),
      );

      // Connect particles close to each other
      for (var other in particles) {
        final distance = (particle.position - other.position).distance;
        if (distance < 120 && distance > 0) {
          final linePaint = Paint()
            ..color = particleColor.withOpacity(
              pulseOpacity * 0.3 * (1 - distance / 120),
            )
            ..strokeWidth = 0.5;
          canvas.drawLine(particle.position, other.position, linePaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
