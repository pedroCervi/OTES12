module Components::Leafs
  class PersonCpf < Components::PersonComponent
    attr_accessor :value

    def initialize(person, value)
      @person = person
      @value = value

      valid? ? compose : compose_with_error
    end

    def valid?
      @value.include?('')
    end

    def type
      :cpf
    end
  end
end
