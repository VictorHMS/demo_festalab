# DemoFestalab

Modelo de cadastro de usuários DemoFestalab

### Versão do Ruby
    ruby-3.2.2

### Dependências
    bundle install

### Configurações
    rails db:create db:migrate db:seed

### Rodando a aplicação
    rails s

### Instruções
    Após clonar o projeto, entre na pasta dele: cd demo_festalab
    Execute a instalação de dependências: bundle install
    Configure o banco de dados: rails db:create db:migrate db:seed
    O campo db:seed pode ser omitido caso queira que o db comece vazio
    Rode a aplicação: rails s
    Ao abrir a aplicação, você será direcionado para a página de usuários
    Nela são exibidos os usuários cadastrados, e é possível realizar buscas por um usuário
    Cada usuário pode ser exibido, deletado e editado
    Existe um botão para cadastro de novos usuários
    Ao cadastrar/editar um usuário de maneira válida, ele serão exibidas as mudanças e ele estará disponível na página inicial


