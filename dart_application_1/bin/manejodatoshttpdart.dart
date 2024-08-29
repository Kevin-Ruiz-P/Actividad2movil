
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user.dart';

void main() async {
  // URL de la API
  final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
  // Realizar la petición GET
  final response = await http.get(url);
  print(response);
  // Verificar si la petición fue exitosa
  if (response.statusCode == 200) {
    // Parsear la respuesta JSON a una lista
    List<dynamic> jsonData = json.decode(response.body);

    // Crear una lista de Post
    List<User> users = jsonData.map((json) => User.fromJson(json)).toList();

    // Mostrar los datos
    users.forEach((user) {
      print('User ID: ${user.id}');
      print('NAME: ${user.name}');
      print('User NAME: ${user.username}');
      print('EMAIL: ${user.email}');
      print('---');
    });
  } else {
    // Manejo de errores
    print('Error al obtener los datos: ${response.statusCode}');
  }
}
/**Kevin Ruiz*/