<h3> Gerenciamento de Tarefas - Hubtec Teste</h3>

<h5>Descrição</h5>
Esse sistema, fruto de um desafio proposto pela empresa Hubtec Fortaleza, 
tem como principal objetivo auxiliar os usuários no gerenciamento de suas tarefas diárias.
<br/>
<a href="https://stormy-crag-32938.herokuapp.com/">Clique aqui para ver o sistema rodando no Heroku.</a>

<hr/>
<h5>Linguagens, Frameworks e Tecnologias utilizados</h5>
 - Ruby on Rails 5.2.3
 - Jquery
 - Bootstrap 4.3
 - Font awesome

<h5>Para executar o sistema localmente</h5>

1. Download do projeto

```bash
git clone https://github.com/davimelovasc/hubtec-to-do-app
```

2. Na pasta do projeto, instale as gems de dependência

```bash
bundle install
```

3. Crie o banco de dados e suas respectivas tabelas:

```bash
bundle exec rake db:create db:migrate
```

4. Inicie o servidor localmente:

```bash
rails s
```
