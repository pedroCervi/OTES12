module Components::Composites
  class PersonBank < Components::PersonComponent
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
      :bank_composite
    end

    def subcomponents
      @subcomponents << Components::Leafs::PersonBankName.new(@person, @params[:bank_name])
      @subcomponents << Components::Leafs::PersonBankAgencyNumber.new(@person, @params[:bank_agency_number])
      @subcomponents << Components::Leafs::PersonBankAccountNumber.new(@person, @params[:bank_account_number])

      @subcomponents
    end
  end
end
