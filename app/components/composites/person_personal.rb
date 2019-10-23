module Components::Composites
  class PersonPersonal < Components::PersonComponent
    def initialize(person, params)
      @person = person
      @params = params
      @subcomponents = []

      valid? ? compose(subcomponents: subcomponents) : compose_with_error
    end

    def valid?
      true
    end

    def type
      :personal_composite
    end

    def subcomponents
      @subcomponents << Components::Leafs::PersonCpf.new(@person, @params[:cpf])
      @subcomponents << Components::Leafs::PersonAge.new(@person, @params[:age])

      @subcomponents
    end
  end
end
