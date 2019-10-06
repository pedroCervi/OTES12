# OTES12
Repositório da disciplina 'Tópicos Avançados de Engenharia de Software'


#### API de pessoas

##### objetivo
  armazenar dados de pessoas

##### oque faz
  CRUD para entidades 'pessoas' com dados de:
  [name, age, gender, email, cpf, birthday].
  As chamadas a esses endpoints serão logadas em serviço externo
  Haverá também uma opção no /create em que será possível 'gerar'
  uma pessoa randômica

##### como faz
  oferece endpoints publicos que recebem parametros que são validados,
  a validação de cpf e email será com uma api publica
  e devolvem uma resposta ao serviço que requisitou

##### oque permite
  receber dados em formato json onde cada endpoint exige determinados
  parametros



##### Exemplos

POST people/create<br/>
  params
    {
      email: 'joao@email.com'
    }<br/>
  retorno
    {
      id: 1
    }<br/>

```
  curl +X POST https://salty-cove-05656.herokuapp.com/people?email=<email>
```

GET people/<id><br/>
  params
    {
      id: 1
    }<br/>
  retorno
    {
      email: 'joao@email.com',
    }<br/>

```
  curl +X GET https://salty-cove-05656.herokuapp.com/people/<id>
```

PUT people/<id><br/>
  params
    {
      id: 1,
      email: 'joao@joao.com'
    }<br/>
  retorno
    {
      id: 1
    }<br/>

```
  curl +X PUT https://salty-cove-05656.herokuapp.com/people/<id>?email=<email>
```

DELETE people/<id><br/>
  params
    {
      id: 1
    }<br/>
  retorno
    {
      status: 'success'
    }<br/>

```
  curl +X DELETE https://salty-cove-05656.herokuapp.com/people/<id>
```

##### Not yet implemented
GET people/index<br/>
  params
    {
      pages: 1
    }<br/>
  retorno
    [
      {
        email: 'joao@email.com'
      },
    ]<br/>
