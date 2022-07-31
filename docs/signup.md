### User Story - Cadastro de clientes

BDD (Behavior Driven Development)

> Sendo um visitante que deseja contratar serviços de TI
> Posso fazer o meu cadastro
> Para que eu possa buscar por prestadores de serviços (Geeks)

##### Cenário: Cadastro de cliente

Dado que acesso a página de cadastro
Quando faço o meu cadastro com o nome completo, e-mail e senha
Então vejo a mensagem de boas vindas:
"Agora você faz parte da Getgeeks. Tenha uma ótima experiência."

##### Cenário: E-mail duplicado

Dado que acesso a página de cadastro
Porem o meu e-mail já foi cadastrado
Quando faço o meu cadastro com o nome completo, e-mail e senha
Então vejo a mensagem de alerta:
"Oops! Já temos um usuário com o e-mail informado."

##### Cenário: Email com formato incorreto

Dado que acesso a página de cadastro
Quando faço o meu cadastro com um email incorreto
Então vejo a mensagem de alerta "O email está estranho"

##### Cenário: Campos obrigatórios

Dado que acesso a página de cadastro
Quando submeto o cadastro sem preencher o formulário
Então devo ver uma mensagem informando que todos os campos são obrigatórios

##### Cenário: Senha muito curta

Dado que acesso a página de cadastro
Quando submeto o cadastro com uma senha com menos de 6 digitos
Então vejo a mensagem de alerta "Informe uma senha com pelo menos 6 caracteres"

##### Desafio 1 do Módulo Pro

Automatizar 3 novos cenários de testes:

- Email obrigatório
- Senha obrigatória
- Campos obrigatórios

##### Cenário: Seja um Geek

Dado que eu tenha um usuário comum
E faço login na plataforma Getgeeks
Quando submeto o formulário para me tornar um Geek (prestador de serviços)
Então devo ver a mensagem de sucesso
