module Components::Composites
  class PersonBank < Components::PersonComponent
    def initialize(person, params)
      @person = person
      @params = params
      @subcomponents = []

      valid? ? compose(subcomponents: subcomponents) : compose_with_error(message: message)
    end

    def missing_params
      required_params = %i[bank_name bank_agency_number bank_account_number].freeze
      @missing_params = []

      required_params.each do |param_name|
        @params[param_name].present? ? nil : @missing_params << param_name
      end

      @missing_params
    end

    def valid?
      params = [
        @params[:bank_name],
        @params[:bank_agency_number],
        @params[:bank_account_number]
      ]

      params.any? ? missing_params.blank? : true
    end

    def message
      "Missing params: #{missing_params}"
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
