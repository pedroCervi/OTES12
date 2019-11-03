module Components::Leafs
  class PersonName < Components::PersonComponent
    attr_accessor :value

    def initialize(person, value)
      @person = person
      @value = value

      valid? ? compose : compose_with_error
    end

    def valid?
      return true if @value.blank?

      @value.include?('')
    end

    def type
      :name
    end
  end
end
