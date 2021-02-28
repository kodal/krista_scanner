import 'package:flutter/material.dart';
import 'package:krista_scanner/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _obscurePassword = true;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/Logo.png'),
                SizedBox(height: 40),
                Text(
                  'Войдите в аккаунт',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 16),
                Text(
                  'Введите ваш логин и пароль для входа в приложение',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF818690),
                  ),
                ),
                SizedBox(height: 48),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Введите логин:',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                SizedBox(height: 12),
                TextFormField(
                  decoration: _InputDecoration(),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Введите пароль:',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                SizedBox(height: 12),
                TextFormField(
                  decoration: _InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () => setState(
                        () => _obscurePassword = !_obscurePassword,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _obscurePassword,
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => HomePage(),
                    ),
                  ),
                  child: Text('Войти в приложение'),
                )
              ],
            ),
          ),
        ),
      );
}

class _InputDecoration extends InputDecoration {
  _InputDecoration({Widget suffixIcon})
      : super(
          enabledBorder: _InputBorder(),
          disabledBorder: _InputBorder(),
          errorBorder: _InputBorder(color: Colors.red),
          focusedBorder: _InputBorder(color: Colors.blue),
          focusedErrorBorder: _InputBorder(color: Colors.blue),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          suffixIcon: suffixIcon,
        );
}

class _InputBorder extends OutlineInputBorder {
  _InputBorder({
    Color color = const Color(0xFFDBDBE7),
  }) : super(
          borderSide: BorderSide(color: color),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6),
          ),
        );
}
