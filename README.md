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

POST api-pessoas/create<br/>
  params
    {
      name: 'João',
      email: 'joao@email.com'
    }<br/>

  retorno
    {
      id: 1
    }<br/>

GET api-pessoas/read<br/>
  params
    {
      id: 1
    }<br/>
  retorno
    {
      name: 'João',
      email: 'joao@email.com',
      age: '',
      gender: ''
    }<br/>

PUT api-pessoas/update<br/>
  params
    {
      id: 1,
      email: 'joao@joao.com'
    }<br/>
  retorno
    {
      id: 1
    }<br/>

DELETE api-pessoas/destroy<br/>
  params
    {
      id: 1
    }<br/>
  retorno
    {
      status: 'success'
    }<br/>

GET api-pessoas/index<br/>
  params
    {
      pages: 1
    }<br/>
  retorno
    [
      {
        name: 'João',
        email: 'joao@email.com'
        age: '',
        gender ''
      },
    ]<br/>
