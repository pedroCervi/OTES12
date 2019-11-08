# OTES12
Repositório da disciplina 'Tópicos Avançados de Engenharia de Software'


#### API de pessoas

##### Objetivo
  Oferecer um serviço de controle de dados de pessoas para sistemas de múltiplas finalidades. Por exemplo, para sistemas que possuem usuários é possível salvar na people-api pessoas de tipo 'user' onde determinados parâmetros comuns de usuários são validados, como o email e nome. Ou, para sistemas que possuem pessoas de tipo 'lead', validar outros dados também como dados financeiros. A finalidade é desacoplar de sistemas modularizados a necessidade de guardar, validar, editar e deletar pessoas.

##### Oque faz
  Cria, lê, atualiza, deleta ou lista entidades 'pessoas' em um banco de dados.

##### Como faz
  Oferece endpoints públicos para operações REST em entidades 'pessoa'. Os endpoints recebem parâmetros que são validados no escopo do parâmetro em si, por exemplo: o número de cpf é válido? E ocorrem também validações no escopo da correlação de parâmetros, por exemplo: o número da agência bancária, o número da conta bancária e o nome do banco existem?<br/>

##### Oque permite
  A requisição pode informar o type da pessoa como 'user' ou 'lead'. No caso de 'user' é possível salvar dados de [email, cpf, name]. No caso de 'lead' é possível passar, além desses parâmetros, parâmetros de status financeiro da pessoa como: [bank_name, bank_account_number, bank_account_agency, credit_card_flag, credit_card_number]. Se o type da pessoa não for informado, é criada uma pessoa só com a informação de [email].

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


###### Exemplo de POST de tipo lead
```
  curl -d "type=lead" -d "email=some@email.com" -d "name=Dados Falsos" -d "cpf=794.857.642-86" -d "bank_name=Banco do Brasil" -d "bank_agency_number=1578" -d "bank_account_number=12344-0" -d "credit_card_number=4821531560040456" -d "credit_card_flag=Visa" -X POST https://salty-cove-05656.herokuapp.com/people
```

###### Exemplo de POST de tipo user
```
  curl -d "type=user" -d "email=some@email.com" -d "name=Dados Falsos" -d "cpf=794.857.642-86" -X POST https://salty-cove-05656.herokuapp.com/people
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

GET people/<br/>
  retorno
  [{"id":23,"email":"some@email.com","bank_name":"Banco do Brasil","bank_account_number":"12344-0","bank_agency_number":"1578","credit_card_number":"4821531560040456","credit_card_flag":"Visa","name":"pedro","cpf":"794.857.642-86","person_type":"lead"}, {"id":...}, ...]<br/>

###### Exemplo de GET de tipo lead
```
  curl -d "type=lead" -X GET https://salty-cove-05656.herokuapp.com/people
```

###### Exemplo de GET de tipo user
```
  curl -d "type=user" -X GET https://salty-cove-05656.herokuapp.com/people
```
