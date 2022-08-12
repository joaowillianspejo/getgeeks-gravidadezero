## API Users

### Users

##### Cenário: Remover usuário

Dado que existe um usuário no sistema
E tenho o token desse usuário
Quando faço uma requisição DELETE na rota /users
Então o status code deve ser igual a 204 (no content)
E quando realizar uma nova requisição GET na rota /users com o token do usuário removido deve retornar o status code 404 (not found)
