module Components::Leafs
  class PersonType < Components::PersonComponent
    attr_accessor :value

    VALID_TYPES = %w[user lead].freeze

    def initialize(person, value)
      @person = person
      @value = value

      valid? ? compose : compose_with_error(message: message)
    end

    def message
      'invalid'
    end

    def valid?
      return true if @value.blank?

      VALID_TYPES.include?(@value)
    end

    def type
      :person_type
    end
  end
end
