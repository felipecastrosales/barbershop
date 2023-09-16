<p align="center">
    <img src="assets\images\imgLogo.png" width="100" alt="Logo Barbershop App" />
</p>

<h1 align="center">Barbershop App</h1>

---

<h2>Topics 📋</h2>

- [📖 Sobre](#-about)
- [📱 Preview](#-preview)
- [📦 Assets](#-assets)
- [🛠️ Features and Technologies Studied](#-features-and-technologies-studied)
- [🤯 Challenges and Learning along the way](#-challenges-and-learning-along-the-way)
- [🤔 How to use](#-how-to-use)
- [💪 How to contribute](#-how-to-contribute)
- [📝 License](#-license)

---

<h2>📖 About</h2>

An app for barber shop professionals, where it is possible to manage your own barber shop and even yourself. In addition to having the flow of scheduling appointments and controlling services.

---

<h2>📱 Preview</h2>

https://github.com/felipecastrosales/barbershop/assets/59374587/ff81c19d-851f-4148-9612-bb08fe8a7fb8

---

<h2>📦 Assets</h2>

- <a href="/api/postman/">**`Postman Collections`**</a>.
- <a href="https://www.figma.com/file/QRIXw1KKoFtR4JpTRehO3d/Barbershop?type=design&node-id=0%3A1&mode=design&t=p2w0dxWTvCJQZqdA-1">**`Figma`**</a>;
<img src="https://github.com/felipecastrosales/barbershop/assets/59374587/536a65a6-bfd4-4901-adac-05cc70f6b690" alt="" width="100%"/>

---   

<h2>🛠️ Features and Technologies Studied</h2>

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

<h2>🤯 Challenges and Learning along the way</h2>

Without a doubt, the biggest learning experience was Riverpod; I realized that it is very interesting for managing the state of an application, going further in points that can be crucial (such as being able to have multiple providers of the same type, performing dispose when it is no longer used, among other things).

Furthermore, it was really cool to learn more about the powers and uses of Dart 3 in practice, such as the new `switch` and the use of `pattern matching`; which fit very well and make the code more objective. Another point that was very interesting was the `Either` used, similar to what is [in this article](https://codewithandrea.com/articles/flutter-exception-handling-try-catch-result-type/); without any external dependency. You can use functional programming with `pattern matching` to handle error and success cases.

Various other learnings were acquired and also reinforced; in addition to refactorings and code improvements made along the way. There is always something to be improved and learned. 🚀

---

<h2>🤔 How to use</h2>

```
Configure the Flutter environment on your machine:
https://flutter.dev/docs/get-started/install

- Clone the repository:
$ git clone https://github.com/felipecastrosales/barbershop

- Enter the directory:
$ cd barbershop

- Open the project:
$ code .

- Install the json_rest_server:
$ dart pub global activate json_rest_server

- Enter the api directory:
$ cd api

- Run the server:
$ json_rest_server run

- Enter the project directory:
$ flutter pub get

- Get your IP and put on `rest_client.dart`;

- Execute the application:
$ flutter run
```

---

<h2>💪 How to contribute</h2>

There are several ways to contribute to this project, such as:

```
- Fork this repository;

- Create a branch with your feature:
$ git checkout -b my-feature

- Commit your changes:
$ git commit -m "feature: My new feature"

- Push your branch:
$ git push origin my-feature

- Open a pull request on this repository and/or create an issue explaining your problem.
```

---

<h2>📝 License</h2>

This repository is under the MIT License, and you can see it in the <a href="https://github.com/felipecastrosales/barbershop/blob/master/LICENSE">LICENSE</a> file for more details.

---

> This project was developed with ❤️ by **[@Felipe Sales](https://www.linkedin.com/in/felipecastrosales/)**, with the instructor **[@Rodrigo Rahman](https://linkedin.com/in/rodrigo-rahman)**.
If this helped you, give it a ⭐, and contribute, it will help me too. 😉

---

<div align="center">

[![Linkedin Badge](https://img.shields.io/badge/-Felipe%20Sales-292929?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/felipecastrosales/)](https://www.linkedin.com/in/felipecastrosales/)

</div>
