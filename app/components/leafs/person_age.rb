module Components::Leafs
  class PersonAge < Components::PersonComponent
    attr_accessor :value

    def initialize(person, value)
      @person = person
      @value = value

      valid? ? compose : compose_with_error
    end

    def valid?
      return true if @value.blank?
      return false if @value.to_i < 18

      @value.include?('')
    end

    def type
      :age
    end
  end
end
