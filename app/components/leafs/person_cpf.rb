module Components::Leafs
  class PersonCpf < Components::PersonComponent
    attr_accessor :value

    PATTERN = '[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}'.freeze

    def initialize(person, value)
      @person = person
      @value = value

      valid? ? compose : compose_with_error
    end

    def valid?
      return true if @value.blank?

      regex = Regexp.new(PATTERN)

      @value.match?(regex)
    end

    def type
      :cpf
    end
  end
end
