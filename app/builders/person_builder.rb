class PersonBuilder
  def initialize
    @person = Person.new
    @person.components = []
  end

  def self.build
    builder = new
    yield(builder)
    builder.person
  end

  def compose_basic_information(params)
    Components::Composites::PersonBasic.new(@person, params)
  end

  def compose_personal_information(params); end

  def compose_financial_information(params); end

  def person
    assemble

    @person
  end

  def assemble
    attributes = {}

    @person.components.each do |component|
      attributes[component.type.to_s] = component.value
    end

    @person.attributes = attributes
  end
end
