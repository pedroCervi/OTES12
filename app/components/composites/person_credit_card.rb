module Components::Composites
  class PersonCreditCard < Components::PersonComponent
    def initialize(person, params)
      @person = person
      @params = params
      @subcomponents = []

      valid? ? compose(subcomponents: subcomponents) : compose_with_error(message: message)
    end

    def missing_params
      required_params = %i[credit_card_number credit_card_flag].freeze
      @missing_params = []

      required_params.each do |param_name|
        @params[param_name].present? ? nil : @missing_params << param_name
      end

      @missing_params
    end

    def valid?
      params = [
        @params[:credit_card_number],
        @params[:credit_card_flag]
      ]

      params.any? ? missing_params.blank? : true
    end

    def message
      "Missing params: #{missing_params}"
    end

    def type
      :credit_card_composite
    end

    def subcomponents
      @subcomponents << Components::Leafs::PersonCreditCardNumber.new(@person, @params[:credit_card_number])
      @subcomponents << Components::Leafs::PersonCreditCardFlag.new(@person, @params[:credit_card_flag])

      @subcomponents
    end
  end
end
