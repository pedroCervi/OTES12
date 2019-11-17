module Components::Leafs
  class PersonBankAgencyNumber < Components::PersonComponent
    attr_accessor :value

    PATTERN = '[0-9]{4}'.freeze

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
      :bank_agency_number
    end
  end
end
