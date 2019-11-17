module Components::Leafs
  class PersonBankName < Components::PersonComponent
    attr_accessor :value

    BANKS = ['Banco do Brasil'].freeze

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

      BANKS.include?(@value)
    end

    def type
      :bank_name
    end
  end
end
