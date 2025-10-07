import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../presentation/providers/auth_providers.dart';
import '../../../app/routes.dart' as r;

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _userCtrl = TextEditingController(text: 'demo@example.com');
  final TextEditingController _passCtrl = TextEditingController(text: 'password');
  bool _loading = false;

  @override
  void dispose() {
    _userCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() => _loading = true);
    try {
      final repo = ref.read(authRepositoryProvider);
      await repo.login(emailOrUsername: _userCtrl.text.trim(), password: _passCtrl.text);
      if (mounted) {
        Navigator.of(context).pushReplacementNamed(r.Routes.dashboard);
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed: $e')));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(controller: _userCtrl, decoration: const InputDecoration(labelText: 'Email or Username')),
            const SizedBox(height: 12),
            TextField(controller: _passCtrl, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _loading ? null : _submit, child: _loading ? const CircularProgressIndicator() : const Text('Sign in')),
          ],
        ),
      ),
    );
  }
}


