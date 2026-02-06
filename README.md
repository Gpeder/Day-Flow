# 🗓️ Day Flow

O **Day Flow** é um aplicativo de organização pessoal desenvolvido em Flutter. Ele ajuda a gerenciar tarefas diárias, compromissos no calendário e metas pessoais de forma simples e visual.

## 📱 Telas do App

<div style="display: flex; flex-direction: row; overflow-x: auto; gap: 10px;">
  <img src="screenshots/Screenshot_1770381095.png" width="180" alt="Tela 1" />
  <img src="screenshots/Screenshot_1770381097.png" width="180" alt="Tela 2" />
  <img src="screenshots/Screenshot_1770381103.png" width="180" alt="Tela 3" />
  <img src="screenshots/Screenshot_1770381107.png" width="180" alt="Tela 4" />
  <img src="screenshots/Screenshot_1770381112.png" width="180" alt="Tela 5" />
</div>

<br>

## ✨ Funcionalidades

* **Home:** Visão geral das atividades do dia.
* **Tarefas:** Criação, edição e exclusão de tarefas.
* **Calendário:** Visualização mensal e seleção de datas.
* **Categorias:** Organização por tipos (Trabalho, Pessoal, etc).
* **Perfil:** Gerenciamento de dados do usuário.

## 🛠️ Tecnologias

* **Linguagem:** Dart
* **Framework:** Flutter
* **Gerenciamento de Estado:** Controller (MVC)
* **Widgets:** Customizados (Botões, Inputs, Cards)

## 📂 Estrutura do Projeto

O projeto segue o padrão **MVC** (Model-View-Controller) para facilitar a leitura:

* `lib/controller`: Lógica de controle (Home, Calendário).
* `lib/model`: Modelos de dados (Tarefa, Categoria).
* `lib/view`: Telas do aplicativo (Home, Tarefas, Perfil).
* `lib/widgets`: Componentes visuais reutilizáveis.

## 🚀 Como Rodar

1.  **Clone o projeto:**
    ```bash
    git clone [https://github.com/seu-usuario/day-flow.git](https://github.com/seu-usuario/day-flow.git)
    ```

2.  **Instale as dependências:**
    ```bash
    flutter pub get
    ```

3.  **Execute o App:**
    ```bash
    flutter run
    ```
