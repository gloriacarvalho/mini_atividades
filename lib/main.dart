
import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sistema de Cadastro',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F6FA),
      ),
      home: const LoginPage(),
    );
  }
}

// ======================================================
// DADOS DO USUÁRIO CADASTRADO
// ======================================================

String usuarioNome = '';
String usuarioEmail = '';
String usuarioSenha = '';

// ======================================================
// LOGIN
// ======================================================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  bool mostrarSenha = false;

  void entrar() {
    if (usuarioEmail.isEmpty || usuarioSenha.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Você ainda não possui uma conta. Faça seu autocadastro.',
          ),
        ),
      );
      return;
    }

    if (emailController.text.trim() == usuarioEmail &&
        senhaController.text == usuarioSenha) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('E-mail ou senha incorretos.'),
        ),
      );
    }
  }

  void abrirAutocadastro() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AutocadastroPage(),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 38,
                      backgroundColor: Colors.indigo.shade50,
                      child: const Icon(
                        Icons.person_outline,
                        size: 42,
                        color: Colors.indigo,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'Bem-vindo!',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'Entre na sua conta para continuar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),

                    const SizedBox(height: 30),

                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                        hintText: 'Digite seu e-mail',
                        prefixIcon: const Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    TextField(
                      controller: senhaController,
                      obscureText: !mostrarSenha,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        hintText: 'Digite sua senha',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              mostrarSenha = !mostrarSenha;
                            });
                          },
                          icon: Icon(
                            mostrarSenha
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: entrar,
                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    const Text(
                      'Ainda não possui uma conta?',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 5),

                    TextButton(
                      onPressed: abrirAutocadastro,
                      child: const Text(
                        'Criar minha conta',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ======================================================
// AUTOCADASTRO
// ======================================================

class AutocadastroPage extends StatefulWidget {
  const AutocadastroPage({super.key});

  @override
  State<AutocadastroPage> createState() => _AutocadastroPageState();
}

class _AutocadastroPageState extends State<AutocadastroPage> {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final confirmarSenhaController = TextEditingController();

  bool mostrarSenha = false;
  bool mostrarConfirmacao = false;

  void criarConta() {
    final nome = nomeController.text.trim();
    final email = emailController.text.trim();
    final senha = senhaController.text;
    final confirmarSenha = confirmarSenhaController.text;

    if (nome.isEmpty ||
        email.isEmpty ||
        senha.isEmpty ||
        confirmarSenha.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha todos os campos.'),
        ),
      );
      return;
    }

    if (!email.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Digite um e-mail válido.'),
        ),
      );
      return;
    }

    if (senha.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('A senha deve ter pelo menos 4 caracteres.'),
        ),
      );
      return;
    }

    if (senha != confirmarSenha) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('As senhas não coincidem.'),
        ),
      );
      return;
    }

    // Salva os dados do usuário
    usuarioNome = nome;
    usuarioEmail = email;
    usuarioSenha = senha;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Conta criada com sucesso!'),
      ),
    );

    // Volta para o Login
    Navigator.pop(context);
  }

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    senhaController.dispose();
    confirmarSenhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Criar Conta',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.indigo.shade50,
                    child: const Icon(
                      Icons.person_add_outlined,
                      size: 40,
                      color: Colors.indigo,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'Autocadastro',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 7),

                  Text(
                    'Crie sua conta para acessar o sistema.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),

                  const SizedBox(height: 25),

                  TextField(
                    controller: nomeController,
                    decoration: InputDecoration(
                      labelText: 'Nome completo',
                      hintText: 'Digite seu nome',
                      prefixIcon: const Icon(Icons.person_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),

                  const SizedBox(height: 17),

                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      hintText: 'Digite seu e-mail',
                      prefixIcon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),

                  const SizedBox(height: 17),

                  TextField(
                    controller: senhaController,
                    obscureText: !mostrarSenha,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      hintText: 'Crie uma senha',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            mostrarSenha = !mostrarSenha;
                          });
                        },
                        icon: Icon(
                          mostrarSenha
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),

                  const SizedBox(height: 17),

                  TextField(
                    controller: confirmarSenhaController,
                    obscureText: !mostrarConfirmacao,
                    decoration: InputDecoration(
                      labelText: 'Confirmar senha',
                      hintText: 'Digite a senha novamente',
                      prefixIcon: const Icon(Icons.lock_reset_outlined),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            mostrarConfirmacao = !mostrarConfirmacao;
                          });
                        },
                        icon: Icon(
                          mostrarConfirmacao
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: criarConta,
                      icon: const Icon(Icons.check),
                      label: const Text(
                        'Criar minha conta',
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
        ],
      ),
    );
  }
}

