module Components::Composites
  class PersonFinancial < Components::PersonComponent
    def initialize(person, params)
      @person = person
      @params = params
      @subcomponents = []

      valid? ? compose(subcomponents: subcomponents) : compose_with_error
    end

    def valid?
      true
    end

    def type
      :financial_composite
    end

    def subcomponents
      @subcomponents << Components::Composites::PersonBank.new(@person, @params)
      @subcomponents << Components::Composites::PersonCreditCard.new(@person, @params)

      @subcomponents
    end
  end
end
