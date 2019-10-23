module Components::Leafs
  class PersonAge < Components::PersonComponent
    attr_accessor :value

    def initialize(person, value)
      @person = person
      @value = value

      valid? ? compose : compose_with_error
    end

    def valid?
      @value.blank? || @value.include?('')
    end

    def type
      :age
    end
  end
end