// ======================================================
// TELA INICIAL
// ======================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tela Inicial',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      drawer: const MenuLateral(),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 10),

          Text(
            'Olá, ${usuarioNome.isEmpty ? 'usuário' : usuarioNome}! 👋',
            style: const TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            'Bem-vindo ao sistema de cadastro.',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 25),

          // PERFIL
          Card(
            elevation: 3,
            child: ListTile(
              contentPadding: const EdgeInsets.all(18),
              leading: const CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/150?img=47',
                ),
              ),
              title: const Text(
                'Meu Perfil',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              subtitle: const Text(
                'Visualizar informações do usuário',
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PerfilPage(),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 15),

          // CADASTRO DE CLIENTE
          Card(
            elevation: 3,
            child: ListTile(
              contentPadding: const EdgeInsets.all(18),
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.indigo.shade50,
                child: const Icon(
                  Icons.person_add_alt_1,
                  color: Colors.indigo,
                ),
              ),
              title: const Text(
                'Cadastrar Cliente',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              subtitle: const Text(
                'Nome e cidade do cliente',
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CadastroPage(),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 15),

          // FUNCIONÁRIOS
          Card(
            elevation: 3,
            child: ListTile(
              contentPadding: const EdgeInsets.all(18),
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.green.shade50,
                child: const Icon(
                  Icons.groups_outlined,
                  color: Colors.green,
                ),
              ),
              title: const Text(
                'Funcionários',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              subtitle: const Text(
                'Lista de funcionários',
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FuncionariosPage(),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 15),

          // PRODUTOS
          Card(
            elevation: 3,
            child: ListTile(
              contentPadding: const EdgeInsets.all(18),
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.orange.shade50,
                child: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.orange,
                ),
              ),
              title: const Text(
                'Produtos',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              subtitle: const Text(
                'Catálogo de produtos',
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProdutosPage(),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 15),

          // CONTATOS
          Card(
            elevation: 3,
            child: ListTile(
              contentPadding: const EdgeInsets.all(18),
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.purple.shade50,
                child: const Icon(
                  Icons.contacts_outlined,
                  color: Colors.purple,
                ),
              ),
              title: const Text(
                'Contatos',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              subtitle: const Text(
                'Lista de contatos',
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContatosPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ======================================================
// MENU LATERAL
// ======================================================

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.indigo,
            ),
            accountName: Text(
              usuarioNome.isEmpty ? 'Usuário' : usuarioNome,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              usuarioEmail.isEmpty
                  ? 'usuario@email.com'
                  : usuarioEmail,
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://i.pravatar.cc/150?img=47',
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Início'),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Perfil'),
            onTap: () {
              Navigator.pop(context);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PerfilPage(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.person_add_outlined),
            title: const Text('Cadastrar cliente'),
            onTap: () {
              Navigator.pop(context);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CadastroPage(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.groups_outlined),
            title: const Text('Funcionários'),
            onTap: () {
              Navigator.pop(context);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FuncionariosPage(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.shopping_bag_outlined),
            title: const Text('Produtos'),
            onTap: () {
              Navigator.pop(context);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProdutosPage(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.contacts_outlined),
            title: const Text('Contatos'),
            onTap: () {
              Navigator.pop(context);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ContatosPage(),
                ),
              );
            },
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sair'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}

// ======================================================
// CADASTRO DE CLIENTE
// ======================================================

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final nomeController = TextEditingController();
  final cidadeController = TextEditingController();

  void cadastrar() {
    if (nomeController.text.trim().isEmpty ||
        cidadeController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha o nome e a cidade.'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResumoPage(
          nome: nomeController.text.trim(),
          cidade: cidadeController.text.trim(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nomeController.dispose();
    cidadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Cliente'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                children: [
                  const Icon(
                    Icons.person_add_alt_1,
                    size: 55,
                    color: Colors.indigo,
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'Novo Cliente',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 25),

                  TextField(
                    controller: nomeController,
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      hintText: 'Digite o nome do cliente',
                      prefixIcon: const Icon(Icons.person_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  TextField(
                    controller: cidadeController,
                    decoration: InputDecoration(
                      labelText: 'Cidade',
                      hintText: 'Digite a cidade',
                      prefixIcon: const Icon(Icons.location_city_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: cadastrar,
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text(
                        'Ver resumo',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ======================================================
// RESUMO
// ======================================================

class ResumoPage extends StatelessWidget {
  final String nome;
  final String cidade;

  const ResumoPage({
    super.key,
    required this.nome,
    required this.cidade,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumo do Cadastro'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    size: 65,
                    color: Colors.green,
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'Cadastro realizado!',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  ListTile(
                    leading: const Icon(
                      Icons.person_outline,
                      color: Colors.indigo,
                    ),
                    title: const Text(
                      'Nome',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(nome),
                  ),

                  const Divider(),

                  ListTile(
                    leading: const Icon(
                      Icons.location_city_outlined,
                      color: Colors.indigo,
                    ),
                    title: const Text(
                      'Cidade',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(cidade),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Voltar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ======================================================
// PERFIL
// ======================================================

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Usuário'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 65,
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/300?img=47',
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    usuarioNome.isEmpty
                        ? 'Usuário'
                        : usuarioNome,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 5),

                  Text(
                    'Desenvolvedor(a) de Sistemas',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 25),

                  ListTile(
                    leading: const Icon(Icons.person_outline),
                    title: const Text('Nome'),
                    subtitle: Text(
                      usuarioNome.isEmpty
                          ? 'Usuário'
                          : usuarioNome,
                    ),
                  ),

                  ListTile(
                    leading: const Icon(Icons.work_outline),
                    title: const Text('Profissão'),
                    subtitle: const Text(
                      'Desenvolvedor(a) de Sistemas',
                    ),
                  ),

                  ListTile(
                    leading: const Icon(Icons.email_outlined),
                    title: const Text('E-mail'),
                    subtitle: Text(
                      usuarioEmail.isEmpty
                          ? 'usuario@email.com'
                          : usuarioEmail,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ======================================================
// FUNCIONÁRIOS
// ======================================================

class FuncionariosPage extends StatelessWidget {
  const FuncionariosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final funcionarios = [
      {
        'nome': 'Ana Martins',
        'cargo': 'Desenvolvedora',
        'imagem': 'https://i.pravatar.cc/150?img=47',
      },
      {
        'nome': 'Lucas Silva',
        'cargo': 'Analista',
        'imagem': 'https://i.pravatar.cc/150?img=12',
      },
      {
        'nome': 'Mariana Souza',
        'cargo': 'Designer',
        'imagem': 'https://i.pravatar.cc/150?img=32',
      },
      {
        'nome': 'Pedro Santos',
        'cargo': 'Gerente',
        'imagem': 'https://i.pravatar.cc/150?img=11',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Funcionários'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: funcionarios.length,
        itemBuilder: (context, index) {
          final funcionario = funcionarios[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 14),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  funcionario['imagem']!,
                ),
              ),
              title: Text(
                funcionario['nome']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                funcionario['cargo']!,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
          );
        },
      ),
    );
  }
}

// ======================================================
// PRODUTOS
// ======================================================

class ProdutosPage extends StatelessWidget {
  const ProdutosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final produtos = [
      {
        'nome': 'Notebook',
        'preco': 'R\$ 3.500,00',
      },
      {
        'nome': 'Teclado',
        'preco': 'R\$ 150,00',
      },
      {
        'nome': 'Mouse',
        'preco': 'R\$ 90,00',
      },
      {
        'nome': 'Monitor',
        'preco': 'R\$ 850,00',
      },
      {
        'nome': 'Headset',
        'preco': 'R\$ 220,00',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Produtos'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          final produto = produtos[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.shopping_bag_outlined),
              ),
              title: Text(
                produto['nome']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text('Produto disponível'),
              trailing: Text(
                produto['preco']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ======================================================
// CONTATOS
// ======================================================

class ContatosPage extends StatelessWidget {
  const ContatosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contatos = [
      {
        'nome': 'Ana Martins',
        'telefone': '(12) 99999-1111',
      },
      {
        'nome': 'Lucas Silva',
        'telefone': '(12) 99999-2222',
      },
      {
        'nome': 'Mariana Souza',
        'telefone': '(12) 99999-3333',
      },
      {
        'nome': 'Pedro Santos',
        'telefone': '(12) 99999-4444',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Contatos'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: contatos.length,
        itemBuilder: (context, index) {
          final contato = contatos[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.person_outline),
              ),
              title: Text(
                contato['nome']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                contato['telefone']!,
              ),
              trailing: const Icon(
                Icons.phone_outlined,
              ),
            ),
          );
        },
      ),
    );
  }
}

