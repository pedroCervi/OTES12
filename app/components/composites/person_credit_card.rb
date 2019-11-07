module Components::Composites
  class PersonCreditCard < Components::PersonComponent
    def initialize(person, params)
      @person = person
      @params = params
      @subcomponents = []

      valid? ? compose(subcomponents: subcomponents) : compose_with_error
    end

    def valid?
      params = [
        @params[:credit_card_number],
        @params[:credit_card_flag]
      ]

      params.any? ? params.all? : true
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
