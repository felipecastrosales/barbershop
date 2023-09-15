<p align="center">
    <img src="assets\images\imgLogo.png" width="100" alt="Logo Barbershop App" />
</p>

<h1 align="center">Barbershop App</h1>

---

<h2>Tópicos 📋</h2>

- [📖 Sobre](#-sobre)
- [📱 Preview](#-preview)
- [📦 Assets](#-assets)
- [🛠️ Funcionalidades e Tecnologias Estudadas](#%EF%B8%8F-funcionalidades-e-tecnologias-estudadas)
- [🤯 Desafios e Aprendizados ao longo do caminho](#-desafios-e-aprendizados-ao-longo-do-caminho)
- [🤔 Como usar](#-como-usar)
- [💪 Como contribuir](#-como-contribuir)
- [📝 Licença](#-licença)

---

<h2>📖 Sobre</h2>

Aplicativo de Barbearia para profissionais, onde é possível ter o gerenciamento dos próprios e até de si próprio. Além de possuir o fluxo de agendamento de horários e controle de serviços.

---

<h2>📱 Preview</h2>

https://github.com/felipecastrosales/barbershop/assets/59374587/ff81c19d-851f-4148-9612-bb08fe8a7fb8

---

<h2>📦 Assets</h2>

- <a href="/api/postman/">**`Postman Collections`**</a>.
- <a href="https://www.figma.com/file/QRIXw1KKoFtR4JpTRehO3d/Barbershop?type=design&node-id=0%3A1&mode=design&t=p2w0dxWTvCJQZqdA-1">**`Figma`**</a>;
<img src="https://github.com/felipecastrosales/barbershop/assets/59374587/536a65a6-bfd4-4901-adac-05cc70f6b690" alt="" width="100%"/>

---   

<h2>🛠️ Funcionalidades e Tecnologias Estudadas</h2>

- Using Dart 3 powers:
  - Functional Programming (Either) with Pure Dart (using Dart 3 power);
  - Using a lot `switch` ways;
  - Using `pattern matching` etc.
- Postman Collections;
- Themes, help extensions, constants helpers, custom exceptions and more;
- Rest Client with Dio and Interceptors;
- Login, Register and Logout flow;
- Screens
  - Splash;
  - Register (account, establishment and professional);
  - Login;
  - Home (customized for each user);
  - Schedule;
  - Employee flow;
  - Calendar flow;
- Packages:
  - [asyncstate](https://pub.dev/packages/asyncstate)
  - [dio](https://pub.dev/packages/dio)
  - [intl](https://pub.dev/packages/intl)
  - [loading_animation_widget](https://pub.dev/packages/loading_animation_widget)
  - [pretty_dio_logger](https://pub.dev/packages/pretty_dio_logger)
  - [shared_preferences](https://pub.dev/packages/shared_preferences)
  - [syncfusion_flutter_calendar](https://pub.dev/packages/syncfusion_flutter_calendar)
  - [table_calendar](https://pub.dev/packages/table_calendar)
  - [top_snackbar_flutter](https://pub.dev/packages/top_snackbar_flutter)
  - [validatorless](https://pub.dev/packages/validatorless)
  - [build_runner](https://pub.dev/packages/build_runner)
  - [custom_lint](https://pub.dev/packages/custom_lint)
  - [flutter_lints](https://pub.dev/packages/flutter_lints)
  - [riverpod_annotation](https://pub.dev/packages/riverpod_annotation), [riverpod_generator](https://pub.dev/packages/riverpod_generator), [riverpod_lint](https://pub.dev/packages/riverpod_lint)
- Dentre outras coisas. 🔥

---

<h2>🤯 Desafios e Aprendizados ao longo do caminho</h2>

Sem dúvidas o maior aprendizado foi o Riverpod; percebi que ele é bem interessante para o gerenciamento de estado de uma aplicação, indo além em pontos que podem ser cruciais (como poder ter múltiplos providers do mesmo tipo, realizar dispose quando não é mais utilizado entre outras coisas). 

Além disso, foi bem bacana conhecer mais na prática os poderes e uso do Dart 3, como o novo `switch` e o uso do `pattern matching`; que se encaixam muito bem e tornam o código mais objetivo. Outro ponto que foi bem interessante foi o `Either` utilizado, semelhante ao que há [neste artigo](https://codewithandrea.com/articles/flutter-exception-handling-try-catch-result-type/); sem nenhuma dependência externa. Podendo utilizar da programação funcional com o `pattern matching` para tratar os casos de erro e sucesso.

Outros vários aprendizados foram adquiridos e também reforçados; além de refatorações e melhorias no código feitas ao longo do caminho. Sempre há algo a ser melhorado e aprendido. 🚀

---

<h2>🤔 Como usar</h2>

```
Configure o ambiente de desenvolvimento na sua máquina:
https://flutter.dev/docs/get-started/install

- Clone o repositório:
$ git clone https://github.com/felipecastrosales/barbershop

- Entre no diretório:
$ cd barbershop

- Abra no VSCode:
$ code .

- Instale o json_rest_server:
$ dart pub global activate json_rest_server

- Inicie o json_rest_server:
$ cd api

- Execute:
$ json_rest_server run

- Instale as dependências:
$ flutter pub get

- Pegue seu ip e ponha no `rest_client`;

- Execute o projeto:
$ flutter run
```

---

<h2>💪 Como contribuir</h2>

Há várias maneiras de contribuir com esse projeto, como:
```
- Faça um fork o projeto.

- Crie uma nova branch com suas mudanças:
$ git checkout -b my-feature

- Salve suas mudanças e faça uma mensagem de commit message sobre suas alterações:
$ git commit -m "feature: My new feature"

- Envie suas mudanças:
$ git push origin my-feature

- Você também abrir uma issue para reportar um bug ou sugerir uma nova feature.
```

---

<h2>📝 Licença</h2>

Esse repositório está sobre a Licença MIT, e você pode vê-la no arquivo <a href="https://github.com/felipecastrosales/barbershop/blob/master/LICENSE">LICENSE</a> para mais detalhes. 😉

---

>Esse projeto foi desenvolvido com ❤️ por **[@Felipe Sales](https://www.linkedin.com/in/felipecastrosales/)**, com o instrutor **[@Rodrigo Rahman](https://br.linkedin.com/in/rodrigo-rahman)**.
Se isso te ajudou, dê uma ⭐, e contribua, isso irá me ajudar também. 😉

---

<div align="center">

[![Linkedin Badge](https://img.shields.io/badge/-Felipe%20Sales-292929?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/felipecastrosales/)](https://www.linkedin.com/in/felipecastrosales/)

</div>
