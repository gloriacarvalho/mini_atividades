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
      title: 'Meu Espaço',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4),
        ),
        scaffoldBackgroundColor: const Color(0xFFF8F7FC),
      ),
      home: const Inicio(),
    );
  }
}

// ======================================================
// INÍCIO
// ======================================================

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Meu Espaço',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),

      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
        children: [

          // CABEÇALHO
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF6750A4),
                  Color(0xFF8E79C7),
                ],
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.waving_hand_rounded,
                  color: Colors.white,
                  size: 32,
                ),

                SizedBox(height: 12),

                Text(
                  'Olá, seja bem-vindo!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 6),

                Text(
                  'Acesse seus dados e confira as opções disponíveis.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            'Seu perfil',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          // PERFIL
          Card(
            elevation: 0,
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),

              leading: ClipOval(
                child: Image.network(
                  'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                  width: 58,
                  height: 58,
                ),
              ),

              title: const Text(
                'Maria Silva',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: const Text(
                'Desenvolvedora de Sistemas',
              ),

              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PerfilUsuario(),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            'Acesso rápido',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          // PRIMEIRA LINHA
          Row(
            children: [

              Expanded(
                child: CardMenu(
                  icone: Icons.person_add_alt_1,
                  titulo: 'Cadastro',
                  subtitulo: 'Novo cliente',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const CadastroCliente(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: CardMenu(
                  icone: Icons.badge_outlined,
                  titulo: 'Funcionários',
                  subtitulo: 'Nossa equipe',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const ListaFuncionarios(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // SEGUNDA LINHA
          Row(
            children: [

              Expanded(
                child: CardMenu(
                  icone: Icons.shopping_bag_outlined,
                  titulo: 'Produtos',
                  subtitulo: 'Nosso catálogo',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const ListaProdutos(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: CardMenu(
                  icone: Icons.people_outline,
                  titulo: 'Contatos',
                  subtitulo: 'Fale conosco',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const ListaContatos(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ======================================================
// CARD DO MENU
// ======================================================

class CardMenu extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String subtitulo;
  final VoidCallback onTap;

  const CardMenu({
    super.key,
    required this.icone,
    required this.titulo,
    required this.subtitulo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFEDE7F6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icone,
                  color: const Color(0xFF6750A4),
                ),
              ),

              const SizedBox(height: 15),

              Text(
                titulo,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                subtitulo,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ======================================================
// CADASTRO DE CLIENTE
// ======================================================

class CadastroCliente extends StatefulWidget {
  const CadastroCliente({super.key});

  @override
  State<CadastroCliente> createState() =>
      _CadastroClienteState();
}

class _CadastroClienteState extends State<CadastroCliente> {

  final nomeController = TextEditingController();
  final cidadeController = TextEditingController();

  void continuar() {

    if (nomeController.text.isEmpty ||
        cidadeController.text.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Preencha todos os campos.',
          ),
        ),
      );

      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResumoCliente(
          nome: nomeController.text,
          cidade: cidadeController.text,
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
        title: const Text('Novo cliente'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          const Text(
            'Cadastrar cliente',
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Informe os dados abaixo para continuar.',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 30),

          TextField(
            controller: nomeController,
            decoration: InputDecoration(
              labelText: 'Nome',
              prefixIcon: const Icon(Icons.person_outline),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),

          const SizedBox(height: 18),

          TextField(
            controller: cidadeController,
            decoration: InputDecoration(
              labelText: 'Cidade',
              prefixIcon: const Icon(Icons.location_on_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),

          const SizedBox(height: 25),

          SizedBox(
            height: 52,
            child: ElevatedButton(
              onPressed: continuar,
              child: const Text(
                'Continuar',
                style: TextStyle(
                  fontSize: 16,
                ),
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

class ResumoCliente extends StatelessWidget {

  final String nome;
  final String cidade;

  const ResumoCliente({
    super.key,
    required this.nome,
    required this.cidade,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumo'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Cadastro realizado!',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Confira os dados informados.',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [

                    ItemResumo(
                      icone: Icons.person_outline,
                      titulo: 'Nome',
                      valor: nome,
                    ),

                    const Divider(height: 30),

                    ItemResumo(
                      icone: Icons.location_on_outlined,
                      titulo: 'Cidade',
                      valor: cidade,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemResumo extends StatelessWidget {

  final IconData icone;
  final String titulo;
  final String valor;

  const ItemResumo({
    super.key,
    required this.icone,
    required this.titulo,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [

        Icon(
          icone,
          color: const Color(0xFF6750A4),
        ),

        const SizedBox(width: 15),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              titulo,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),

            Text(
              valor,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ======================================================
// PERFIL
// ======================================================

class PerfilUsuario extends StatelessWidget {

  const PerfilUsuario({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu perfil'),
      ),

      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(30),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                ClipOval(
                  child: Image.network(
                    'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                    width: 130,
                    height: 130,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Maria Silva',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 7),

                const Text(
                  'Desenvolvedora de Sistemas',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
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

// ======================================================
// CARTÃO DE FUNCIONÁRIO
// ======================================================

class CartaoFuncionario extends StatelessWidget {

  const CartaoFuncionario({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cartão de funcionário'),
      ),

      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          elevation: 4,

          child: Padding(
            padding: const EdgeInsets.all(25),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Image.network(
                  'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                  width: 130,
                  height: 130,
                ),

                const SizedBox(height: 18),

                const Text(
                  'Maria Silva',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 7),

                const Text(
                  'Desenvolvedora de Sistemas',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  'Tecnologia',
                  style: TextStyle(
                    color: Colors.grey,
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

// ======================================================
// FUNCIONÁRIOS
// ======================================================

class ListaFuncionarios extends StatelessWidget {

  const ListaFuncionarios({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nossa equipe'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(12),

        children: const [

          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(
              'Ana Souza',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Analista de Sistemas',
            ),
          ),

          Divider(),

          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(
              'Carlos Oliveira',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Desenvolvedor',
            ),
          ),

          Divider(),

          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(
              'Juliana Santos',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Gerente de Projetos',
            ),
          ),

          Divider(),

          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(
              'Lucas Pereira',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Suporte Técnico',
            ),
          ),
        ],
      ),
    );
  }
}

// ======================================================
// PRODUTOS
// ======================================================

class ListaProdutos extends StatelessWidget {

  const ListaProdutos({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(12),

        children: const [

          ListTile(
            leading: Icon(Icons.headphones),
            title: Text(
              'Fone de Ouvido',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('Áudio'),
            trailing: Text(
              'R\$ 89,90',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.phone_android),
            title: Text(
              'Smartphone',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('Eletrônicos'),
            trailing: Text(
              'R\$ 1.299,90',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.keyboard),
            title: Text(
              'Teclado Mecânico',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('Acessórios'),
            trailing: Text(
              'R\$ 249,90',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.mouse),
            title: Text(
              'Mouse Gamer',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('Acessórios'),
            trailing: Text(
              'R\$ 149,90',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.watch),
            title: Text(
              'Smartwatch',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('Tecnologia'),
            trailing: Text(
              'R\$ 399,90',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ======================================================
// CONTATOS
// ======================================================

class ListaContatos extends StatelessWidget {

  const ListaContatos({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(12),

        children: const [

          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(
              'Ana',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('(12) 99999-1111'),
            trailing: Icon(Icons.phone),
          ),

          Divider(),

          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(
              'Carlos',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('(12) 98888-2222'),
            trailing: Icon(Icons.phone),
          ),

          Divider(),

          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(
              'Juliana',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('(12) 97777-3333'),
            trailing: Icon(Icons.phone),
          ),

          Divider(),

          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(
              'Lucas',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('(12) 96666-4444'),
            trailing: Icon(Icons.phone),
          ),
        ],
      ),
    );
  }
}