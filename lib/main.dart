import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cadastro de Cliente',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8064A2),
        ),
        useMaterial3: true,
      ),
      home: const TelaCadastro(),
    );
  }
}

// ===============================
// TELA 1 - CADASTRO
// ===============================

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final TextEditingController nomeController = TextEditingController();

  final TextEditingController cidadeController = TextEditingController();

  void cadastrar() {
    String nome = nomeController.text;
    String cidade = cidadeController.text;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaResumo(
          nome: nome,
          cidade: cidade,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F3FA),

      appBar: AppBar(
        title: const Text(
          'Cadastro de Cliente',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF8064A2),
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(25),

        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),

              child: Column(
                children: [

                  const Icon(
                    Icons.person_add,
                    size: 65,
                    color: Color(0xFF8064A2),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'Novo cliente',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3D3542),
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Preencha os dados abaixo.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Nome
                  TextField(
                    controller: nomeController,
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      hintText: 'Digite o nome',
                      prefixIcon: const Icon(
                        Icons.person_outline,
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF8F6FA),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Cidade
                  TextField(
                    controller: cidadeController,
                    decoration: InputDecoration(
                      labelText: 'Cidade',
                      hintText: 'Digite a cidade',
                      prefixIcon: const Icon(
                        Icons.location_city,
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF8F6FA),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Botão
                  SizedBox(
                    width: double.infinity,
                    height: 50,

                    child: ElevatedButton(
                      onPressed: cadastrar,

                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8064A2),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),

                      child: const Text(
                        'Cadastrar',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ===============================
// TELA 2 - RESUMO
// ===============================

class TelaResumo extends StatelessWidget {
  final String nome;
  final String cidade;

  const TelaResumo({
    super.key,
    required this.nome,
    required this.cidade,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F3FA),

      appBar: AppBar(
        title: const Text(
          'Resumo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF8064A2),
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),

          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(25),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                const Center(
                  child: Icon(
                    Icons.check_circle_outline,
                    size: 65,
                    color: Color(0xFF8064A2),
                  ),
                ),

                const SizedBox(height: 18),

                const Center(
                  child: Text(
                    'Cadastro realizado!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3D3542),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                Text(
                  'Nome: $nome',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  'Cidade: $cidade',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 48,

                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF8064A2),
                      side: const BorderSide(
                        color: Color(0xFF8064A2),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    child: const Text(
                      'Voltar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}