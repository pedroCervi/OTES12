module Components::Leafs
  class PersonCreditCardNumber < Components::PersonComponent
    attr_accessor :value

    PATTERN = '(?:4[0-9]{12}(?:[0-9]{3})?|[25][1-7][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})'.freeze

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

      regex = Regexp.new(PATTERN)

      @value.match?(regex)
    end

    def type
      :credit_card_number
    end
  end
end
