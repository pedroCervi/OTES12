class PersonBuilder
  def initialize
    @person = Person.new
  end

  def self.build
    builder = new
    yield(builder)
    builder.person
  end

  def compose_basic_information(params)
    @person.email = params['email']
  end

  def compose_personal_information(params); end

  def compose_financial_information(params); end

  def person
    @person
  end
end
