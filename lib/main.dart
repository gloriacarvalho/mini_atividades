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
      title: 'Projetos Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: const TelaInicial(),
    );
  }
}

// ===============================
// TELA INICIAL
// ===============================

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atividades Flutter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            const Text(
              'Projetos',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Escolha uma atividade para visualizar',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            // CARTÃO DE FUNCIONÁRIO
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const CartaoFuncionario(),
                  ),
                );
              },
              icon: const Icon(Icons.badge),
              label: const Text('Cartão de Funcionário'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(18),
              ),
            ),

            const SizedBox(height: 15),

            // LISTA DE FUNCIONÁRIOS
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const ListaFuncionarios(),
                  ),
                );
              },
              icon: const Icon(Icons.people),
              label: const Text('Lista de Funcionários'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(18),
              ),
            ),

            const SizedBox(height: 15),

            // CATÁLOGO
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const CatalogoProdutos(),
                  ),
                );
              },
              icon: const Icon(Icons.shopping_bag),
              label: const Text('Catálogo de Produtos'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(18),
              ),
            ),

            const SizedBox(height: 15),

            // CONTATOS
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const ListaContatos(),
                  ),
                );
              },
              icon: const Icon(Icons.contacts),
              label: const Text('Lista de Contatos'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ===============================
// 1 - CARTÃO DE FUNCIONÁRIO
// ===============================

class CartaoFuncionario extends StatelessWidget {
  const CartaoFuncionario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cartão de Funcionário'),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/funcionario.png',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),

                const SizedBox(height: 20),

                const Text(
                  'Maria Silva',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Desenvolvedora de Sistemas',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  'Setor: Tecnologia',
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

// ===============================
// 2 - LISTA DE FUNCIONÁRIOS
// ===============================

class ListaFuncionarios extends StatelessWidget {
  const ListaFuncionarios({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Funcionários'),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text('Ana Souza'),
            subtitle: Text('Analista de Sistemas'),
          ),

          Divider(),

          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text('Carlos Oliveira'),
            subtitle: Text('Desenvolvedor'),
          ),

          Divider(),

          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text('Juliana Santos'),
            subtitle: Text('Gerente de Projetos'),
          ),

          Divider(),

          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text('Lucas Pereira'),
            subtitle: Text('Suporte Técnico'),
          ),
        ],
      ),
    );
  }
}

// ===============================
// 3 - CATÁLOGO DE PRODUTOS
// ===============================

class CatalogoProdutos extends StatelessWidget {
  const CatalogoProdutos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Produtos'),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.headphones),
            title: Text('Fone de Ouvido'),
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
            title: Text('Smartphone'),
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
            title: Text('Teclado Mecânico'),
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
            title: Text('Mouse Gamer'),
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
            title: Text('Smartwatch'),
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

// ===============================
// 4 - LISTA DE CONTATOS
// ===============================

class ListaContatos extends StatelessWidget {
  const ListaContatos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Contatos'),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text('Ana'),
            subtitle: Text('(12) 99999-1111'),
            trailing: Icon(Icons.phone),
          ),

          Divider(),

          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text('Carlos'),
            subtitle: Text('(12) 98888-2222'),
            trailing: Icon(Icons.phone),
          ),

          Divider(),

          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text('Juliana'),
            subtitle: Text('(12) 97777-3333'),
            trailing: Icon(Icons.phone),
          ),

          Divider(),

          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text('Lucas'),
            subtitle: Text('(12) 96666-4444'),
            trailing: Icon(Icons.phone),
          ),
        ],
      ),
    );
  }
}