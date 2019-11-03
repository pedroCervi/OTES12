# OTES12
Repositório da disciplina 'Tópicos Avançados de Engenharia de Software'


#### API de pessoas

##### Objetivo
  Oferecer um serviço de controle de dados de pessoas para sistemas de múltiplas finalidades. Por exemplo, para sistemas que possuem usuários é possível salvar na people-api pessoas de tipo 'user' onde determinados parâmetros comuns de usuários são validados, como o email e nome. Ou, para sistemas que possuem pessoas de tipo 'lead', validar outros dados também como dados financeiros. A finalidade é desacoplar de sistemas modularizados a necessidade de guardar, validar, editar e deletar pessoas.

##### Oque faz
  Cria, lê, atualiza ou deleta entidades 'pessoas' em um banco de dados.

##### Como faz
  Oferece endpoints públicos para operações REST em entidades 'pessoa'. Os endpoints recebem parâmetros que são validados no escopo do parâmetro em si, por exemplo: o número de cpf é válido? E ocorrem também validações no escopo da correlação de parâmetros, por exemplo: o número da agência bancária, o número da conta bancária e o nome do banco existem?<br/>

##### Oque permite
  A requisição pode informar o type da pessoa como 'user' ou 'lead'. No caso de 'user' é possível salvar dados de [email, cpf, name]. No caso de 'lead' é possível passar, além desses parâmetros, parâmetros de status financeiro da pessoa como: [bank_name, bank_account_number, bank_account_agency, credit_card_flag, credit_card_number]. Se o type da pessoa não for informado, é criada uma pessoa só com a informação de [email]. No endpoint /create é possível também passar uma opção random [TODO] que gera uma pessoa randômica do tipo escolhido.

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
