# Qualidade de código

Pontos que buscam melhorar a qualidade dos aplicativos, para serem aplicados no código, tendo como objetivo a implementação desses conceitos no código do projeto desse repositório


## 📋 Clean Code

O principal objetivo do clean code é produzir código legivel, fácil de dar manutenção e que busque reduzir a complexidade

### Algumuns princípios e práticas

- Nomes significativos
- Evitar comentários
- Manter estilo de identação
- Evitar códigos duplicados

#### Referência

 - [Aprenda como Escrever Código Limpo com o CLEAN CODE](https://www.youtube.com/watch?v=6za9ZWZzWdA)

## 🔧 Design Pattern

Tem como objetivo oferecer abordagens que ajudam os desenvolvedores a criar sistemas mais flexiveis, reutilizáveis e fáceis de Manter

- Padrões de Criação: Lidam com a criação de objetos. Exemplos: Singleton, Factory Method, Abstract Factory, Builder, etc.

- Padrões de Estrutura: Focam na composição de classes e objetos para formar estruturas maiores. Exemplos: Adapter, Bridge, Decorator, Facade, etc.

- Padrões Comportamentais: Tratam de como os objetos interagem e distribuem responsabilidades. Exemplos: Observer, Strategy, Command, Iterator, etc.

#### Singleton
O padrão singleton faz com que determinado obvjeto tenha apenas uma instância, em que é utilizado globalmente pelo sistema

#### Referência

 - [Singleton Pattern aplicado no mundo real, criando uma conexão com o banco de dados SQLite](https://www.youtube.com/watch?v=Yx-45aj4sBI)

#### Factory
O padrão factory permite com que os desenvolvedores criem objetos que podem serem recriados a partir deles

#### Referência

 - [Criando uma fábrica de AlertDialog e como abrir um Dialog sem contexto](https://www.youtube.com/watch?v=oy9_7fEiBl4&t)

## 📦 Clean architecture

É um conceito que nos trás a idéia de separação do projetos em camadas para torna-las mais idependentes e desacopladas, em que as camadas mais centrais contem as regras de negócio e as pais externas as implementações

#### Exemplo de estrutura

- Data
  - datasources
  - repositories
  - mappers
- Domain
    - entities
    - repositories
    - usecases
- Presentation
    - pages
    - widgets
    - controllers

#### Referência

 - [Flutter TDD Clean Architecture (Arquitetura Limpa): #1 Pra quê?](https://www.youtube.com/watch?v=odr59ZAx-IU&list=PLnFA4SZ9y0T5FA2dFdNh6NLD6Rm6GB6x7)

## 🎁 S.O.L.I.D

É a junção das inicias de cinco conceitos que, trazem para o código: facilidade de entendimento, reaproveitamento, facilidade de refatoração, testabilidade e poucos bugs

### São eles:
- S (single responsabilities): Responsabilidade única, quer dizer que uma classe deve tratar apenas de um assunto.

```dart
abstract class AuthDatasource {
  Future<UserEntity> login(String email, String password);
  Future<UserEntity> register(UserEntity user);
  Future<UserEntity> validateToken(String token);
}
```
Nesse caso, essa classe só trata de casos de autenticação do usuário

- O (open/close): A classe deve ser fechada para modificações e aberta para extensões.

- L (Liskov substitution): Os objetos de classes derivadas podem ser substituidas por objetos de classe pai.

- I (interface segregation): Principio que nos leva a quebrar uma interface grande em outras menores.

- D (dependency inversion): Esse principio nos diz que,as classes que dependem de outras, devem depender da abstração ao invés da classe concreta.

```dart
class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _authDatasource;

  AuthRepositoryImpl({required AuthDatasource authDatasource})
      : _authDatasource = authDatasource;

  @override
  Future<UserEntity> login(String email, String password) {
    return _authDatasource.login(email, password);
  }

  @override
  Future<UserEntity> register(UserEntity user) {
    return _authDatasource.register(user);
  }

  @override
  Future<UserEntity> validateToken(String token) {
    return _authDatasource.validateToken(token);
  }
}
```

Nesse Exemplo a classe AuthRepositoryImpl depende de AuthDatasource que é uma interface de AuthDatasourceImpl

#### Referência

 - [AULÃO - Tudo sobre arquitetura limpa no Flutter](https://www.youtube.com/watch?v=5NAmPRkLgMk&t)

 ---
⌨️ com ❤️ por [Filipe Haniel](https://github.com/FilipeHaniel) 😊
