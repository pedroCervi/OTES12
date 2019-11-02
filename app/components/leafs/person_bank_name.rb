module Components::Leafs
  class PersonBankName < Components::PersonComponent
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
      :bank_name
    end
  end
end