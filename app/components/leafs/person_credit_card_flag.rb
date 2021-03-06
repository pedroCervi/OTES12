module Components::Leafs
  class PersonCreditCardFlag < Components::PersonComponent
    attr_accessor :value

    FLAGS = %w[Visa Mastercard].freeze

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

      FLAGS.include?(@value)
    end

    def type
      :credit_card_flag
    end
  end
end
