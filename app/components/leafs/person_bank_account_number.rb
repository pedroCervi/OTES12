module Components::Leafs
  class PersonBankAccountNumber < Components::PersonComponent
    attr_accessor :value

    PATTERN = '[0-9]{5}-[0-9]{1}'.freeze

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
      :bank_account_number
    end
  end
end
