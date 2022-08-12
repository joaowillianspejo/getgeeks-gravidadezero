## API Users

### Geeks

##### Cenário: Seja um geek

Dado que temos um usuário comum previamente cadastrado
E com um token valido
Quando faço uma requisição POST na rota /geeks
Então o status code deve ser igual a 201
E o perfil geek deve ser retornado ao consultar esse usuário na API Users
