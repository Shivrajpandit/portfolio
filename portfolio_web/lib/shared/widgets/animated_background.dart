import 'dart:math';
import 'package:flutter/material.dart';
import '../../core/theme/theme.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with TickerProviderStateMixin {
  late AnimationController _particleController;
  late AnimationController _waveController;
  late AnimationController _orbController;

  final List<Particle> _particles = [];
  final List<FloatingOrb> _orbs = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();

    // Particle animation
    _particleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    // Wave animation
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();

    // Orb animation
    _orbController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..repeat();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_particles.isEmpty) {
      final size = MediaQuery.of(context).size;

      // Create particles
      final particleCount = (size.width * size.height) ~/ 15000;
      for (int i = 0; i < particleCount; i++) {
        _particles.add(
          Particle(
            position: Offset(
              _random.nextDouble() * size.width,
              _random.nextDouble() * size.height,
            ),
            velocity: Offset(
              (_random.nextDouble() - 0.5) * 1.2,
              (_random.nextDouble() - 0.5) * 1.2,
            ),
            size: _random.nextDouble() * 3 + 1,
            pulseSpeed: _random.nextDouble() * 2 + 1,
            pulseOffset: _random.nextDouble() * 2 * pi,
            colorVariant: _random.nextInt(4),
          ),
        );
      }

      // Create floating orbs
      for (int i = 0; i < 5; i++) {
        _orbs.add(
          FloatingOrb(
            position: Offset(
              _random.nextDouble() * size.width,
              _random.nextDouble() * size.height,
            ),
            size: _random.nextDouble() * 200 + 150,
            speed: _random.nextDouble() * 0.5 + 0.3,
            angle: _random.nextDouble() * 2 * pi,
            colorIndex: i % 3,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _particleController.dispose();
    _waveController.dispose();
    _orbController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Floating Orbs Layer
        AnimatedBuilder(
          animation: _orbController,
          builder: (context, child) {
            return CustomPaint(
              painter: OrbPainter(_orbs, _orbController.value),
              size: Size.infinite,
            );
          },
        ),

        // Wave Layer
        AnimatedBuilder(
          animation: _waveController,
          builder: (context, child) {
            return CustomPaint(
              painter: WavePainter(_waveController.value),
              size: Size.infinite,
            );
          },
        ),

        // Particles Layer
        AnimatedBuilder(
          animation: _particleController,
          builder: (context, child) {
            _updateParticles(MediaQuery.of(context).size);
            return CustomPaint(
              painter: ParticlePainter(_particles, _particleController.value),
              size: Size.infinite,
            );
          },
        ),
      ],
    );
  }

  void _updateParticles(Size size) {
    for (var particle in _particles) {
      particle.position += particle.velocity;

      // Wrap around edges
      if (particle.position.dx < 0) {
        particle.position = Offset(size.width, particle.position.dy);
      } else if (particle.position.dx > size.width) {
        particle.position = Offset(0, particle.position.dy);
      }

      if (particle.position.dy < 0) {
        particle.position = Offset(particle.position.dx, size.height);
      } else if (particle.position.dy > size.height) {
        particle.position = Offset(particle.position.dx, 0);
      }
    }
  }
}

// Particle class
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

// Floating Orb class
class FloatingOrb {
  Offset position;
  double size;
  double speed;
  double angle;
  int colorIndex;

  FloatingOrb({
    required this.position,
    required this.size,
    required this.speed,
    required this.angle,
    required this.colorIndex,
  });
}

// Orb Painter - Floating gradient orbs
class OrbPainter extends CustomPainter {
  final List<FloatingOrb> orbs;
  final double animationValue;

  OrbPainter(this.orbs, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    for (var orb in orbs) {
      // Update orb position
      final movement = sin(animationValue * 2 * pi * orb.speed + orb.angle);
      final orbX = orb.position.dx + movement * 50;
      final orbY =
          orb.position.dy + cos(animationValue * 2 * pi * orb.speed) * 30;

      // Gradient colors
      List<Color> gradientColors;
      switch (orb.colorIndex) {
        case 0:
          gradientColors = [
            AppTheme.primaryColor.withOpacity(0.15),
            AppTheme.primaryColor.withOpacity(0.05),
            Colors.transparent,
          ];
          break;
        case 1:
          gradientColors = [
            Colors.purpleAccent.withOpacity(0.12),
            Colors.purpleAccent.withOpacity(0.04),
            Colors.transparent,
          ];
          break;
        default:
          gradientColors = [
            const Color(0xFFFF6B9D).withOpacity(0.1),
            const Color(0xFFFF6B9D).withOpacity(0.03),
            Colors.transparent,
          ];
      }

      final paint = Paint()
        ..shader =
            RadialGradient(
              colors: gradientColors,
              stops: const [0.0, 0.5, 1.0],
            ).createShader(
              Rect.fromCircle(center: Offset(orbX, orbY), radius: orb.size),
            );

      canvas.drawCircle(Offset(orbX, orbY), orb.size, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// Wave Painter - Animated waves
class WavePainter extends CustomPainter {
  final double animationValue;

  WavePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    // Draw multiple waves
    for (int i = 0; i < 3; i++) {
      final path = Path();
      final waveHeight = 40.0;
      final waveLength = size.width / 2;
      final offset = animationValue * size.width + (i * size.width / 3);
      final yPosition = size.height * (0.3 + i * 0.2);

      path.moveTo(0, yPosition);

      for (double x = 0; x <= size.width; x += 10) {
        final y =
            yPosition + sin((x + offset) / waveLength * 2 * pi) * waveHeight;
        path.lineTo(x, y);
      }

      paint.color = AppTheme.primaryColor.withOpacity(0.08 - i * 0.02);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// Particle Painter - Connected particles
class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final double animationValue;

  ParticlePainter(this.particles, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      // Pulsing effect
      final pulse = sin(
        animationValue * 2 * pi * particle.pulseSpeed + particle.pulseOffset,
      );
      final pulseOpacity = 0.25 + (pulse * 0.2);
      final pulseSize = particle.size * (1 + pulse * 0.3);

      // Color variants
      Color particleColor;
      switch (particle.colorVariant) {
        case 0:
          particleColor = AppTheme.primaryColor;
          break;
        case 1:
          particleColor = Colors.purpleAccent;
          break;
        case 2:
          particleColor = const Color(0xFFFF6B9D);
          break;
        default:
          particleColor = Colors.cyanAccent;
      }

      final paint = Paint()
        ..color = particleColor.withOpacity(pulseOpacity)
        ..strokeCap = StrokeCap.round;

      // Draw particle with glow
      canvas.drawCircle(
        particle.position,
        pulseSize / 2,
        paint..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3),
      );

      // Connect nearby particles
      for (var other in particles) {
        final distance = (particle.position - other.position).distance;
        if (distance < 100 && distance > 0) {
          final linePaint = Paint()
            ..color = particleColor.withOpacity(
              pulseOpacity * 0.2 * (1 - distance / 100),
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
