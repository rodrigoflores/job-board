# Job Board #

Aplicação desenvolvida ao vivo no Secot - Semana de Computação e Tecnologia da UFSCAR - Sorocaba

## Dependências ##

* [Bundler](http://gembundler.com/)

## Para rodar ##

Instalar as gems necessárias

```ruby
bundle install
```
Configurar database.yml para usar o adaptador necessário para o banco de dados (atualmente está configurando para usar o MySQL). 

Criar banco de dados:

```ruby
bundle exec rake db:create
```

Rodar as migrações do banco

```ruby
bundle exec rake db:migrate
```

Iniciar o servidor:

```ruby
bundle exec rails server
```