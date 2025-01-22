import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/repositorty/user_repository.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _name = "";
  String _username = "";
  String _password = "";

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.message_outlined),
        title: const Text("Регистрация"),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.close))
        ],
      ),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.black38),
                  child: SizedBox(
                    width: double.infinity,
                    height: 335,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            TextFormField(
                              maxLength: 15,
                              decoration: const InputDecoration(
                                  hintText: 'Введите имя',
                                  labelText: 'Имя',
                                  prefixIcon: Icon(
                                    Icons.person,
                                  ),
                                  errorStyle: TextStyle(fontSize: 18.0),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(9.0)))),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Имя должно быть заполнено";
                                } return null;
                              },
                              onSaved: (value) {
                                _name = value!;
                              },
                            ),

                            const SizedBox(height: 15),

                            TextFormField(
                              decoration: const InputDecoration(
                                  hintText: 'Введите номер телефона',
                                  labelText: 'Номер телефона',
                                  prefixIcon: Icon(Icons.phone),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(9)))),
                              maxLength: 11,
                              validator: (value) {
                                if (value == null || value.isEmpty || value.length < 11) {
                                  return "Не корректный номер телефона";
                                } return null;
                              },
                              onSaved: (value) {
                                _username = value!;
                              },
                            ),

                            const SizedBox(height: 15),

                            TextFormField(
                              maxLength: 20,
                              decoration: const InputDecoration(
                                  hintText: 'Введите пароль',
                                  labelText: 'Пароль',
                                  prefixIcon: Icon(
                                    Icons.password,
                                  ),
                                  errorStyle: TextStyle(fontSize: 18.0),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(9.0)))),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Пароль не заполнен";
                                } return null;
                              },
                              onSaved: (value) {
                                _password = value!;
                              },
                            ),

                            const SizedBox(height: 15),

                            SizedBox(
                              width: double.infinity,
                              child: Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.white),
                                child: TextButton(
                                    onPressed: () async {
                                      if (_formkey.currentState!.validate()) {
                                        UserRepository userRepository = UserRepository(dio: Dio());
                                        await userRepository.registerUser(_name, _username, _password);
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: const Text('Отправить')),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
