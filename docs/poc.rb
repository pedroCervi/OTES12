# Exemplo:

# a API recebe um post na URL people-api/new com os seguintes parametros:
# { name: 'Pedro', email: 'pedro@email.com' }

# a rota peole-api/new vai redirecionar para o controller people_controller
# na função create.

# essa função chamará uma instância da classe people_builder e nessa instância
# chamará a função build passando para ela os parametros recebidos no post.
# Dentro da função build será chamada a função add_part da classe
# people_composite_part instanciando uma people_part que rodará as validações
# necessárias de cada parametro.

# POC do código abaixo:

class PeopleController
  def create(params)
    builder = PeopleBuilder.new
    person = builder.build_person(params)

    person.save
  end
end

class PeopleBuilder < PersonCompositePart
  def initialize(params)
    params.each do |param|
      add_part(param)
    end
  end
end

class PersonCompositePart < Part
  def initialize(name)
    super(name)
    @sub_parts = []
  end

  def add_part(part)
    @sub_parts << part
    part.parent = self
  end
end

class PersonPart
  attr_accessor :name, :parent

  def initialize(name)
    @name = name
    @parent = nil
  end
end
