## API Users

### Sessions

##### Cenário: Login do usuário

Dado que o usuário submeteu o formulário de login com os dados corretos
Quando faço uma requisição POST para a rota /sessions
Então o status code deve ser igual a 200
E deve retornar um token JWT na resposta
E esse token deve expirar em 10 dias

##### Cenário: Senha incorreta

Dado que o usuário submeteu o formulário de login com a senha invalida
Quando faço uma requisição POST para a rota /sessions
Então o status code deve ser igual a 401
E deve retornar a mensagem de erro "Unauthorized"

##### Cenário: Usuário não encontrado

Dado que o usuário submeteu o formulário de login com um email não cadastrado
Quando faço uma requisição POST para a rota /sessions
Então o status code deve ser igual a 401
E deve retornar a mensagem de erro "Unauthorized"

##### Cenário: Formato de email invalido

Dado que o usuário submeteu o formulário de login com um email em um formato invalido
Quando faço uma requisição POST para a rota /sessions
Então o status code deve ser igual a 400
E deve retornar a mensagem de erro "Incorrect email"

##### Cenário: Email em branco

Dado que o usuário submeteu o formulário de login com o email em branco
Quando faço uma requisição POST para a rota /sessions
Então o status code deve ser igual a 400
E deve retornar a mensagem de erro "Required email"

##### Cenário: Sem o atributo email

Dado que o usuário submeteu o formulário de login sem o atributo email
Quando faço uma requisição POST para a rota /sessions
Então o status code deve ser igual a 400
E deve retornar a mensagem de erro "Required email"

##### Cenário: Senha em branco

Dado que o usuário submeteu o formulário de login com a senha em branco
Quando faço uma requisição POST para a rota /sessions
Então o status code deve ser igual a 400
E deve retornar a mensagem de erro "Required password"

##### Cenário: Sem o atributo password

Dado que o usuário submeteu o formulário de login sem o atributo password
Quando faço uma requisição POST para a rota /sessions
Então o status code deve ser igual a 400
E deve retornar a mensagem de erro "Required password"
